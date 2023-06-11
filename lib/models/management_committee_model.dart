class ManagementCommitteeModel {
  List<ManagementData>? managementData;

  ManagementCommitteeModel({this.managementData});

  ManagementCommitteeModel.fromJson(Map<String, dynamic> json) {
    if (json['managementData'] != null) {
      managementData = <ManagementData>[];
      json['managementData'].forEach((v) {
        managementData!.add(new ManagementData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.managementData != null) {
      data['managementData'] =
          this.managementData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ManagementData {
  String? sId;
  String? name;
  String? subTitle;
  int? mobileNo;
  int? iV;

  ManagementData({this.sId, this.name, this.subTitle, this.mobileNo, this.iV});

  ManagementData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    subTitle = json['subTitle'];
    mobileNo = json['mobileNo'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['subTitle'] = this.subTitle;
    data['mobileNo'] = this.mobileNo;
    data['__v'] = this.iV;
    return data;
  }
}
