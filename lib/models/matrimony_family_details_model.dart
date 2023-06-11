class MatrimonyFamilyDetailsModel {
  List<MatrimonyFamilyData>? matrimonyFamilyData;

  MatrimonyFamilyDetailsModel({this.matrimonyFamilyData});

  MatrimonyFamilyDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['matrimonyFamilyData'] != null) {
      matrimonyFamilyData = <MatrimonyFamilyData>[];
      json['matrimonyFamilyData'].forEach((v) {
        matrimonyFamilyData!.add(new MatrimonyFamilyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.matrimonyFamilyData != null) {
      data['matrimonyFamilyData'] =
          this.matrimonyFamilyData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MatrimonyFamilyData {
  String? sId;
  String? fatherName;
  String? motherName;
  String? fatherBusiness;
  int? fatherMobileNo;
  String? elderSister;
  String? elderBrother;
  String? maternal;
  String? nativePlace;
  int? iV;

  MatrimonyFamilyData(
      {this.sId,
        this.fatherName,
        this.motherName,
        this.fatherBusiness,
        this.fatherMobileNo,
        this.elderSister,
        this.elderBrother,
        this.maternal,
        this.nativePlace,
        this.iV});

  MatrimonyFamilyData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fatherName = json['fatherName'];
    motherName = json['motherName'];
    fatherBusiness = json['fatherBusiness'];
    fatherMobileNo = json['fatherMobileNo'];
    elderSister = json['elderSister'];
    elderBrother = json['elderBrother'];
    maternal = json['maternal'];
    nativePlace = json['nativePlace'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fatherName'] = this.fatherName;
    data['motherName'] = this.motherName;
    data['fatherBusiness'] = this.fatherBusiness;
    data['fatherMobileNo'] = this.fatherMobileNo;
    data['elderSister'] = this.elderSister;
    data['elderBrother'] = this.elderBrother;
    data['maternal'] = this.maternal;
    data['nativePlace'] = this.nativePlace;
    data['__v'] = this.iV;
    return data;
  }
}
