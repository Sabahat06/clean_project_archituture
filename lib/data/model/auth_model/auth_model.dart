class AuthModel {
  bool? status;
  int? responseCode;
  String? message;
  User? user;

  AuthModel({this.status, this.responseCode, this.message, this.user});

  AuthModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message']??"";
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['responseCode'] = this.responseCode;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? profilePhoto;
  String? phone;
  String? blockchainAddress;
  String? active;
  String? freePointsClaimed;
  String? createdAt;
  String? updatedAt;
  String? walletCoins;
  String? token;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.profilePhoto,
        this.phone,
        this.blockchainAddress,
        this.active,
        this.freePointsClaimed,
        this.createdAt,
        this.updatedAt,
        this.walletCoins,
        this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name']??"";
    email = json['email']??"";
    emailVerifiedAt = json['email_verified_at']??"";
    profilePhoto = json['profile_photo']??"";
    phone = json['phone']??"";
    blockchainAddress = json['blockchain_address']??"";
    active = json['active'].toString();
    freePointsClaimed = json['free_points_claimed'].toString();
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
    walletCoins = json['wallet_coins'].toString();
    token = json['token']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['profile_photo'] = this.profilePhoto;
    data['phone'] = this.phone;
    data['blockchain_address'] = this.blockchainAddress;
    data['active'] = this.active;
    data['free_points_claimed'] = this.freePointsClaimed;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['wallet_coins'] = this.walletCoins;
    data['token'] = this.token;
    return data;
  }
}
