class SportModel {
  bool? status;
  int? responseCode;
  String? message;
  List<Sports>? sports;

  SportModel({this.status, this.responseCode, this.message, this.sports});

  SportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message']??"";
    if (json['sports'] != null) {
      sports = <Sports>[];
      json['sports'].forEach((v) {
        sports!.add(new Sports.fromJson(v));
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

class Sports {
  String? id;
  String? sportsName;
  String? sportsImage;
  String? createdAt;
  String? updatedAt;

  Sports(
      {this.id,
        this.sportsName,
        this.sportsImage,
        this.createdAt,
        this.updatedAt});

  Sports.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    sportsName = json['sports_name']??"";
    sportsImage = json['sports_image']??"";
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sports_name'] = this.sportsName;
    data['sports_image'] = this.sportsImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
