class HistoryModel {
  bool? status;
  int? responseCode;
  String? message;
  List<Matches>? matches;

  HistoryModel({this.status, this.responseCode, this.message, this.matches});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message']??"";
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(new Matches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['responseCode'] = this.responseCode;
    data['message'] = this.message;
    if (this.matches != null) {
      data['matches'] = this.matches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Matches {
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
  HomeTeam? homeTeam;
  HomeTeam? awayTeam;
  Season? season;

  Matches(
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
        this.awayTeamScore,
        this.homeTeam,
        this.awayTeam,
      this.season});

  Matches.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    homeTeamId = json['home_team_id'].toString();
    awayTeamId = json['away_team_id'].toString();
    matchDate = json['match_date']??"";
    matchTime = json['match_time']??"";
    seasonId = json['season_id'].toString();
    matchStatus = json['match_status']??"";
    winnerTeamId = json['winner_team_id'].toString();
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
    homeTeamScore = json['home_team_score']??"0";
    awayTeamScore = json['away_team_score']??"0";
    homeTeam = json['home_team'] != null
        ? new HomeTeam.fromJson(json['home_team'])
        : null;
    awayTeam = json['away_team'] != null
        ? new HomeTeam.fromJson(json['away_team'])
        : null;
    season = json['season'] != null
        ? new Season.fromJson(json['season'])
        : null;
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
    if (this.homeTeam != null) {
      data['home_team'] = this.homeTeam!.toJson();
    }
    if (this.awayTeam != null) {
      data['away_team'] = this.awayTeam!.toJson();
    }
    if (this.season != null) {
      data['season'] = this.season!.toJson();
    }
    return data;
  }
}

class HomeTeam {
  String? id;
  String? teamName;
  String? teamImage;
  String? sportId;
  String? createdAt;
  String? updatedAt;

  HomeTeam(
      {this.id,
        this.teamName,
        this.teamImage,
        this.sportId,
        this.createdAt,
        this.updatedAt});

  HomeTeam.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    teamName = json['team_name']??"";
    teamImage = json['team_image']??"";
    sportId = json['sport_id'].toString();
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
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

class Season {
  String? id;
  String? seasonName;
  String? startDate;
  String? endDate;
  String? leagueId;
  String? createdAt;
  String? updatedAt;

  Season(
      {this.id,
        this.seasonName,
        this.startDate,
        this.endDate,
        this.leagueId,
        this.createdAt,
        this.updatedAt});

  Season.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    seasonName = json['season_name'].toString();
    startDate = json['start_date'].toString();
    endDate = json['end_date'].toString();
    leagueId = json['league_id'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['season_name'] = this.seasonName;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['league_id'] = this.leagueId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

