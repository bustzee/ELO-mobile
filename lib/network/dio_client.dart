import 'package:dio/dio.dart';
import 'package:elo_esports/models/models.dart';
import 'package:elo_esports/network/dio_exception_handler.dart';
import 'package:elo_esports/network/endpoints.dart';
import 'package:elo_esports/network/interceptors/authorization_interceptor.dart';
import 'package:elo_esports/network/interceptors/logger_interceptor.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  DioClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: Endpoints.baseURL,
            connectTimeout:
                const Duration(milliseconds: Endpoints.connectionTimeout),
            receiveTimeout:
                const Duration(milliseconds: Endpoints.receiveTimeout),
            responseType: ResponseType.json,
          ),
        )..interceptors.addAll([
            AuthorizationInterceptor(),
            LoggerInterceptor(),
          ]);

  late final Dio _dio;

  Future<Livestream?> getLiveStreams() async {
    try {
      final response = await _dio.get('${Endpoints.getLiveStreams}');
      return Livestream.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }


  // Future<User?> createUser({required User user}) async {
  //   try {
  //     final response = await _dio.post(Endpoints.users, data: user.toJson());
  //     return User.fromJson(response.data);
  //   } on DioError catch (err) {
  //     final errorMessage = DioException.fromDioError(err).toString();
  //     throw errorMessage;
  //   } catch (e) {
  //     if (kDebugMode) print(e);
  //     throw e.toString();
  //   }
  // }

  // Future<void> deleteUser({required int id}) async {
  //   try {
  //     await _dio.delete('${Endpoints.users}/$id');
  //   } on DioError catch (err) {
  //     final errorMessage = DioException.fromDioError(err).toString();
  //     throw errorMessage;
  //   } catch (e) {
  //     if (kDebugMode) print(e);
  //     throw e.toString();
  //   }
  // }
}
