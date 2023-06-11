class MyAskModel {
  List<MyAskData>? myAskData;

  MyAskModel({this.myAskData});

  MyAskModel.fromJson(Map<String, dynamic> json) {
    if (json['myAskData'] != null) {
      myAskData = <MyAskData>[];
      json['myAskData'].forEach((v) {
        myAskData!.add(new MyAskData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myAskData != null) {
      data['myAskData'] = this.myAskData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyAskData {
  String? sId;
  String? companyName;
  String? businessCategory;
  String? description;
  String? timeDuration;
  int? iV;

  MyAskData(
      {this.sId,
        this.companyName,
        this.businessCategory,
        this.description,
        this.timeDuration,
        this.iV});

  MyAskData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    companyName = json['companyName'];
    businessCategory = json['businessCategory'];
    description = json['description'];
    timeDuration = json['timeDuration'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['companyName'] = this.companyName;
    data['businessCategory'] = this.businessCategory;
    data['description'] = this.description;
    data['timeDuration'] = this.timeDuration;
    data['__v'] = this.iV;
    return data;
  }
}
