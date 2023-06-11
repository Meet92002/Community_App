class TestModel {
  JobProfileData? jobProfileData;

  TestModel({this.jobProfileData});

  TestModel.fromJson(Map<String, dynamic> json) {
    jobProfileData = json['JobProfileData'] != null
        ? new JobProfileData.fromJson(json['JobProfileData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobProfileData != null) {
      data['JobProfileData'] = this.jobProfileData!.toJson();
    }
    return data;
  }
}



class JobProfileData {
  String? sId;
  String? companyType;
  String? companyName;
  int? iV;

  JobProfileData({this.sId, this.companyType, this.companyName, this.iV});

  JobProfileData.fromJson(Map<String, dynamic> json) {
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
