import 'package:dio_riverpod_example/provider/dio_provider.dart';
import 'package:dio_riverpod_example/repository/common_api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'common_api_client_provider.g.dart';

@riverpod
AndroidApiClient androidApiClient(Ref ref) {
  return AndroidApiClient(ref.read(dioProvider));
}

@riverpod
IOSApiClient iosApiClient(Ref ref){
  return IOSApiClient(ref.read(dioProvider));
}