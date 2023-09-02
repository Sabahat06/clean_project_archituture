class LeagueModel {
  bool? status;
  int? responseCode;
  String? message;
  List<League>? sports;

  LeagueModel({this.status, this.responseCode, this.message, this.sports});

  LeagueModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message']??"";
    if (json['sports'] != null) {
      sports = <League>[];
      json['sports'].forEach((v) {
        sports!.add(new League.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['responseCode'] = this.responseCode;
    data['message'] = this.message;
    if (this.sports != null) {
      data['sports'] = this.sports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class League {
  String? name;
  List<Leagues>? teams;

  League({this.name, this.teams});

  League.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['teams'] != null) {
      teams = <Leagues>[];
      json['teams'].forEach((v) {
        teams!.add(new Leagues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.teams != null) {
      data['teams'] = this.teams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Leagues {
  String? id;
  String? leagueName;
  String? leagueImage;
  String? sportId;
  String? active;
  String? createdAt;
  String? updatedAt;

  Leagues(
      {this.id,
        this.leagueName,
        this.leagueImage,
        this.sportId,
        this.active,
        this.createdAt,
        this.updatedAt});

  Leagues.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    leagueName = json['league_name']??"";
    leagueImage = json['league_image']??"";
    sportId = json['sport_id'].toString();
    active = json['active'].toString();
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
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
