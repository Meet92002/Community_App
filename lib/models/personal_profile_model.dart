class PersonalProfileModel {
  List<PersonalProfileData>? personalProfileData;

  PersonalProfileModel({this.personalProfileData});

  PersonalProfileModel.fromJson(Map<String, dynamic> json) {
    if (json['PersonalProfileData'] != null) {
      personalProfileData = <PersonalProfileData>[];
      json['PersonalProfileData'].forEach((v) {
        personalProfileData!.add(new PersonalProfileData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.personalProfileData != null) {
      data['PersonalProfileData'] =
          this.personalProfileData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PersonalProfileData {
  String? sId;
  String? firstName;
  String? lastName;
  String? dob;
  int? mobileNo;
  String? email;
  String? castName;
  String? gender;
  int? iV;

  PersonalProfileData(
      {this.sId,
        this.firstName,
        this.lastName,
        this.dob,
        this.mobileNo,
        this.email,
        this.castName,
        this.gender,
        this.iV});

  PersonalProfileData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    dob = json['dob'];
    mobileNo = json['mobileNo'];
    email = json['email'];
    castName = json['castName'];
    gender = json['gender'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['dob'] = this.dob;
    data['mobileNo'] = this.mobileNo;
    data['email'] = this.email;
    data['castName'] = this.castName;
    data['gender'] = this.gender;
    data['__v'] = this.iV;
    return data;
  }
}
