class PackBoughtModel {
  bool? status;
  int? responseCode;
  String? message;
  List<PackBought>? data;

  PackBoughtModel({this.status, this.responseCode, this.message, this.data});

  PackBoughtModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PackBought>[];
      json['data'].forEach((v) {
        data!.add(new PackBought.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['responseCode'] = this.responseCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PackBought {
  String? id;
  String? matchId;
  String? teamId;
  String? packId;
  String? userId;
  String? createdAt;
  String? updatedAt;
  String? isPackOpened;
  String? totalPoints;
  MacthDetails? macthDetails;
  SelectedTeam? selectedTeam;
  List<PackPlayers>? packPlayers;
  Packs? packs;

  PackBought(
      {this.id,
        this.matchId,
        this.teamId,
        this.packId,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.isPackOpened,
        this.totalPoints,
        this.macthDetails,
        this.selectedTeam,
        this.packPlayers,
        this.packs});

  PackBought.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    matchId = json['match_id'].toString();
    teamId = json['team_id'].toString();
    packId = json['pack_id'].toString();
    userId = json['user_id'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    isPackOpened = json['is_pack_opened'].toString();
    totalPoints = json['total_points'].toString();
    macthDetails = json['macth_details'] != null
        ? new MacthDetails.fromJson(json['macth_details'])
        : null;
    selectedTeam = json['selected_team'] != null
        ? new SelectedTeam.fromJson(json['selected_team'])
        : null;
    if (json['pack_players'] != null) {
      packPlayers = <PackPlayers>[];
      json['pack_players'].forEach((v) {
        packPlayers!.add(new PackPlayers.fromJson(v));
      });
    }
    packs = json['packs'] != null ? new Packs.fromJson(json['packs']) : null;
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
    data['is_pack_opened'] = this.isPackOpened;
    data['total_points'] = this.totalPoints;
    if (this.macthDetails != null) {
      data['macth_details'] = this.macthDetails!.toJson();
    }
    if (this.selectedTeam != null) {
      data['selected_team'] = this.selectedTeam!.toJson();
    }
    if (this.packPlayers != null) {
      data['pack_players'] = this.packPlayers!.map((v) => v.toJson()).toList();
    }
    if (this.packs != null) {
      data['packs'] = this.packs!.toJson();
    }
    return data;
  }
}

class MacthDetails {
  String? id;
  String? homeTeamId;
  String? awayTeamId;
  String? matchDate;
  String? matchTime;
  String? seasonId;
  String? matchStatus;
  String? winnerTeamId;
  String? createdAt;
  String? updatedAt;
  String? homeTeamScore;
  String? awayTeamScore;

  MacthDetails(
      {this.id,
        this.homeTeamId,
        this.awayTeamId,
        this.matchDate,
        this.matchTime,
        this.seasonId,
        this.matchStatus,
        this.winnerTeamId,
        this.createdAt,
        this.updatedAt,
        this.homeTeamScore,
        this.awayTeamScore});

  MacthDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    homeTeamId = json['home_team_id'].toString();
    awayTeamId = json['away_team_id'].toString();
    matchDate = json['match_date'].toString();
    matchTime = json['match_time'].toString();
    seasonId = json['season_id'].toString();
    matchStatus = json['match_status'].toString();
    winnerTeamId = json['winner_team_id'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    homeTeamScore = json['home_team_score'].toString();
    awayTeamScore = json['away_team_score'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['home_team_id'] = this.homeTeamId;
    data['away_team_id'] = this.awayTeamId;
    data['match_date'] = this.matchDate;
    data['match_time'] = this.matchTime;
    data['season_id'] = this.seasonId;
    data['match_status'] = this.matchStatus;
    data['winner_team_id'] = this.winnerTeamId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['home_team_score'] = this.homeTeamScore;
    data['away_team_score'] = this.awayTeamScore;
    return data;
  }
}

class SelectedTeam {
  String? id;
  String? teamName;
  String? teamImage;
  String? sportId;
  String? createdAt;
  String? updatedAt;

  SelectedTeam(
      {this.id,
        this.teamName,
        this.teamImage,
        this.sportId,
        this.createdAt,
        this.updatedAt});

  SelectedTeam.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    teamName = json['team_name'].toString();
    teamImage = json['team_image'].toString();
    sportId = json['sport_id'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['team_name'] = this.teamName;
    data['team_image'] = this.teamImage;
    data['sport_id'] = this.sportId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PackPlayers {
  String? id;
  String? userPackId;
  String? playerId;
  String? pointsEarned;
  String? createdAt;
  String? updatedAt;

  PackPlayers(
      {this.id,
        this.userPackId,
        this.playerId,
        this.pointsEarned,
        this.createdAt,
        this.updatedAt});

  PackPlayers.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    userPackId = json['user_pack_id'].toString();
    playerId = json['player_id'].toString();
    pointsEarned = json['points_earned'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_pack_id'] = this.userPackId;
    data['player_id'] = this.playerId;
    data['points_earned'] = this.pointsEarned;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Packs {
  String? id;
  String? packName;
  String? packPrice;
  String? packImage;
  String? createdAt;
  String? updatedAt;

  Packs(
      {this.id,
        this.packName,
        this.packPrice,
        this.packImage,
        this.createdAt,
        this.updatedAt});

  Packs.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    packName = json['pack_name'].toString();
    packPrice = json['pack_price'].toString();
    packImage = json['pack_image'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pack_name'] = this.packName;
    data['pack_price'] = this.packPrice;
    data['pack_image'] = this.packImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
