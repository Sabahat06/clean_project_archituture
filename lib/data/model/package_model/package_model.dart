class PackageModel {
  bool? status;
  int? responseCode;
  String? message;
  List<Packages>? packages;

  PackageModel({this.status, this.responseCode, this.message, this.packages});

  PackageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message']??"";
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(new Packages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['responseCode'] = this.responseCode;
    data['message'] = this.message;
    if (this.packages != null) {
      data['packages'] = this.packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Packages {
  String? id;
  String? packageName;
  String? active;
  String? amount;
  String? coins;
  String? createdAt;
  String? updatedAt;

  Packages(
      {this.id,
        this.packageName,
        this.active,
        this.amount,
        this.coins,
        this.createdAt,
        this.updatedAt});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    packageName = json['package_name'].toString();
    active = json['active'].toString();
    amount = json['amount'].toString();
    coins = json['coins'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_name'] = this.packageName;
    data['active'] = this.active;
    data['amount'] = this.amount;
    data['coins'] = this.coins;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
