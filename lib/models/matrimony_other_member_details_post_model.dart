class MatrimonyOtherMemberDetailsPostModel {
  String? schoolStudies;
  int? schoolYear;
  String? collegeStudies;
  int? collegeYear;
  String? masterStudies;
  int? masterYear;
  String? companyName;
  String? presentPost;
  int? experiance;
  String? sId;
  int? iV;

  MatrimonyOtherMemberDetailsPostModel(
      {this.schoolStudies,
        this.schoolYear,
        this.collegeStudies,
        this.collegeYear,
        this.masterStudies,
        this.masterYear,
        this.companyName,
        this.presentPost,
        this.experiance,
        this.sId,
        this.iV});

  MatrimonyOtherMemberDetailsPostModel.fromJson(Map<String, dynamic> json) {
    schoolStudies = json['schoolStudies'];
    schoolYear = json['schoolYear'];
    collegeStudies = json['collegeStudies'];
    collegeYear = json['collegeYear'];
    masterStudies = json['masterStudies'];
    masterYear = json['masterYear'];
    companyName = json['companyName'];
    presentPost = json['presentPost'];
    experiance = json['experiance'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schoolStudies'] = this.schoolStudies;
    data['schoolYear'] = this.schoolYear;
    data['collegeStudies'] = this.collegeStudies;
    data['collegeYear'] = this.collegeYear;
    data['masterStudies'] = this.masterStudies;
    data['masterYear'] = this.masterYear;
    data['companyName'] = this.companyName;
    data['presentPost'] = this.presentPost;
    data['experiance'] = this.experiance;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
