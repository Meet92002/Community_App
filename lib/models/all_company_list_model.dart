class AllCompanyListModel {
  List<CompanyTypeData>? companyTypeData;

  AllCompanyListModel({this.companyTypeData});

  AllCompanyListModel.fromJson(Map<String, dynamic> json) {
    if (json['companyTypeData'] != null) {
      companyTypeData = <CompanyTypeData>[];
      json['companyTypeData'].forEach((v) {
        companyTypeData!.add(new CompanyTypeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.companyTypeData != null) {
      data['companyTypeData'] =
          this.companyTypeData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyTypeData {
  String? sId;
  String? companyType;
  String? companyName;
  int? iV;

  CompanyTypeData({this.sId, this.companyType, this.companyName, this.iV});

  CompanyTypeData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    companyType = json['companyType'];
    companyName = json['companyName'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['companyType'] = this.companyType;
    data['companyName'] = this.companyName;
    data['__v'] = this.iV;
    return data;
  }
}
