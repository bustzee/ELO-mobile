import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_info.g.dart';

@JsonSerializable()
class DashboardInfo extends Equatable {
  DashboardInfo({
    required this.status,
    required this.users,
    required this.start,
    required this.stop,
    required this.chat,
  });

  final String? status;
  static const String statusKey = "status";

  final int? users;
  static const String usersKey = "users";

  final int? start;
  static const String startKey = "start";

  final int? stop;
  static const String stopKey = "stop";

  final int? chat;
  static const String chatKey = "chat";

  DashboardInfo copyWith({
    String? status,
    int? users,
    int? start,
    int? stop,
    int? chat,
  }) {
    return DashboardInfo(
      status: status ?? this.status,
      users: users ?? this.users,
      start: start ?? this.start,
      stop: stop ?? this.stop,
      chat: chat ?? this.chat,
    );
  }

  factory DashboardInfo.fromJson(Map<String, dynamic> json) =>
      _$DashboardInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardInfoToJson(this);

  @override
  String toString() {
    return "$status, $users, $start, $stop, $chat, ";
  }

  @override
  List<Object?> get props => [
        status,
        users,
        start,
        stop,
        chat,
      ];
}
