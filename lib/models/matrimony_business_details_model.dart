class MatrimonyBusinessDetailsModel {
  List<MatrimonyBusinessData>? matrimonyBusinessData;

  MatrimonyBusinessDetailsModel({this.matrimonyBusinessData});

  MatrimonyBusinessDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['matrimonyBusinessData'] != null) {
      matrimonyBusinessData = <MatrimonyBusinessData>[];
      json['matrimonyBusinessData'].forEach((v) {
        matrimonyBusinessData!.add(new MatrimonyBusinessData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.matrimonyBusinessData != null) {
      data['matrimonyBusinessData'] =
          this.matrimonyBusinessData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MatrimonyBusinessData {
  String? sId;
  String? businessName;
  String? occupation;
  String? businessType;
  int? mobileNo;
  String? businessEmail;
  String? address;
  int? iV;

  MatrimonyBusinessData(
      {this.sId,
        this.businessName,
        this.occupation,
        this.businessType,
        this.mobileNo,
        this.businessEmail,
        this.address,
        this.iV});

  MatrimonyBusinessData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    businessName = json['businessName'];
    occupation = json['occupation'];
    businessType = json['businessType'];
    mobileNo = json['mobileNo'];
    businessEmail = json['businessEmail'];
    address = json['address'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['businessName'] = this.businessName;
    data['occupation'] = this.occupation;
    data['businessType'] = this.businessType;
    data['mobileNo'] = this.mobileNo;
    data['businessEmail'] = this.businessEmail;
    data['address'] = this.address;
    data['__v'] = this.iV;
    return data;
  }
}
