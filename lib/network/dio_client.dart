import 'package:dio/dio.dart';
import 'package:elo_esports/models/admin_role.dart';
import 'package:elo_esports/models/admin_role_permission.dart';
import 'package:elo_esports/models/common_response.dart';
import 'package:elo_esports/models/create_stream_request.dart';
import 'package:elo_esports/models/create_stream_response.dart';
import 'package:elo_esports/models/admin_userdetails.dart';
import 'package:elo_esports/models/twitchstream.dart';
import 'package:elo_esports/models/user_details.dart';
import 'package:elo_esports/network/dio_exception_handler.dart';
import 'package:elo_esports/network/endpoints.dart';
import 'package:elo_esports/network/interceptors/authorization_interceptor.dart';
import 'package:elo_esports/network/interceptors/logger_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/livestream.dart';

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
      final response = await _dio.get(Endpoints.getLiveStreams);
      return Livestream.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<Livestream?> getCompletedStreams() async {
    try {
      final response = await _dio.get(Endpoints.getCompletedStreams);
      return Livestream.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<Twitchstream?> getTwitchStreams() async {
    try {
      final response = await _dio.get(Endpoints.getTwitchStreams);
      return Twitchstream.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<UserDetails?> getUserDetails(
      BuildContext? context, String username, String password) async {
    try {
      final response = await _dio.post(Endpoints.getUserDetails,
          data: {'username': username, 'password': password});
      return UserDetails.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      if (context != null) {
        final snackBar = SnackBar(content: Text(errorMessage.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<CommonResponse?> updateBankDetails(
      BuildContext? context, BankDetails bankDetails) async {
    try {
      final response = await _dio.post(Endpoints.updateBankDetails,
          data: bankDetails.toJson());
      return CommonResponse.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      if (context != null) {
        final snackBar = SnackBar(content: Text(errorMessage.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<CreateStreamResponse?> createStream(
      BuildContext? context, CreateStreamRequest createStreamRequest) async {
    try {
      final response = await _dio.post(Endpoints.createStream,
          data: createStreamRequest.toJson());
      return CreateStreamResponse.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      if (context != null) {
        final snackBar = SnackBar(content: Text(errorMessage.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<AdminUserdetails?> getUsersList() async {
    try {
      final response = await _dio.get(Endpoints.getUsersList);
      return AdminUserdetails.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<AdminRole?> getAllRoles() async {
    try {
      final response = await _dio.get(Endpoints.getAllRoles);
      return AdminRole.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<AdminRolePermission?> showPermission() async {
    try {
      final response = await _dio.get(Endpoints.showPermission);
      return AdminRolePermission.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }
}
