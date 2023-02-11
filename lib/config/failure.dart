import 'dart:io';

import 'package:dio/dio.dart';

class Failure {
  final String errorCode;
  final String message;

  Failure({
    required this.errorCode,
    required this.message,
  });

  static const String socketExceptionCode = 'socket_exception';
  static const String socketExceptionMsg = 'Please check your internet connection';

  static const String httpExceptionCode = 'http_exception';
  static const String httpExceptionMsg = 'Oops! An error occurred. Please try again';

  static const String formatExceptionCode = 'format_exception';
  static const String formatExceptionMsg = 'Oops! A cast error occurred. Please try again';

  static const String somethingWentWrongCode = 'fatal_exception';
  static const String somethingWentWrongMsg = 'Oops! An error occurred. Please try again';

  factory Failure.fromException(Exception err) {
    if (err is DioError) {
      switch (err.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          return Failure(
            errorCode: Failure.socketExceptionCode,
            message: Failure.socketExceptionMsg,
          );

        case DioErrorType.response:
          return Failure(
            errorCode: err.response!.statusCode!.toString(),
            message: err.response!.statusMessage!,
          );

        case DioErrorType.other:
        default:
          if (err is SocketException) {
            return Failure(
              errorCode: Failure.socketExceptionCode,
              message: Failure.socketExceptionMsg,
            );
          } else if (err is FormatException) {
            return Failure(
              errorCode: Failure.formatExceptionCode,
              message: Failure.formatExceptionMsg,
            );
          } else if (err is HttpException) {
            return Failure(
              errorCode: Failure.somethingWentWrongCode,
              message: Failure.somethingWentWrongMsg,
            );
          } else {
            return Failure(
              errorCode: Failure.somethingWentWrongCode,
              message: Failure.somethingWentWrongMsg,
            );
          }
      }
    } else {
      return Failure(
        errorCode: Failure.somethingWentWrongCode,
        message: Failure.somethingWentWrongMsg,
      );
    }
  }
}
