class CompanyServicesModel {
  List<CompanyServiceData>? companyServiceData;

  CompanyServicesModel({this.companyServiceData});

  CompanyServicesModel.fromJson(Map<String, dynamic> json) {
    if (json['companyServiceData'] != null) {
      companyServiceData = <CompanyServiceData>[];
      json['companyServiceData'].forEach((v) {
        companyServiceData!.add(new CompanyServiceData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.companyServiceData != null) {
      data['companyServiceData'] =
          this.companyServiceData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyServiceData {
  String? sId;
  String? serviceName;
  int? iV;

  CompanyServiceData({this.sId, this.serviceName, this.iV});

  CompanyServiceData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    serviceName = json['serviceName'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['serviceName'] = this.serviceName;
    data['__v'] = this.iV;
    return data;
  }
}
