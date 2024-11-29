class DashboardResponse {
  int? responseCode;
  List<ClassSectionData>? pendingData;
  int? pendingCount;
  List<ClassSectionData>? completedData;
  int? completedCount;
  List<ClassSectionData>? confirmedData;
  int? confirmedCount;
  String? schoolName;
  String? message;

  DashboardResponse({
    this.responseCode,
    this.pendingData,
    this.pendingCount,
    this.completedData,
    this.completedCount,
    this.confirmedData,
    this.confirmedCount,
    this.schoolName,
    this.message,
  });

  factory DashboardResponse.fromJson(Map<String, dynamic> json) => DashboardResponse(
    responseCode: json["responseCode"],
    pendingData: json["pendingData"] == null ? [] : List<ClassSectionData>.from(json["pendingData"]!.map((x) => ClassSectionData.fromJson(x))),
    pendingCount: json["pendingCount"],
    completedData: json["completedData"] == null ? [] : List<ClassSectionData>.from(json["completedData"]!.map((x) => ClassSectionData.fromJson(x))),
    completedCount: json["completedCount"],
    confirmedData: json["confirmedData"] == null ? [] : List<ClassSectionData>.from(json["confirmedData"]!.map((x) => ClassSectionData.fromJson(x))),
    confirmedCount: json["confirmedCount"],
    schoolName: json["schoolName"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode,
    "pendingData": pendingData == null ? [] : List<dynamic>.from(pendingData!.map((x) => x.toJson())),
    "pendingCount": pendingCount,
    "completedData": completedData == null ? [] : List<dynamic>.from(completedData!.map((x) => x.toJson())),
    "completedCount": completedCount,
    "confirmedData": confirmedData == null ? [] : List<dynamic>.from(confirmedData!.map((x) => x.toJson())),
    "confirmedCount": confirmedCount,
    "schoolName": schoolName,
    "message": message,
  };
}

class ClassSectionData {
  String? Class;
  String? Section;

  ClassSectionData({
    this.Class,
    this.Section,
  });

  factory ClassSectionData.fromJson(Map<String, dynamic> json) => ClassSectionData(
    Class: json["class"],
    Section: json["section"],
  );

  Map<String, dynamic> toJson() => {
    "class": Class,
    "section": Section,
  };
}

