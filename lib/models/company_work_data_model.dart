class CompanyWorkDataModel {
  List<CompanyWorkData>? companyWorkData;

  CompanyWorkDataModel({this.companyWorkData});

  CompanyWorkDataModel.fromJson(Map<String, dynamic> json) {
    if (json['companyWorkData'] != null) {
      companyWorkData = <CompanyWorkData>[];
      json['companyWorkData'].forEach((v) {
        companyWorkData!.add(new CompanyWorkData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.companyWorkData != null) {
      data['companyWorkData'] =
          this.companyWorkData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyWorkData {
  String? sId;
  String? workTitle;
  String? workDetails;
  String? workUserName;
  String? workUserCategory;
  int? workRating;
  int? workPrice;
  int? iV;

  CompanyWorkData(
      {this.sId,
        this.workTitle,
        this.workDetails,
        this.workUserName,
        this.workUserCategory,
        this.workRating,
        this.workPrice,
        this.iV});

  CompanyWorkData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    workTitle = json['workTitle'];
    workDetails = json['workDetails'];
    workUserName = json['workUserName'];
    workUserCategory = json['workUserCategory'];
    workRating = json['workRating'];
    workPrice = json['workPrice'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['workTitle'] = this.workTitle;
    data['workDetails'] = this.workDetails;
    data['workUserName'] = this.workUserName;
    data['workUserCategory'] = this.workUserCategory;
    data['workRating'] = this.workRating;
    data['workPrice'] = this.workPrice;
    data['__v'] = this.iV;
    return data;
  }
}