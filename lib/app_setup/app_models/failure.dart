import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

/// Custom object for handling failures and exceptions
class Failure {
  ///
  Failure(this.reason, this.type, [this.code]);

  /// Convert exception to [Failure]
  factory Failure.fromException(Object e) => Failure(
        e.toString(),
        FailureType.exception,
      );

  ///
  /// String representation of [Failure] reason
  ///
  final String reason;

  ///
  /// Use [type] for checking condition
  ///
  final FailureType type;

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

    if (response?.statusCode == 400 && response?.data != null) {
      final data = response!.data as Map<String, dynamic>;
      final m = data['message'] as String?;
      if (m?.isNotEmpty ?? false) {
        msg = m!;
      }
    }
    if (response?.statusCode == 422) {
      final data = response!.data as Map<String, dynamic>;
      final errors = data['message'] as String?;
      if (errors?.isNotEmpty ?? false) {
        msg = errors!;
      }
    }
    if (response?.statusCode == 409 || response?.statusCode == 403) {
      final data = response!.data as Map<String, dynamic>;
      final errors = data['message'] as String?;
      if (errors?.isNotEmpty ?? false) {
        msg = errors!;
      }
    }

    switch (type) {
      case DioErrorType.cancel:
        return Failure(
          msg,
          FailureType.cancel,
        );
      case DioErrorType.connectTimeout:
        return Failure(
          msg,
          FailureType.requestTimeout,
        );
      case DioErrorType.receiveTimeout:
        return Failure(
          msg,
          FailureType.responseTimeout,
        );
      case DioErrorType.response:
        return Failure(
          msg,
          FailureType.response,
          response?.statusCode ?? FailureType.response.code,
        );
      default:
        if (error.runtimeType == SocketException) {
          return Failure(
            'No internet! Please check your connection..',
            FailureType.internet,
            response?.statusCode ?? FailureType.internet.code,
          );
        }
        return Failure(
          msg,
          FailureType.unknown,
          response?.statusCode ?? FailureType.unknown.code,
        );
    }
  }
}

/// Different failure type
class FailureType {
  const FailureType._internal(this.code);

  /// Code associated with [FailureType]
  final int code;

  /// Authentication failure [code] : -4
  static const FailureType authentication = FailureType._internal(-4);

  /// Failure caused by exceptions [code] : -3
  static const FailureType exception = FailureType._internal(-3);

  /// Unknown failure [code] : -2
  static const FailureType unknown = FailureType._internal(-2);

  /// No internet connection [code] : -1
  static const FailureType internet = FailureType._internal(-1);

  /// Request cancel [code] : 0
  static const FailureType cancel = FailureType._internal(0);

  /// Request time out [code] : 408
  static const FailureType requestTimeout = FailureType._internal(408);

  /// Response time out [code] : 598
  static const FailureType responseTimeout = FailureType._internal(598);

  ///
  /// Response failure
  ///
  /// Code inside [Failure] might be different
  /// if response status code is available.
  ///
  /// Default [code] for response failure is 400
  static const FailureType response = FailureType._internal(400);

  /// List of [FailureType]
  static const List<FailureType> values = [
    FailureType.authentication,
    FailureType.exception,
    FailureType.unknown,
    FailureType.cancel,
    FailureType.requestTimeout,
    FailureType.responseTimeout,
    FailureType.response,
  ];
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
