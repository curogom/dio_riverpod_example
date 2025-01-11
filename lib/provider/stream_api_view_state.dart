import 'dart:io';

import 'package:dio_riverpod_example/model/network_connect_state.dart';
import 'package:dio_riverpod_example/model/request_model.dart';
import 'package:dio_riverpod_example/model/response_model.dart';
import 'package:dio_riverpod_example/model/stream_api_request_screen_state.dart';
import 'package:dio_riverpod_example/repository/common_api_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stream_api_view_state.g.dart';

@riverpod
class StreamApiViewStateNotifier extends _$StreamApiViewStateNotifier {
  @override
  StreamApiRequestScreenState build() {
    return StreamApiRequestScreenState();
  }

  Future<List<CommonResponse>> _chatStreaming(String prompt) {
    final CommonRequest request = CommonRequest(prompt: prompt);

    if (Platform.isAndroid) {
      final repository = ref.read(androidApiClientProvider);
      return repository.chatStreaming(request);
    } else {
      final repository = ref.read(iosApiClientProvider);
      return repository.chatStreaming(request);
    }
  }

  Future<void> chatStreaming({String prompt = 'Hello?'}) async {
    state = state.copyWith(connectState: NetworkConnectState.connecting, response: []);
    try {
      final response = await _chatStreaming(prompt);

      for (final res in response) {
        state = state.copyWith(
          connectState: NetworkConnectState.connected,
          response: [...state.response ?? [], res],
        );

        await Future.delayed(const Duration(milliseconds: 100));
      }
    } catch (e) {
      state = state.copyWith(connectState: NetworkConnectState.connected);
    }
  }

  Future<List<CommonResponse>> _bookingStreaming(String prompt) {
    final CommonRequest request = CommonRequest(prompt: prompt);

    if (Platform.isAndroid) {
      final repository = ref.read(androidApiClientProvider);
      return repository.bookingStreaming(request);
    } else {
      final repository = ref.read(iosApiClientProvider);
      return repository.bookingStreaming(request);
    }
  }

  Future<void> bookingStreaming({String prompt = 'Hello?'}) async {
    state = state.copyWith(connectState: NetworkConnectState.connecting, response: []);
    try {
      final response = await _bookingStreaming(prompt);

      for (final res in response) {
        state = state.copyWith(
          connectState: NetworkConnectState.connected,
          response: [...state.response ?? [], res],
        );

        await Future.delayed(const Duration(milliseconds: 25));
      }
    } catch (e) {
      state = state.copyWith(connectState: NetworkConnectState.connected);
    }
  }
}
