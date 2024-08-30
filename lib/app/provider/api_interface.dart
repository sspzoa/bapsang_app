import 'dart:async';
import 'dart:convert';
import 'package:bapsang_app/app/provider/model/response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiProvider {
  late Dio dio = Dio();

  ApiProvider() {
    dio = Dio(BaseOptions(
      headers: {
        'Authorization': 'Bearer ${dotenv.env['ACCESS_TOKEN']}',
        'Accept': 'application/json',
      },
    ));
  }

  Future<BapsangHttpResponse> get(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    Response dioResponse =
        await dio.get(path, queryParameters: queryParameters, options: options);
    return BapsangHttpResponse.fromDioResponse(dioResponse);
  }

  Future<Stream<Map<String, dynamic>>> getStream(String path) async {
    Response<ResponseBody> dioResponse = await dio.get(
      path,
      options: Options(
        headers: {"Accept": "text/event-stream"},
        responseType: ResponseType.stream,
      ),
    );
    return dioResponse.data!.stream.transform(
      StreamTransformer.fromHandlers(
        handleData: (rawdata, sink) {
          String strData = String.fromCharCodes(rawdata);
          String formatedData =
              strData.substring(strData.indexOf('{'), strData.indexOf('}') + 1);
          Map<String, dynamic> data = json.decode(formatedData);

          sink.add(data);
        },
      ),
    );
  }

  Future<BapsangHttpResponse> delete(String path, {dynamic data}) async {
    Response dioResponse = await dio.delete(path, data: data);
    return BapsangHttpResponse.fromDioResponse(dioResponse);
  }

  Future<BapsangHttpResponse> post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    Response dioResponse = await dio.post(path,
        data: data, queryParameters: queryParameters, options: options);
    return BapsangHttpResponse.fromDioResponse(dioResponse);
  }

  Future<BapsangHttpResponse> patch(String path, {dynamic data}) async {
    Response dioResponse = await dio.patch(path, data: data);
    return BapsangHttpResponse.fromDioResponse(dioResponse);
  }

  Future<BapsangHttpResponse> put(String path,
      {dynamic data, Options? options}) async {
    Response dioResponse = await dio.put(path, data: data, options: options);
    return BapsangHttpResponse.fromDioResponse(dioResponse);
  }
}
