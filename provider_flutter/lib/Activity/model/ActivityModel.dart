class ActivityModel {
  String? type;
  String? title;
  int? status;
  String? traceId;

  ActivityModel({this.type, this.title, this.status, this.traceId});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    status = json['status'];
    traceId = json['traceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['title'] = title;
    data['status'] = status;
    data['traceId'] = traceId;
    return data;
  }
}
