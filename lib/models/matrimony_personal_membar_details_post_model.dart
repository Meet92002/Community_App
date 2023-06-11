class MatrimonyPersonaMemberDetailsPostModel {
  String? fullName;
  String? castName;
  int? age;
  String? gender;
  String? occupation;
  String? dob;
  int? height;
  int? weight;
  String? birthPlace;
  int? mobileNo;
  String? email;
  String? address;
  String? intrest;
  String? sId;
  int? iV;

  MatrimonyPersonaMemberDetailsPostModel(
      {this.fullName,
        this.castName,
        this.age,
        this.gender,
        this.occupation,
        this.dob,
        this.height,
        this.weight,
        this.birthPlace,
        this.mobileNo,
        this.email,
        this.address,
        this.intrest,
        this.sId,
        this.iV});

  MatrimonyPersonaMemberDetailsPostModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    castName = json['castName'];
    age = json['age'];
    gender = json['gender'];
    occupation = json['occupation'];
    dob = json['dob'];
    height = json['height'];
    weight = json['weight'];
    birthPlace = json['birthPlace'];
    mobileNo = json['mobileNo'];
    email = json['email'];
    address = json['address'];
    intrest = json['intrest'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['castName'] = this.castName;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['occupation'] = this.occupation;
    data['dob'] = this.dob;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['birthPlace'] = this.birthPlace;
    data['mobileNo'] = this.mobileNo;
    data['email'] = this.email;
    data['address'] = this.address;
    data['intrest'] = this.intrest;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
