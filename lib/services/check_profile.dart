import 'dart:convert';

import 'package:community_app/services/profile_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckProfile {
  bool isCheck({required SharedPreferences sharedPreferences}) {




    if (!isNullEmptyOrFalse(sharedPreferences.getString('userData')) &&
        !isNullEmptyOrFalse(sharedPreferences.getString('addressData'))) {
      Map<String, dynamic> personalProfileMap =
          jsonDecode(sharedPreferences.getString('userData') ?? "");
      UserProfileSharedPreferences userProfileSharedPreferences =
          UserProfileSharedPreferences.fromJson(personalProfileMap);

      Map<String, dynamic> addressProfileMap =
          jsonDecode(sharedPreferences.getString('addressData') ?? "");
      AddressProfileSharedPreferences addressProfileSharedPreferences =
          AddressProfileSharedPreferences.fromJson(addressProfileMap);

      // Map<String, dynamic> businessProfileMap =
      //     jsonDecode(sharedPreferences.getString('businessData') ?? "");
      // BusinessProfileSharedPreferences businessProfileSharedPreferences =
      //     BusinessProfileSharedPreferences.fromJson(businessProfileMap);
      //
      // Map<String, dynamic> jobProfileMap =
      //     jsonDecode(sharedPreferences.getString('jobData') ?? "");
      // JobProfileSharedPreferences jobProfileSharedPreferences =
      //     JobProfileSharedPreferences.fromJson(jobProfileMap);

      if (userProfileSharedPreferences.firstName != "" &&
          userProfileSharedPreferences.lastName != "" &&
          userProfileSharedPreferences.mobileNo != "" &&
          userProfileSharedPreferences.email != "" &&
          userProfileSharedPreferences.gender != "" &&
          userProfileSharedPreferences.dob != "" &&
          userProfileSharedPreferences.castName != ""  &&
          addressProfileSharedPreferences.buildingName != "" &&
          addressProfileSharedPreferences.city != "" &&
          addressProfileSharedPreferences.country != "" &&
          addressProfileSharedPreferences.flatNo != "" &&
          addressProfileSharedPreferences.state != "" &&
          addressProfileSharedPreferences.zipCode != "") {
        return false;
      }
    }
    return true;
  }

  bool isNullEmptyOrFalse(dynamic o) {
    if (o is Map<String, dynamic> || o is List<dynamic>) {
      return o == null || o.length == 0;
    }
    return o == null || false == o || "" == o;
  }
}
