import 'dart:io';

import 'package:dio_riverpod_example/model/common_api_request_screen_state.dart';
import 'package:dio_riverpod_example/model/network_connect_state.dart';
import 'package:dio_riverpod_example/model/request_model.dart';
import 'package:dio_riverpod_example/model/response_model.dart';
import 'package:dio_riverpod_example/repository/common_api_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'common_api_view_state.g.dart';

@riverpod
class CommonApiViewStateNotifier extends _$CommonApiViewStateNotifier {
  @override
  CommonApiRequestScreenState build() {
    return CommonApiRequestScreenState();
  }

  Future<CommonResponse> _chat(String prompt) async {
    if (Platform.isAndroid) {
      final repository = ref.read(androidApiClientProvider);
      return repository.chat(CommonRequest(prompt: prompt));
    } else {
      final repository = ref.read(iosApiClientProvider);
      return repository.chat(CommonRequest(prompt: prompt));

    }
  }

  Future<void> chat({String prompt = 'Hello?'}) async {
    state = state.copyWith(connectState: NetworkConnectState.connecting);
    try {
      final response = await _chat(prompt);

      state = state.copyWith(
        connectState: NetworkConnectState.connected,
        response: response,
      );
    } catch (e) {
      state = state.copyWith(connectState: NetworkConnectState.connected);
    }
  }
}
