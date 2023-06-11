class PdfModel {
  List<PdfData>? pdfData;

  PdfModel({this.pdfData});

  PdfModel.fromJson(Map<String, dynamic> json) {
    if (json['pdfData'] != null) {
      pdfData = <PdfData>[];
      json['pdfData'].forEach((v) {
        pdfData!.add(new PdfData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pdfData != null) {
      data['pdfData'] = this.pdfData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PdfData {
  String? pdfName;
  String? pdf;
  Request? request;

  PdfData({this.pdfName, this.pdf, this.request});

  PdfData.fromJson(Map<String, dynamic> json) {
    pdfName = json['pdfName'];
    pdf = json['Pdf'];
    request =
    json['request'] != null ? new Request.fromJson(json['request']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pdfName'] = this.pdfName;
    data['Pdf'] = this.pdf;
    if (this.request != null) {
      data['request'] = this.request!.toJson();
    }
    return data;
  }
}

class Request {
  String? type;
  String? url;

  Request({this.type, this.url});

  Request.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}
