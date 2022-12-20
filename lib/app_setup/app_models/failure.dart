import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

/// Custom object for handling failures and exceptions
class Failure {
  ///
  Failure(this.reason, [this.code]);

  factory Failure.fromException(Object e) => Failure(
        e.toString(),
      );

  final String reason;

  // final FailureType type;

  ///
  /// [code] is for logging, not to check failure condition
  ///
  final int? code;
}

/// Extension for [DioError]
/// Used to convert dioError into [Failure]
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

/// Different failure type
// class FailureType {
//   const FailureType._internal(this.code);

//   /// Code associated with [FailureType]
//   final int code;

//   /// Authentication failure [code] : -4
//   static const FailureType authentication = FailureType._internal(-4);

//   /// Failure caused by exceptions [code] : -3
//   static const FailureType exception = FailureType._internal(-3);

//   /// Unknown failure [code] : -2
//   static const FailureType unknown = FailureType._internal(-2);

//   /// No internet connection [code] : -1
//   static const FailureType internet = FailureType._internal(-1);

//   /// Request cancel [code] : 0
//   static const FailureType cancel = FailureType._internal(0);

//   /// Request time out [code] : 408
//   static const FailureType requestTimeout = FailureType._internal(408);

//   /// Response time out [code] : 598
//   static const FailureType responseTimeout = FailureType._internal(598);

//   ///
//   /// Response failure
//   ///
//   /// Code inside [Failure] might be different
//   /// if response status code is available.
//   ///
//   /// Default [code] for response failure is 400
//   static const FailureType response = FailureType._internal(400);

//   /// List of [FailureType]
//   static const List<FailureType> values = [
//     FailureType.authentication,
//     FailureType.exception,
//     FailureType.unknown,
//     FailureType.cancel,
//     FailureType.requestTimeout,
//     FailureType.responseTimeout,
//     FailureType.response,
//   ];
// }

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
