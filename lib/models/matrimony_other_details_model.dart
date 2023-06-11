class MatrimonyOtherDetailsModel {
  List<MatrimonyOtherData>? matrimonyOtherData;

  MatrimonyOtherDetailsModel({this.matrimonyOtherData});

  MatrimonyOtherDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['matrimonyOtherData'] != null) {
      matrimonyOtherData = <MatrimonyOtherData>[];
      json['matrimonyOtherData'].forEach((v) {
        matrimonyOtherData!.add(new MatrimonyOtherData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.matrimonyOtherData != null) {
      data['matrimonyOtherData'] =
          this.matrimonyOtherData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MatrimonyOtherData {
  String? sId;
  String? schoolStudies;
  int? schoolYear;
  String? collegeStudies;
  int? collegeYear;
  String? masterStudies;
  int? masterYear;
  String? companyName;
  String? presentPost;
  String? experiance;
  int? iV;

  MatrimonyOtherData(
      {this.sId,
        this.schoolStudies,
        this.schoolYear,
        this.collegeStudies,
        this.collegeYear,
        this.masterStudies,
        this.masterYear,
        this.companyName,
        this.presentPost,
        this.experiance,
        this.iV});

  MatrimonyOtherData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    schoolStudies = json['schoolStudies'];
    schoolYear = json['schoolYear'];
    collegeStudies = json['collegeStudies'];
    collegeYear = json['collegeYear'];
    masterStudies = json['masterStudies'];
    masterYear = json['masterYear'];
    companyName = json['companyName'];
    presentPost = json['presentPost'];
    experiance = json['experiance'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['schoolStudies'] = this.schoolStudies;
    data['schoolYear'] = this.schoolYear;
    data['collegeStudies'] = this.collegeStudies;
    data['collegeYear'] = this.collegeYear;
    data['masterStudies'] = this.masterStudies;
    data['masterYear'] = this.masterYear;
    data['companyName'] = this.companyName;
    data['presentPost'] = this.presentPost;
    data['experiance'] = this.experiance;
    data['__v'] = this.iV;
    return data;
  }
}
