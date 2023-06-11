class FinanceCommitteeModel {
  List<FinanceData>? financeData;

  FinanceCommitteeModel({this.financeData});

  FinanceCommitteeModel.fromJson(Map<String, dynamic> json) {
    if (json['financeData'] != null) {
      financeData = <FinanceData>[];
      json['financeData'].forEach((v) {
        financeData!.add(new FinanceData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.financeData != null) {
      data['financeData'] = this.financeData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FinanceData {
  String? sId;
  String? name;
  String? subTitle;
  int? mobileNo;
  int? iV;

  FinanceData({this.sId, this.name, this.subTitle, this.mobileNo, this.iV});

  FinanceData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    subTitle = json['subTitle'];
    mobileNo = json['mobileNo'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['subTitle'] = this.subTitle;
    data['mobileNo'] = this.mobileNo;
    data['__v'] = this.iV;
    return data;
  }
}
