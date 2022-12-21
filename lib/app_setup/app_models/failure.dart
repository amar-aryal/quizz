import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

class Failure {
  ///
  Failure(this.reason, [this.code]);

  factory Failure.fromException(Object e) => Failure(
        e.toString(),
      );

  final String reason;

  final int? code;
}

extension DioErrorExtension on DioError {
  ///
  Failure get toFailure {
    _logError(this);

    var msg = message;

    bool isStatusCode = response?.statusCode == 400 ||
        response?.statusCode == 401 ||
        response?.statusCode == 403 ||
        response?.statusCode == 409 ||
        response?.statusCode == 422;

    if (isStatusCode && response?.data != null) {
      final data = response!.data as Map<String, dynamic>;
      final m = data['message'] as String?;
      if (m?.isNotEmpty ?? false) {
        msg = m!;
      }
    }

    switch (type) {
      case DioErrorType.cancel:
        return Failure(
          msg,
        );
      case DioErrorType.connectTimeout:
        return Failure(
          msg,
        );
      case DioErrorType.receiveTimeout:
        return Failure(
          msg,
        );
      case DioErrorType.response:
        return Failure(
          (response!.statusCode! >= 500) ? _handleError() : msg,
          response?.statusCode,
        );
      default:
        if (error.runtimeType == SocketException) {
          return Failure(
            'No internet! Please check your connection..',
            response?.statusCode,
          );
        }
        return Failure(
          msg,
          response?.statusCode,
        );
    }
  }

  String _handleError() {
    switch (response?.statusCode) {
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }
}

void _logError(DioError error) {
  log('''\n
    ERROR       :     ${error.error}\n
    MESSAGE     :     ${error.message}\n
    TYPE        :     ${error.type}\n
    DATA        :     ${error.response?.data}\n
    URI         :     ${error.response?.realUri}\n
    STATUS      :     ${error.response?.statusCode}\n
  ''');
}
