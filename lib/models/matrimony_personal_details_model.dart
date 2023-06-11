class MatrimonyPersonalDetailsModel {
  List<MatrimonyPersonalData>? matrimonyPersonalData;

  MatrimonyPersonalDetailsModel({this.matrimonyPersonalData});

  MatrimonyPersonalDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['matrimonyPersonalData'] != null) {
      matrimonyPersonalData = <MatrimonyPersonalData>[];
      json['matrimonyPersonalData'].forEach((v) {
        matrimonyPersonalData!.add(new MatrimonyPersonalData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.matrimonyPersonalData != null) {
      data['matrimonyPersonalData'] =
          this.matrimonyPersonalData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MatrimonyPersonalData {
  String? sId;
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
  int? iV;

  MatrimonyPersonalData(
      {this.sId,
        this.fullName,
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
        this.iV});

  MatrimonyPersonalData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
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
    data['__v'] = this.iV;
    return data;
  }
}
