class TeamModel {
  bool? status;
  int? responseCode;
  String? message;
  List<Team>? sports;

  TeamModel({this.status, this.responseCode, this.message, this.sports});

  TeamModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message']??"";
    if (json['sports'] != null) {
      sports = <Team>[];
      json['sports'].forEach((v) {
        sports!.add(new Team.fromJson(v));
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

class Team {
  String? name;
  List<Teams>? teams;

  Team({this.name, this.teams});

  Team.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['teams'] != null) {
      teams = <Teams>[];
      json['teams'].forEach((v) {
        teams!.add(new Teams.fromJson(v));
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

class Teams {
  String? id;
  String? teamName;
  String? teamImage;
  String? sportId;
  String? createdAt;
  String? updatedAt;

  Teams(
      {this.id,
        this.teamName,
        this.teamImage,
        this.sportId,
        this.createdAt,
        this.updatedAt});

  Teams.fromJson(Map<String, dynamic> json) {
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
