class MemberPostModel {
  String? name;
  String? castName;
  int? mobileNo;
  String? sId;
  int? iV;

  MemberPostModel({this.name, this.castName, this.mobileNo, this.sId, this.iV});

  MemberPostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    castName = json['castName'];
    mobileNo = json['mobileNo'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['castName'] = this.castName;
    data['mobileNo'] = this.mobileNo;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
