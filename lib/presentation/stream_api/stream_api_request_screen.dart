import 'package:dio_riverpod_example/model/network_connect_state.dart';
import 'package:dio_riverpod_example/model/response_model.dart';
import 'package:dio_riverpod_example/provider/stream_api_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreamApiRequestScreen extends StatelessWidget {
  const StreamApiRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream API Request'),
      ),
      body: Column(
        children: [
          Expanded(child: const StreamApiRequestContent()),
          _TextField(),
        ],
      ),
    );
  }
}

class StreamApiRequestContent extends ConsumerWidget {
  const StreamApiRequestContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(streamApiViewStateNotifierProvider);
    final notifier = ref.read(streamApiViewStateNotifierProvider.notifier);

    final connectState = state.connectState;

    switch (connectState) {
      case NetworkConnectState.beforeConnect:
        Future(() => notifier.chatStreaming());
        return const Center(
          child: Text('Before connect'),
        );
      case NetworkConnectState.connecting:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case NetworkConnectState.connected:
        return StreamView(state.response);
    }
  }
}

class StreamView extends ConsumerWidget {
  final List<CommonResponse> contents;

  const StreamView(List<CommonResponse>? stream, {super.key})
      : contents = stream ?? const [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(streamApiViewStateNotifierProvider);
    final scrollController = ScrollController();
    final contentStrings = state.contents;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });

    return Center(
      child: SingleChildScrollView(
        controller: scrollController,
        hitTestBehavior: HitTestBehavior.translucent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: RichText(
            text: TextSpan(
              children: contentStrings,
              style: TextStyle(color: Colors.black)
            ),
          ),
        ),
      ),
    );
  }
}

class _TextField extends ConsumerWidget {
  const _TextField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    final notifier = ref.read(streamApiViewStateNotifierProvider.notifier);
    return Container(
      height: 60,
      margin: const EdgeInsets.only(bottom: 28, top: 12),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        maxLines: 1,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              notifier.chatStreaming(prompt: controller.text);
              controller.clear();
            },
          ),
          border: OutlineInputBorder(),
          labelText: 'What do you want to say to AI?',
        ),
        onSubmitted: (text) {
          notifier.chatStreaming(prompt: text);
          controller.clear();
        },
      ),
    );
  }
}
