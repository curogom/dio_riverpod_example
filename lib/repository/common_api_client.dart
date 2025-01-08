import 'package:dio/dio.dart';
import 'package:dio_riverpod_example/model/request_model.dart';
import 'package:dio_riverpod_example/model/response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'common_api_client.g.dart';

@RestApi(baseUrl: 'https://10.0.2.2:7020/api/')
abstract class AndroidApiClient {
  factory AndroidApiClient(Dio dio, {String? baseUrl}) = _AndroidApiClient;

  @POST('/chat/complete')
  Future<CommonResponse> chat(@Body() CommonRequest request);

  @POST('/chat/complete/streaming')
  Future<List<CommonResponse>> chatStreaming(@Body() CommonRequest request);

  @POST('/bookings/streaming')
  Future<List<CommonResponse>> bookingStreaming(@Body() CommonRequest request);
}

@RestApi(baseUrl: 'https://localhost:7020/api/')
abstract class IOSApiClient {
  factory IOSApiClient(Dio dio, {String? baseUrl}) = _IOSApiClient;

  @POST('/chat/complete')
  Future<CommonResponse> chat(@Body() CommonRequest request);

  @POST('/chat/complete/streaming')
  Future<List<CommonResponse>> chatStreaming(@Body() CommonRequest request);

  @POST('/bookings/streaming')
  Future<List<CommonResponse>> bookingStreaming(@Body() CommonRequest request);
}


