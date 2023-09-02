class BuyPackModel {
  bool? status;
  int? responseCode;
  String? message;
  List<Packs>? packs;

  BuyPackModel({this.status, this.responseCode, this.message, this.packs});

  BuyPackModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message']??"";
    if (json['packs'] != null) {
      packs = <Packs>[];
      json['packs'].forEach((v) {
        packs!.add(new Packs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['responseCode'] = this.responseCode;
    data['message'] = this.message;
    if (this.packs != null) {
      data['packs'] = this.packs!.map((v) => v.toJson()).toList();
    }
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
