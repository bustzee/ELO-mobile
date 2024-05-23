// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamDetails _$StreamDetailsFromJson(Map<String, dynamic> json) =>
    StreamDetails(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StreamDetailsToJson(StreamDetails instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      livestream: json['livestream'] == null
          ? null
          : Livestream.fromJson(json['livestream'] as Map<String, dynamic>),
      potAmount: (json['pot_amount'] as num?)?.toInt(),
      setting: json['setting'] == null
          ? null
          : Setting.fromJson(json['setting'] as Map<String, dynamic>),
      gameName: json['game_name'] as String?,
      playerStats: json['player_stats'],
      activeBets: (json['active_bets'] as List<dynamic>?)
          ?.map((e) => ActiveBet.fromJson(e as Map<String, dynamic>))
          .toList(),
      bettingMasters: (json['betting_masters'] as List<dynamic>?)
          ?.map((e) => Master.fromJson(e as Map<String, dynamic>))
          .toList(),
      conversion: json['conversion'] == null
          ? null
          : Conversion.fromJson(json['conversion'] as Map<String, dynamic>),
      countLabel: (json['count_label'] as num?)?.toInt(),
      chkLabel: (json['chk_label'] as List<dynamic>?)
          ?.map((e) => ChkLabel.fromJson(e as Map<String, dynamic>))
          .toList(),
      labelName: json['label_name'],
      countBet: (json['count_bet'] as num?)?.toInt(),
      email: json['email'] as String?,
      userRoomNames: json['user_room_names'],
      currentRoomNames: json['current_room_names'],
      rmName: json['rm_name'] as String?,
      isUserBetted: json['is_user_betted'] as bool?,
      likeCount: (json['like_count'] as num?)?.toInt(),
      dislikeCount: (json['dislike_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'livestream': instance.livestream,
      'pot_amount': instance.potAmount,
      'setting': instance.setting,
      'game_name': instance.gameName,
      'player_stats': instance.playerStats,
      'active_bets': instance.activeBets,
      'betting_masters': instance.bettingMasters,
      'conversion': instance.conversion,
      'count_label': instance.countLabel,
      'chk_label': instance.chkLabel,
      'label_name': instance.labelName,
      'count_bet': instance.countBet,
      'email': instance.email,
      'user_room_names': instance.userRoomNames,
      'current_room_names': instance.currentRoomNames,
      'rm_name': instance.rmName,
      'is_user_betted': instance.isUserBetted,
      'like_count': instance.likeCount,
      'dislike_count': instance.dislikeCount,
    };

ActiveBet _$ActiveBetFromJson(Map<String, dynamic> json) => ActiveBet(
      id: (json['id'] as num?)?.toInt(),
      bettingAmount: json['betting_amount'] as String?,
      forText: json['for_text'] as String?,
      againstText: json['against_text'] as String?,
      description: json['description'] as String?,
      masterBettingId: (json['master_betting_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      livestreamId: (json['livestream_id'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      wonSide: json['won_side'] as String?,
      declarationDate: json['declaration_date'],
      declarationBy: json['declaration_by'],
      isDeclaredResult: (json['is_declared_result'] as num?)?.toInt(),
      streamerFee: json['streamer_fee'],
      total: (json['total'] as num?)?.toInt(),
      isAddBet: (json['is_add_bet'] as num?)?.toInt(),
      isClaimBet: (json['is_claim_bet'] as num?)?.toInt(),
      master: json['master'] == null
          ? null
          : Master.fromJson(json['master'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      bets: (json['bets'] as List<dynamic>?)
          ?.map((e) => Bet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActiveBetToJson(ActiveBet instance) => <String, dynamic>{
      'id': instance.id,
      'betting_amount': instance.bettingAmount,
      'for_text': instance.forText,
      'against_text': instance.againstText,
      'description': instance.description,
      'master_betting_id': instance.masterBettingId,
      'user_id': instance.userId,
      'livestream_id': instance.livestreamId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'won_side': instance.wonSide,
      'declaration_date': instance.declarationDate,
      'declaration_by': instance.declarationBy,
      'is_declared_result': instance.isDeclaredResult,
      'streamer_fee': instance.streamerFee,
      'total': instance.total,
      'is_add_bet': instance.isAddBet,
      'is_claim_bet': instance.isClaimBet,
      'master': instance.master,
      'user': instance.user,
      'bets': instance.bets,
    };

Bet _$BetFromJson(Map<String, dynamic> json) => Bet(
      id: (json['id'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
      gameId: json['game_id'] as String?,
      gameName: json['game_name'] as String?,
      amount: json['amount'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      totalAmount: json['total_amount'] as String?,
      betMainId: (json['bet_main_id'] as num?)?.toInt(),
      claimedDate: json['claimed_date'] == null
          ? null
          : DateTime.parse(json['claimed_date'] as String),
      isClaimed: (json['is_claimed'] as num?)?.toInt(),
      isWin: (json['is_win'] as num?)?.toInt(),
      winAmount: json['win_amount'],
      betOn: json['bet_on'] as String?,
      vigAmount: json['vig_amount'] as String?,
    );

Map<String, dynamic> _$BetToJson(Bet instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'game_id': instance.gameId,
      'game_name': instance.gameName,
      'amount': instance.amount,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'total_amount': instance.totalAmount,
      'bet_main_id': instance.betMainId,
      'claimed_date': instance.claimedDate?.toIso8601String(),
      'is_claimed': instance.isClaimed,
      'is_win': instance.isWin,
      'win_amount': instance.winAmount,
      'bet_on': instance.betOn,
      'vig_amount': instance.vigAmount,
    };

Master _$MasterFromJson(Map<String, dynamic> json) => Master(
      id: (json['id'] as num?)?.toInt(),
      description: json['description'] as String?,
      addedBy: (json['added_by'] as num?)?.toInt(),
      bettingAmount: json['betting_amount'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isActive: (json['is_active'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MasterToJson(Master instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'added_by': instance.addedBy,
      'betting_amount': instance.bettingAmount,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String?,
      phone: json['phone'] as String?,
      businessInfo: json['business_info'],
      profile: json['profile'] as String?,
      address: json['address'] as String?,
      rememberToken: json['remember_token'],
      eloBalance: (json['elo_balance'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      userType: json['user_type'] as String?,
      status: (json['status'] as num?)?.toInt(),
      paypalEmail: json['paypal_email'],
      streamKey: json['stream_key'] as String?,
      dateOfBirth: json['date_of_birth'],
      userAge: json['user_age'],
      agree: json['agree'],
      imageLink: json['imageLink'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'phone': instance.phone,
      'business_info': instance.businessInfo,
      'profile': instance.profile,
      'address': instance.address,
      'remember_token': instance.rememberToken,
      'elo_balance': instance.eloBalance,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'user_type': instance.userType,
      'status': instance.status,
      'paypal_email': instance.paypalEmail,
      'stream_key': instance.streamKey,
      'date_of_birth': instance.dateOfBirth,
      'user_age': instance.userAge,
      'agree': instance.agree,
      'imageLink': instance.imageLink,
      'name': instance.name,
    };

ChkLabel _$ChkLabelFromJson(Map<String, dynamic> json) => ChkLabel(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      lableGame: json['lable_game'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      userId: (json['user_id'] as num?)?.toInt(),
      labelGame: json['label_game'] as String?,
    );

Map<String, dynamic> _$ChkLabelToJson(ChkLabel instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'lable_game': instance.lableGame,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'user_id': instance.userId,
      'label_game': instance.labelGame,
    };

Conversion _$ConversionFromJson(Map<String, dynamic> json) => Conversion(
      cid: (json['cid'] as num?)?.toInt(),
      elo: (json['elo'] as num?)?.toInt(),
      usdAmt: (json['usd_amt'] as num?)?.toInt(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );

Map<String, dynamic> _$ConversionToJson(Conversion instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'elo': instance.elo,
      'usd_amt': instance.usdAmt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

RoomName _$RoomNameFromJson(Map<String, dynamic> json) => RoomName(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      roomName: json['room_name'] as String?,
      username: json['username'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$RoomNameToJson(RoomName instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'room_name': instance.roomName,
      'username': instance.username,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

Livestream _$LivestreamFromJson(Map<String, dynamic> json) => Livestream(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      streamId: json['stream_id'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      name: json['name'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      delayTime: json['delay_time'] as String?,
      viewCounter: json['view_counter'],
      type: json['type'],
      fileLink: json['fileLink'] as bool?,
    );

Map<String, dynamic> _$LivestreamToJson(Livestream instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'stream_id': instance.streamId,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'delay_time': instance.delayTime,
      'view_counter': instance.viewCounter,
      'type': instance.type,
      'fileLink': instance.fileLink,
    };

Setting _$SettingFromJson(Map<String, dynamic> json) => Setting(
      id: (json['id'] as num?)?.toInt(),
      vig: json['vig'] as String?,
      extraVigDivisionFactor:
          (json['extra_vig_division_factor'] as num?)?.toInt(),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      noOfUserCanBet: (json['no_of_user_can_bet'] as num?)?.toInt(),
      streamerPer: (json['streamer_per'] as num?)?.toInt(),
      minWalletTrasferAmount: json['min_wallet_trasfer_amount'] as String?,
      clientId: json['client_id'] as String?,
      apiUsername: json['api_username'] as String?,
      apiPassword: json['api_password'] as String?,
      apiSignature: json['api_signature'] as String?,
      environment: json['environment'] as String?,
      hideTwitchStream: (json['hide_twitch_stream'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SettingToJson(Setting instance) => <String, dynamic>{
      'id': instance.id,
      'vig': instance.vig,
      'extra_vig_division_factor': instance.extraVigDivisionFactor,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'no_of_user_can_bet': instance.noOfUserCanBet,
      'streamer_per': instance.streamerPer,
      'min_wallet_trasfer_amount': instance.minWalletTrasferAmount,
      'client_id': instance.clientId,
      'api_username': instance.apiUsername,
      'api_password': instance.apiPassword,
      'api_signature': instance.apiSignature,
      'environment': instance.environment,
      'hide_twitch_stream': instance.hideTwitchStream,
    };
