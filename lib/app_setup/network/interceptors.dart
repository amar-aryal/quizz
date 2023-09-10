import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppInterceptors extends Interceptor {
  AppInterceptors(this._ref, this._dio);
  final Ref _ref;
  final Dio _dio;
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    // code goes here
    // check and handle different status codes here

    return super.onResponse(response, handler);
  }

  @override
  Future<dynamic> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    // code goes here
    return super.onError(err, handler);
  }
}
