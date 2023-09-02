class UpcomingLeaguesModel {
  bool? status;
  int? responseCode;
  String? message;
  List<UpcomingLeague>? league;

  UpcomingLeaguesModel(
      {this.status, this.responseCode, this.message, this.league});

  UpcomingLeaguesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message']??"";
    if (json['league'] != null) {
      league = <UpcomingLeague>[];
      json['league'].forEach((v) {
        league!.add(new UpcomingLeague.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['responseCode'] = this.responseCode;
    data['message'] = this.message;
    if (this.league != null) {
      data['league'] = this.league!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UpcomingLeague {
  String? id;
  String? leagueName;
  String? leagueImage;
  String? sportId;
  String? active;
  String? createdAt;
  String? updatedAt;

  UpcomingLeague(
      {this.id,
        this.leagueName,
        this.leagueImage,
        this.sportId,
        this.active,
        this.createdAt,
        this.updatedAt});

  UpcomingLeague.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    leagueName = json['league_name'].toString();
    leagueImage = json['league_image'].toString();
    sportId = json['sport_id'].toString();
    active = json['active'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['league_name'] = this.leagueName;
    data['league_image'] = this.leagueImage;
    data['sport_id'] = this.sportId;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
