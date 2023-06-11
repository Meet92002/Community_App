class EventModel {
  List<EventData>? eventData;

  EventModel({this.eventData});

  EventModel.fromJson(Map<String, dynamic> json) {
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
  String? eventName;
  String? eventDescription;
  int? iV;

  EventData({this.sId, this.eventName, this.eventDescription, this.iV});

  EventData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    eventName = json['eventName'];
    eventDescription = json['eventDescription'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['eventName'] = this.eventName;
    data['eventDescription'] = this.eventDescription;
    data['__v'] = this.iV;
    return data;
  }
}
