import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../main.dart';
import '../../utils/print_log.dart';

class MInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode && showAPILog) {
      printLog({
        "type": "request",
        "request_method": options.method,
        "path": options.path,
        "headers": options.headers,
        "query_params": options.queryParameters,
        "data": options.data,
      });
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      final req = response.requestOptions;
      if (response.statusCode != 200) {
        printLog(
          '${req.method.toUpperCase()} - ${req.uri}',
          type: LogType.error,
        );
        if (req.data != null) {
          printLog(jsonDecode(req.data), type: LogType.error);
        }
        printLog(
          '${response.statusCode} - ${response.data}',
          type: LogType.error,
        );
      } else {
        printLog(
          '${response.statusCode} - ${req.method.toUpperCase()} ${req.uri}',
          type: LogType.success,
        );
      }
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      final req = err.requestOptions;
      final res = err.response;
      if (res?.statusCode != null) {
        printLog('${req.method.toUpperCase()} - ${req.uri}');
        printLog('${res?.statusCode} - ${res?.data}');
      }
    }
    return super.onError(err, handler);
  }
}
