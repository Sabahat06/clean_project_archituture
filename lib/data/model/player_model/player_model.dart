class PlayerModel {
  bool? status;
  int? responseCode;
  String? message;
  List<Players>? players;

  PlayerModel({this.status, this.responseCode, this.message, this.players});

  PlayerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message']??"";
    if (json['players'] != null) {
      players = <Players>[];
      json['players'].forEach((v) {
        players!.add(new Players.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['responseCode'] = this.responseCode;
    data['message'] = this.message;
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Players {
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
  Pivot? pivot;

  Players(
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
        this.legacyPlayer,
        this.pivot});

  Players.fromJson(Map<String, dynamic> json) {
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
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : Pivot();
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
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  String? teamId;
  String? playerId;

  Pivot({this.teamId, this.playerId});

  Pivot.fromJson(Map<String, dynamic> json) {
    teamId = json['team_id'].toString();
    playerId = json['player_id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['team_id'] = this.teamId;
    data['player_id'] = this.playerId;
    return data;
  }
}
