import 'package:dio_riverpod_example/model/network_connect_state.dart';
import 'package:dio_riverpod_example/provider/common_api_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonApiRequestScreen extends StatelessWidget {
  const CommonApiRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Common API Request'),
      ),
      body: const CommonApiRequestContent(),
      bottomSheet: _TextField(),
    );
  }
}

class CommonApiRequestContent extends ConsumerWidget {
  const CommonApiRequestContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(commonApiViewStateNotifierProvider);
    final notifier = ref.read(commonApiViewStateNotifierProvider.notifier);

    final connectState = state.connectState;

    switch (connectState) {
      case NetworkConnectState.beforeConnect:
        Future(() => notifier.chat());
        return const Center(
          child: Text('Before connect'),
        );
      case NetworkConnectState.connecting:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case NetworkConnectState.connected:
        final content = state.response?.content ?? 'Empty Text';
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(content),
            ),
          ),
        );
    }
  }
}

class _TextField extends ConsumerWidget {
  const _TextField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    final notifier = ref.read(commonApiViewStateNotifierProvider.notifier);
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
              notifier.chat(prompt: controller.text);
              controller.clear();
            },
          ),
          border: OutlineInputBorder(),
          labelText: 'What do you want to say to AI?',
        ),
        onSubmitted: (text) {
          notifier.chat(prompt: text);
          controller.clear();
        },
      ),
    );
  }
}
