class MyLeadModel {
  List<MyLeadData>? myLeadData;

  MyLeadModel({this.myLeadData});

  MyLeadModel.fromJson(Map<String, dynamic> json) {
    if (json['MyLeadData'] != null) {
      myLeadData = <MyLeadData>[];
      json['MyLeadData'].forEach((v) {
        myLeadData!.add(new MyLeadData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myLeadData != null) {
      data['MyLeadData'] = this.myLeadData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyLeadData {
  String? sId;
  int? leadId;
  String? leadDate;
  String? leadTitle;
  String? leadSubtitle;
  String? leadCategory;
  String? leadDescription;
  String? memberNeed;
  String? leadButtonType;
  int? iV;
  String? leadMemberName;

  MyLeadData(
      {this.sId,
        this.leadId,
        this.leadDate,
        this.leadTitle,
        this.leadSubtitle,
        this.leadCategory,
        this.leadDescription,
        this.memberNeed,
        this.leadButtonType,
        this.iV,
        this.leadMemberName});

  MyLeadData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    leadId = json['leadId'];
    leadDate = json['leadDate'];
    leadTitle = json['leadTitle'];
    leadSubtitle = json['leadSubtitle'];
    leadCategory = json['leadCategory'];
    leadDescription = json['leadDescription'];
    memberNeed = json['memberNeed'];
    leadButtonType = json['leadButtonType'];
    iV = json['__v'];
    leadMemberName = json['leadMemberName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['leadId'] = this.leadId;
    data['leadDate'] = this.leadDate;
    data['leadTitle'] = this.leadTitle;
    data['leadSubtitle'] = this.leadSubtitle;
    data['leadCategory'] = this.leadCategory;
    data['leadDescription'] = this.leadDescription;
    data['memberNeed'] = this.memberNeed;
    data['leadButtonType'] = this.leadButtonType;
    data['__v'] = this.iV;
    data['leadMemberName'] = this.leadMemberName;
    return data;
  }
}
