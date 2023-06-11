class MatrimonyBusinessMemberDetailsPostModel {
  String? businessName;
  String? occupation;
  String? businessType;
  int? mobileNo;
  String? businessEmail;
  String? address;
  String? sId;
  int? iV;

  MatrimonyBusinessMemberDetailsPostModel(
      {this.businessName,
        this.occupation,
        this.businessType,
        this.mobileNo,
        this.businessEmail,
        this.address,
        this.sId,
        this.iV});

  MatrimonyBusinessMemberDetailsPostModel.fromJson(Map<String, dynamic> json) {
    businessName = json['businessName'];
    occupation = json['occupation'];
    businessType = json['businessType'];
    mobileNo = json['mobileNo'];
    businessEmail = json['businessEmail'];
    address = json['address'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['businessName'] = this.businessName;
    data['occupation'] = this.occupation;
    data['businessType'] = this.businessType;
    data['mobileNo'] = this.mobileNo;
    data['businessEmail'] = this.businessEmail;
    data['address'] = this.address;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
