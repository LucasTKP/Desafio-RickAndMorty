import 'package:desafio_rickandmorty/core/services/request_limiter_service.dart';
import 'package:dio/dio.dart';

class ApiClientService {
  late final Dio _dio;

  ApiClientService() {
    _dio = _configureDio();
  }

  Dio _configureDio() {
    final options = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      contentType: 'application/json; charset=utf-8',
      headers: {'Accept': 'application/json'},
    );

    final dio = Dio(options);
    return dio;
  }

  Future<Response> get({required String url, required String logMessage}) async {
    RequestLimiterService.instance.verify(action: logMessage);
    return await _dio.get(url);
  }
}
