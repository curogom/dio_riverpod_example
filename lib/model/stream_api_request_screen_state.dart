import 'package:dio_riverpod_example/model/network_connect_state.dart';
import 'package:dio_riverpod_example/model/response_model.dart';
import 'package:flutter/material.dart';

class StreamApiRequestScreenState {
  final NetworkConnectState connectState;
  final List<CommonResponse>? response;

  const StreamApiRequestScreenState({
    NetworkConnectState? connectState,
    this.response,
  }) : connectState = connectState ?? NetworkConnectState.beforeConnect;

  List<TextSpan> get contents =>
      response?.map((e) => TextSpan(text: e.content)).toList() ?? [];

  StreamApiRequestScreenState copyWith({
    NetworkConnectState? connectState,
    List<CommonResponse>? response,
  }) {
    return StreamApiRequestScreenState(
      connectState: connectState ?? this.connectState,
      response: response ?? this.response,
    );
  }
}
