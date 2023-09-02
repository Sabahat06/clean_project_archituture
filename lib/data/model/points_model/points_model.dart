class PointsModel {
  bool? status;
  int? responseCode;
  String? message;
  String? totalPoints;
  List<Points>? points;

  PointsModel(
      {this.status,
        this.responseCode,
        this.message,
        this.totalPoints,
        this.points});

  PointsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message'];
    totalPoints = json['total_points'];
    if (json['points'] != null) {
      points = <Points>[];
      json['points'].forEach((v) {
        points!.add(new Points.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['responseCode'] = this.responseCode;
    data['message'] = this.message;
    data['total_points'] = this.totalPoints;
    if (this.points != null) {
      data['points'] = this.points!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Points {
  String? id;
  String? matchId;
  String? teamId;
  String? packId;
  String? userId;
  String? createdAt;
  String? updatedAt;
  List<Data>? data;

  Points(
      {this.id,
        this.matchId,
        this.teamId,
        this.packId,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.data});

  Points.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    matchId = json['match_id'].toString();
    teamId = json['team_id'].toString();
    packId = json['pack_id'].toString();
    userId = json['user_id'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['match_id'] = this.matchId;
    data['team_id'] = this.teamId;
    data['pack_id'] = this.packId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userPackId;
  String? playerId;
  String? pointsEarned;
  String? createdAt;
  String? updatedAt;
  Player? player;

  Data(
      {this.id,
        this.userPackId,
        this.playerId,
        this.pointsEarned,
        this.createdAt,
        this.updatedAt,
        this.player});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    userPackId = json['user_pack_id'].toString();
    playerId = json['player_id'].toString();
    pointsEarned = json['points_earned'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    player =
    json['player'] != null ? new Player.fromJson(json['player']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_pack_id'] = this.userPackId;
    data['player_id'] = this.playerId;
    data['points_earned'] = this.pointsEarned;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    return data;
  }
}

class Player {
  String? id;
  String? playerName;
  String? jerseyNumber;
  String? dateOfBirth;
  String? position;
  String? height;
  String? placeOfBirth;
  String? weight;
  String? country;
  String? catches;
  String? contract;
  String? profilePhoto;
  String? rating;
  String? active;
  String? selectionPercentage;
  String? createdAt;
  String? updatedAt;
  String? legacyPlayer;

  Player(
      {this.id,
        this.playerName,
        this.jerseyNumber,
        this.dateOfBirth,
        this.position,
        this.height,
        this.placeOfBirth,
        this.weight,
        this.country,
        this.catches,
        this.contract,
        this.profilePhoto,
        this.rating,
        this.active,
        this.selectionPercentage,
        this.createdAt,
        this.updatedAt,
        this.legacyPlayer});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    playerName = json['player_name'].toString();
    jerseyNumber = json['jersey_number'].toString();
    dateOfBirth = json['date_of_birth'].toString();
    position = json['position'].toString();
    height = json['height'].toString();
    placeOfBirth = json['place_of_birth'].toString();
    weight = json['weight'].toString();
    country = json['country'].toString();
    catches = json['catches'].toString();
    contract = json['contract'].toString();
    profilePhoto = json['profile_photo'].toString();
    rating = json['rating'].toString();
    active = json['active'].toString();
    selectionPercentage = json['selection_percentage'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    legacyPlayer = json['legacy_player'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['player_name'] = this.playerName;
    data['jersey_number'] = this.jerseyNumber;
    data['date_of_birth'] = this.dateOfBirth;
    data['position'] = this.position;
    data['height'] = this.height;
    data['place_of_birth'] = this.placeOfBirth;
    data['weight'] = this.weight;
    data['country'] = this.country;
    data['catches'] = this.catches;
    data['contract'] = this.contract;
    data['profile_photo'] = this.profilePhoto;
    data['rating'] = this.rating;
    data['active'] = this.active;
    data['selection_percentage'] = this.selectionPercentage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['legacy_player'] = this.legacyPlayer;
    return data;
  }
}
