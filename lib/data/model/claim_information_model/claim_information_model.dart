class ClaimInformationModel {
  bool? status;
  int? responseCode;
  String? message;
  ClaimInfo? claimInfo;

  ClaimInformationModel(
      {this.status, this.responseCode, this.message, this.claimInfo});

  ClaimInformationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message']??"";
    claimInfo = json['claim_info'] != null
        ? new ClaimInfo.fromJson(json['claim_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['responseCode'] = this.responseCode;
    data['message'] = this.message;
    if (this.claimInfo != null) {
      data['claim_info'] = this.claimInfo!.toJson();
    }
    return data;
  }
}

class ClaimInfo {
  bool? iseligible;
  String? claimCoins;

  ClaimInfo({this.iseligible, this.claimCoins});

  ClaimInfo.fromJson(Map<String, dynamic> json) {
    iseligible = json['iseligible'];
    claimCoins = json['claim_coins'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iseligible'] = this.iseligible;
    data['claim_coins'] = this.claimCoins;
    return data;
  }
}
