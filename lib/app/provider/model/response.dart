import 'package:dio/dio.dart';

class BapsangHttpResponse {
  dynamic data;

  BapsangHttpResponse({
    this.data,
  });

  factory BapsangHttpResponse.fromDioResponse(Response dioResponse) =>
      BapsangHttpResponse(
        data: dioResponse.data,
      );
}
