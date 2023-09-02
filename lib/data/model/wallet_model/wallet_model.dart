class WalletDetailModel {
  bool? status;
  int? responseCode;
  String? message;
  ClaimInfo? claimInfo;

  WalletDetailModel(
      {this.status, this.responseCode, this.message, this.claimInfo});

  WalletDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? walletAmount;
  String? lastCredit;
  String? lastDebit;

  ClaimInfo({this.walletAmount, this.lastCredit, this.lastDebit});

  ClaimInfo.fromJson(Map<String, dynamic> json) {
    walletAmount = json['wallet_amount'].toString();
    lastCredit = json['last_credit'].toString();
    lastDebit = json['last_debit'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wallet_amount'] = this.walletAmount;
    data['last_credit'] = this.lastCredit;
    data['last_debit'] = this.lastDebit;
    return data;
  }
}
