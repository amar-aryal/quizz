import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/app_setup/network/interceptors.dart';
import 'package:quizz/utils/endpoints.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = 60000; // 30 sec
  dio.options.receiveTimeout = 60000;
  dio.options.contentType = Headers.jsonContentType;
  dio.interceptors.addAll([
    LogInterceptor(),
    AppInterceptors(ref.read, dio),
  ]);
  return dio;
});
