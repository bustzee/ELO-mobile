import 'package:dio/dio.dart';
import 'package:elo_esports/models/add_bet.dart';
import 'package:elo_esports/models/admin_betting_master_list.dart';
import 'package:elo_esports/models/admin_role.dart';
import 'package:elo_esports/models/admin_role_permission.dart';
import 'package:elo_esports/models/admin_update_settings.dart';
import 'package:elo_esports/models/bet_details.dart' as bet_details;
import 'package:elo_esports/models/betting_disputes.dart';
import 'package:elo_esports/models/betting_view_master.dart';
import 'package:elo_esports/models/common_response.dart';
import 'package:elo_esports/models/create_betting_master.dart';
import 'package:elo_esports/models/create_betting_view_master.dart';
import 'package:elo_esports/models/create_betting_view_master.dart';
import 'package:elo_esports/models/create_stream_request.dart';
import 'package:elo_esports/models/create_stream_response.dart';
import 'package:elo_esports/models/admin_userdetails.dart';
import 'package:elo_esports/models/create_tutorial.dart';

import 'package:elo_esports/models/create_user.dart';
import 'package:elo_esports/models/dashboard_info.dart';
import 'package:elo_esports/models/deposit.dart';
import 'package:elo_esports/models/get_setting.dart';

import 'package:elo_esports/models/leaderboard.dart';
import 'package:elo_esports/models/report_stream.dart';
import 'package:elo_esports/models/reported_streams.dart';

