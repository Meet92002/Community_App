class UserProfileSharedPreferences {
  String firstName, lastName, dob, mobileNo, email, castName, gender;

  UserProfileSharedPreferences(this.firstName, this.lastName, this.dob,
      this.mobileNo, this.email, this.castName, this.gender);

  UserProfileSharedPreferences.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'],
        lastName = json['lastName'],
        dob = json['dob'],
        mobileNo = json['mobileNo'],
        email = json['email'],
        castName = json['castName'],
        gender = json['gender'];

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'dob': dob,
        'mobileNo': mobileNo,
        'email': email,
        'castName': castName,
        'gender': gender
      };
}

class AddressProfileSharedPreferences {
  String flatNo, buildingName, city, state, country, zipCode;

  AddressProfileSharedPreferences(this.flatNo, this.buildingName, this.city,
      this.state, this.country, this.zipCode);

  AddressProfileSharedPreferences.fromJson(Map<String, dynamic> json)
      : flatNo = json['flatNo'],
        buildingName = json['buildingName'],
        city = json['city'],
        state = json['state'],
        country = json['country'],
        zipCode = json['zipCode'];

  Map<String, dynamic> toJson() => {
        'flatNo': flatNo,
        'buildingName': buildingName,
        'city': city,
        'state': state,
        'country': country,
        'zipCode': zipCode
      };
}

class BusinessProfileSharedPreferences {
  String businessName,
      businessCategory,
      occupation,
      aboutBusiness,
      officeNo,
      officeName,
      officeCity,
      officeState,
      officeCountry,
      officeZipCode,
      officeNearBy;

  BusinessProfileSharedPreferences(
      this.businessName,
      this.businessCategory,
      this.aboutBusiness,
      this.occupation,
      this.officeNo,
      this.officeName,
      this.officeCity,
      this.officeState,
      this.officeCountry,
      this.officeZipCode,
      this.officeNearBy);

  BusinessProfileSharedPreferences.fromJson(Map<String, dynamic> json)
      : businessName = json['businessName'],
        businessCategory = json['businessCategory'],
        occupation = json['occupation'],
        aboutBusiness = json['aboutBusiness'],
        officeNo = json['officeNo'],
        officeName = json['officeName'],
        officeCity = json['officeCity'],
        officeState = json['officeState'],
        officeCountry = json['officeCountry'],
        officeZipCode = json['officeZipCode'],
        officeNearBy = json['officeNearBy'];

  Map<String, dynamic> toJson() => {
        'businessName': businessName,
        'businessCategory': businessCategory,
        'occupation': occupation,
        'aboutBusiness': aboutBusiness,
        'OfficeNo': officeNo,
        'officeName': officeName,
        'officeCity': officeCity,
        'officeState': officeState,
        'officeCountry': officeCountry,
        'officeZipCode': officeZipCode,
        'officeNearBy': officeNearBy
      };
}

class JobProfileSharedPreferences {
  String companyController, postController, experianceController;

  JobProfileSharedPreferences(
      this.companyController, this.postController, this.experianceController);

  JobProfileSharedPreferences.fromJson(Map<String, dynamic> json)
      : companyController = json['companyController'],
        postController = json['postController'],
        experianceController = json['experianceController'];

  Map<String, dynamic> toJson() => {
        'companyController': companyController,
        'postController': postController,
        'experianceController': experianceController
      };
}
