import 'package:dio_riverpod_example/model/network_connect_state.dart';
import 'package:dio_riverpod_example/model/response_model.dart';

class CommonApiRequestScreenState {
  final NetworkConnectState connectState;
  final CommonResponse? response;

  const CommonApiRequestScreenState({
    NetworkConnectState? connectState,
    this.response,
  }) : connectState = connectState ?? NetworkConnectState.beforeConnect;

  CommonApiRequestScreenState copyWith({
    NetworkConnectState? connectState,
    CommonResponse? response,
  }) {
    return CommonApiRequestScreenState(
      connectState: connectState ?? this.connectState,
      response: response ?? this.response,
    );
  }
}