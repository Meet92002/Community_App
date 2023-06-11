class MemberDirectoryModel {
  List<MemberData>? memberData;

  MemberDirectoryModel({this.memberData});

  MemberDirectoryModel.fromJson(Map<String, dynamic> json) {
    if (json['memberData'] != null) {
      memberData = <MemberData>[];
      json['memberData'].forEach((v) {
        memberData!.add(new MemberData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.memberData != null) {
      data['memberData'] = this.memberData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemberData {
  String? sId;
  String? name;
  String? castName;
  int? mobileNo;
  String? dob;
  String? marriageAnniversary;
  int? emergancyContact;
  String? address;
  String? companyName;
  String? businessType;
  String? category;
  String? subCategory;
  String? product;
  String? formation;
  String? establishment;
  String? emialAddress;
  String? businessAddress;
  int? iV;

  MemberData(
      {this.sId,
        this.name,
        this.castName,
        this.mobileNo,
        this.dob,
        this.marriageAnniversary,
        this.emergancyContact,
        this.address,
        this.companyName,
        this.businessType,
        this.category,
        this.subCategory,
        this.product,
        this.formation,
        this.establishment,
        this.emialAddress,
        this.businessAddress,
        this.iV});

  MemberData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    castName = json['castName'];
    mobileNo = json['mobileNo'];
    dob = json['dob'];
    marriageAnniversary = json['marriageAnniversary'];
    emergancyContact = json['EmergancyContact'];
    address = json['Address'];
    companyName = json['companyName'];
    businessType = json['businessType'];
    category = json['category'];
    subCategory = json['subCategory'];
    product = json['product'];
    formation = json['formation'];
    establishment = json['establishment'];
    emialAddress = json['emialAddress'];
    businessAddress = json['businessAddress'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['castName'] = this.castName;
    data['mobileNo'] = this.mobileNo;
    data['dob'] = this.dob;
    data['marriageAnniversary'] = this.marriageAnniversary;
    data['EmergancyContact'] = this.emergancyContact;
    data['Address'] = this.address;
    data['companyName'] = this.companyName;
    data['businessType'] = this.businessType;
    data['category'] = this.category;
    data['subCategory'] = this.subCategory;
    data['product'] = this.product;
    data['formation'] = this.formation;
    data['establishment'] = this.establishment;
    data['emialAddress'] = this.emialAddress;
    data['businessAddress'] = this.businessAddress;
    data['__v'] = this.iV;
    return data;
  }
}
