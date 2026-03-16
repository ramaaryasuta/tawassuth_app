import 'package:dio/dio.dart';

import 'api_interceptor.dart';

enum MHttpMethod { get, post, put, delete, patch }

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() => _instance;

  late final Dio dio;

  ApiClient._internal() {
    dio = Dio(
      BaseOptions(
        /// we will add the base url later
        baseUrl: "",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {"Content-Type": "application/json"},
      ),
    );

    dio.interceptors.add(MInterceptor());
  }

  Future<Response<T>> request<T>({
    required MHttpMethod method,
    required String path,
    Map<String, dynamic>? query,
    dynamic body,
    Options? options,
  }) async {
    return await dio.request<T>(
      path,
      data: body,
      queryParameters: query,
      options:
          options?.copyWith(method: method.name.toString().toUpperCase()) ??
          Options(method: method.name.toString().toUpperCase()),
    );
  }
}
