import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/app_setup/network/interceptors.dart';
import 'package:quizz/utils/endpoints.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = const Duration(seconds: 30); // 30 sec
  dio.options.receiveTimeout = const Duration(seconds: 30);
  dio.options.contentType = Headers.jsonContentType;
  dio.interceptors.addAll([
    LogInterceptor(),
    AppInterceptors(ref, dio),
  ]);
  return dio;
});
