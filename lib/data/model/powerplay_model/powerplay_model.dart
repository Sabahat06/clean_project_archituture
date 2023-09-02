class PowerPlayModel {
  bool? status;
  int? responseCode;
  String? message;
  List<Matches>? matches;
  List<Standings>? standings;
  List<Tablestandings>? tablestandings;

  PowerPlayModel(
      {this.status,
        this.responseCode,
        this.message,
        this.matches,
        this.standings,
        this.tablestandings});

  PowerPlayModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message']??"";
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(new Matches.fromJson(v));
      });
    }
    if (json['standings'] != null) {
      standings = <Standings>[];
      json['standings'].forEach((v) {
        standings!.add(new Standings.fromJson(v));
      });
    }
    if (json['tablestandings'] != null) {
      tablestandings = <Tablestandings>[];
      json['tablestandings'].forEach((v) {
        tablestandings!.add(new Tablestandings.fromJson(v));
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
    if (this.standings != null) {
      data['standings'] = this.standings!.map((v) => v.toJson()).toList();
    }
    if (this.tablestandings != null) {
      data['tablestandings'] =
          this.tablestandings!.map((v) => v.toJson()).toList();
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
        this.awayTeam});

  Matches.fromJson(Map<String, dynamic> json) {
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
    homeTeamScore = json['home_team_score']??"0";
    awayTeamScore = json['away_team_score']??"0";
    homeTeam = json['home_team'] != null
        ? new HomeTeam.fromJson(json['home_team'])
        : null;
    awayTeam = json['away_team'] != null
        ? new HomeTeam.fromJson(json['away_team'])
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

class Standings {
  String? id;
  String? seasonId;
  String? teamId;
  String? matchPlayed;
  String? matchWon;
  String? matchLoss;
  String? matchNoResult;
  String? createdAt;
  String? updatedAt;
  HomeTeam? team;

  Standings(
      {this.id,
        this.seasonId,
        this.teamId,
        this.matchPlayed,
        this.matchWon,
        this.matchLoss,
        this.matchNoResult,
        this.createdAt,
        this.updatedAt,
        this.team});

  Standings.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    seasonId = json['season_id'].toString();
    teamId = json['team_id'].toString();
    matchPlayed = json['match_played'].toString();
    matchWon = json['match_won'].toString();
    matchLoss = json['match_loss'].toString();
    matchNoResult = json['match_no_result'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    team = json['team'] != null ? new HomeTeam.fromJson(json['team']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['season_id'] = this.seasonId;
    data['team_id'] = this.teamId;
    data['match_played'] = this.matchPlayed;
    data['match_won'] = this.matchWon;
    data['match_loss'] = this.matchLoss;
    data['match_no_result'] = this.matchNoResult;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    return data;
  }
}

class Tablestandings {
  String? homeTeamId;
  String? awayTeamId;
  String? playedMatches;
  String? homeTeamWins;
  String? homeTeamLosses;
  HomeTeam? homeTeam;
  HomeTeam? awayTeam;

  Tablestandings(
      {this.homeTeamId,
        this.awayTeamId,
        this.playedMatches,
        this.homeTeamWins,
        this.homeTeamLosses,
        this.homeTeam,
        this.awayTeam});

  Tablestandings.fromJson(Map<String, dynamic> json) {
    homeTeamId = json['home_team_id'].toString();
    awayTeamId = json['away_team_id'].toString();
    playedMatches = json['played_matches'].toString();
    homeTeamWins = json['home_team_wins'].toString();
    homeTeamLosses = json['home_team_losses'].toString();
    homeTeam = json['home_team'] != null
        ? new HomeTeam.fromJson(json['home_team'])
        : null;
    awayTeam = json['away_team'] != null
        ? new HomeTeam.fromJson(json['away_team'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['home_team_id'] = this.homeTeamId;
    data['away_team_id'] = this.awayTeamId;
    data['played_matches'] = this.playedMatches;
    data['home_team_wins'] = this.homeTeamWins;
    data['home_team_losses'] = this.homeTeamLosses;
    if (this.homeTeam != null) {
      data['home_team'] = this.homeTeam!.toJson();
    }
    if (this.awayTeam != null) {
      data['away_team'] = this.awayTeam!.toJson();
    }
    return data;
  }
}