import 'package:elo_esports/models/stream_details.dart' as stream_details;
import 'package:elo_esports/models/tutorial.dart';
import 'package:elo_esports/models/twitch_leaderboard.dart';
import 'package:elo_esports/models/twitchstream.dart';
import 'package:elo_esports/models/user_bet_details.dart';
import 'package:elo_esports/models/user_details.dart';
import 'package:elo_esports/models/withdrawal.dart';
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

  Future<CommonResponse?> claimBet(BuildContext? context, int? betMainId, String? gameId) async {
    try {
      final response = await _dio.post(Endpoints.claimBet, data: {'bet_main_id': betMainId, 'game_id': gameId});
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

  Future<UserBetDetails?> getBetbyuserId(BuildContext? context) async {
    try {
      final response = await _dio.post(Endpoints.getBetbyuserId);
      return UserBetDetails.fromJson(response.data);
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

  Future<Tutorial?> getTutorial() async {
    try {
      final response = await _dio.get(Endpoints.getTutorial);
      return Tutorial.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<Withdrawal?> getListOfWithdrawals() async {
    try {
      final response = await _dio.get(Endpoints.getListOfWithdrawals);
      return Withdrawal.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<Deposit?> getListOfDeposits() async {
    try {
      final response = await _dio.get(Endpoints.getListOfDeposits);
      return Deposit.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<CommonResponse?> createUser(
      BuildContext? context, CreateUser createUser) async {
    try {
      final response =
          await _dio.post(Endpoints.createUser, data: createUser.toJson());
      return CommonResponse.fromJson(response.data);
    } on DioException catch (err) {
      // final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      if (context != null) {
        final snackBar = SnackBar(
            content: Text(err.response?.data['message'].toString() ??
                'Please try again with different credentials'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      throw err.message ?? 'Something went wrong';
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<CommonResponse?> likeStream(
      BuildContext? context, int livestreamId) async {
    try {
      final response = await _dio
          .post(Endpoints.likeStream, data: {'livestream_id': livestreamId});
      return CommonResponse.fromJson(response.data);
    } on DioException catch (err) {
      if (context != null) {
        final snackBar = SnackBar(
            content: Text(err.response?.data['message'].toString() ??
                'You have already liked this stream'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      throw err.message ?? 'Something went wrong';
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<CommonResponse?> unlikeStream(
      BuildContext? context, int livestreamId) async {
    try {
      final response = await _dio
          .post(Endpoints.unlikeStream, data: {'livestream_id': livestreamId});
      return CommonResponse.fromJson(response.data);
    } on DioException catch (err) {
      if (context != null) {
        final snackBar = SnackBar(
            content: Text(err.response?.data['message'].toString() ??
                'You have already unliked this stream'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      throw err.message ?? 'Something went wrong';
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<CommonResponse?> streamReport(BuildContext? context, ReportStream reportStream) async {
    try {
      final response = await _dio.post(Endpoints.streamReport, data: reportStream.toJson());
      return CommonResponse.fromJson(response.data);
    } on DioException catch (err) {
      if (context != null) {
        final snackBar = SnackBar(
            content: Text(err.response?.data['message'].toString() ??
                'You have already reported this stream'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      throw err.message ?? 'Something went wrong';
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<stream_details.StreamDetails?> getStreamDetails(
      BuildContext? context, int livestreamId) async {
    try {
      final response = await _dio
          .post(Endpoints.getStreamDetails, data: {'id': livestreamId});
      return stream_details.StreamDetails.fromJson(response.data);
    } on DioException catch (err) {
      if (context != null) {
        final snackBar = SnackBar(
            content: Text(err.response?.data['message'].toString() ??
                'Something went wrong'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      throw err.message ?? 'Something went wrong';
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<Leaderboard?> getHomeLeaderBoardStreams() async {
    try {
      final response = await _dio.get(Endpoints.getHomeLeaderBoardStreams);
      return Leaderboard.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<TwitchLeaderboard?> getTwitchLeaderBoardStreams() async {
    try {
      final response = await _dio.get(Endpoints.getTwitchLeaderBoardStreams);
      return TwitchLeaderboard.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<CommonResponse?> updateSettings(
      BuildContext? context, AdminUpdateSettings updateSettings) async {
    try {
      final response = await _dio.post(Endpoints.updateSettings,
          data: updateSettings.toJson());
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

  Future<CommonResponse?> createBettingMaster(
      BuildContext? context, CreateBettingMaster createBettingMaster) async {
    try {
      final response = await _dio.post(Endpoints.createBettingMaster,
          data: createBettingMaster.toJson());
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

  Future<AdminBettingMasterList?> getListOfBettingMaster() async {
    try {
      final response = await _dio.get(Endpoints.getListOfBettingMaster);
      return AdminBettingMasterList.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<CommonResponse?> deleteBettingMasterRecord(
      BuildContext? context, int id) async {
    try {
      final response = await _dio
          .delete(Endpoints.deleteBettingMasterRecord, data: {'id': id});
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

  Future<CommonResponse?> CreateBettingView(BuildContext? context,
      CreateBettingViewMaster createBettingViewMaster) async {
    try {
      final response = await _dio.post(Endpoints.createBettingViewMaster,
          data: createBettingViewMaster.toJson());
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

  Future<BettingViewMaster?> GetListOfBettingViewMaster() async {
    try {
      final response = await _dio.get(Endpoints.getListOfBettingViewMaster);
      return BettingViewMaster.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<CommonResponse?> DeleteBettingViewMasterRecord(
      BuildContext? context, int id) async {
    try {
      final response = await _dio
          .delete(Endpoints.deleteBettingViewMasterRecord, data: {'id': id});
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

  Future<DashboardInfo?> GetDashboardInfo() async {
    try {
      final response = await _dio.get(Endpoints.getDashboardInfo);
      return DashboardInfo.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<CommonResponse?> deleteTutorial(BuildContext? context, int id) async {
    try {
      final response =
          await _dio.delete(Endpoints.deleteTutorial, data: {'id': id});
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

  Future<CommonResponse?> createTutorial(
      BuildContext? context, CreateTutorial createTutorial) async {
    try {
      final response = await _dio.post(Endpoints.createTutorial,
          data: createTutorial.toJson());
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

  Future<ReportedStreams?> GetReportedStreams() async {
    try {
      final response = await _dio.get(Endpoints.getReportedStreams);
      return ReportedStreams.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<BettingDisputes?> GetBettingDisputes() async {
    try {
      final response = await _dio.get(Endpoints.getBettingDisputes);
      return BettingDisputes.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<GetSetting?> GetAdminSetting() async {
    try {
      final response = await _dio.get(Endpoints.getSetting);
      return GetSetting.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<bet_details.BetDetails?> getBetDetails(BuildContext? context, int id) async {
    try {
      final response =
          await _dio.post(Endpoints.getBetDetails, data: {'livestream_id': id});
      return bet_details.BetDetails.fromJson(response.data);
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

  Future<CommonResponse?> addBet(BuildContext? context, AddBet addBetModel) async {
    try {
      final response = await _dio.post(Endpoints.addBet, data: addBetModel.toJson());
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
}
