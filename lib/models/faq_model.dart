class FaqModel {
  List<FaqData>? faqData;

  FaqModel({this.faqData});

  FaqModel.fromJson(Map<String, dynamic> json) {
    if (json['faqData'] != null) {
      faqData = <FaqData>[];
      json['faqData'].forEach((v) {
        faqData!.add(new FaqData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.faqData != null) {
      data['faqData'] = this.faqData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FaqData {
  String? sId;
  String? faqTitle;
  String? faqSubtitle;
  int? iV;

  FaqData({this.sId, this.faqTitle, this.faqSubtitle, this.iV});

  FaqData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    faqTitle = json['faqTitle'];
    faqSubtitle = json['faqSubtitle'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['faqTitle'] = this.faqTitle;
    data['faqSubtitle'] = this.faqSubtitle;
    data['__v'] = this.iV;
    return data;
  }
}
