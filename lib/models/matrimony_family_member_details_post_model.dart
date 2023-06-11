class MatrimonyFamilyMemberDetailsPostModel {
  String? fatherName;
  String? motherName;
  String? fatherBusiness;
  int? fatherMobileNo;
  String? elderSister;
  String? elderBrother;
  String? maternal;
  String? nativePlace;
  String? sId;
  int? iV;

  MatrimonyFamilyMemberDetailsPostModel(
      {this.fatherName,
        this.motherName,
        this.fatherBusiness,
        this.fatherMobileNo,
        this.elderSister,
        this.elderBrother,
        this.maternal,
        this.nativePlace,
        this.sId,
        this.iV});

  MatrimonyFamilyMemberDetailsPostModel.fromJson(Map<String, dynamic> json) {
    fatherName = json['fatherName'];
    motherName = json['motherName'];
    fatherBusiness = json['fatherBusiness'];
    fatherMobileNo = json['fatherMobileNo'];
    elderSister = json['elderSister'];
    elderBrother = json['elderBrother'];
    maternal = json['maternal'];
    nativePlace = json['nativePlace'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fatherName'] = this.fatherName;
    data['motherName'] = this.motherName;
    data['fatherBusiness'] = this.fatherBusiness;
    data['fatherMobileNo'] = this.fatherMobileNo;
    data['elderSister'] = this.elderSister;
    data['elderBrother'] = this.elderBrother;
    data['maternal'] = this.maternal;
    data['nativePlace'] = this.nativePlace;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
