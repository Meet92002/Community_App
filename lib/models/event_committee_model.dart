class EventCommitteeModel {
  List<EventData>? eventData;

  EventCommitteeModel({this.eventData});

  EventCommitteeModel.fromJson(Map<String, dynamic> json) {
    if (json['eventData'] != null) {
      eventData = <EventData>[];
      json['eventData'].forEach((v) {
        eventData!.add(new EventData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eventData != null) {
      data['eventData'] = this.eventData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventData {
  String? sId;
  String? name;
  String? subTitle;
  int? mobileNo;
  int? iV;

  EventData({this.sId, this.name, this.subTitle, this.mobileNo, this.iV});

  EventData.fromJson(Map<String, dynamic> json) {
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
