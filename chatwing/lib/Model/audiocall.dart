class CallModel {
  String? id;
  String? callerName;
  String? callerPic;
  String? callerUid;
  String? callerEmail;
  String? receiverName;
  String? receiverPic;
  String? receiverUid;
  String? receiverEmail;
  String? status;
  String? type;
  String? time;
  String? timestamp;

  CallModel({
    this.id,
    this.callerName,
    this.callerPic,
    this.callerUid,
    this.callerEmail,
    this.receiverName,
    this.receiverPic,
    this.receiverUid,
    this.receiverEmail,
    this.status,
    this.type,
    this.time,
    this.timestamp,
  });

  CallModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    callerName = json["callerName"];
    callerPic = json["callerPic"];
    callerUid = json["callerUid"];
    callerEmail = json["callerEmail"];
    receiverName = json["receiverName"];
    receiverPic = json["receiverPic"];
    receiverUid = json["receiverUid"];
    receiverEmail = json["receiverEmail"];
    status = json["status"];
    type = json["type"];
    time = json["time"];
    timestamp = json["timestamp"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["callerName"] = callerName;
    data["callerPic"] = callerPic;
    data["callerUid"] = callerUid;
    data["callerEmail"] = callerEmail;
    data["receiverName"] = receiverName;
    data["receiverPic"] = receiverPic;
    data["receiverUid"] = receiverUid;
    data["receiverEmail"] = receiverEmail;
    data["status"] = status;
    data["type"] = type;
    data["time"] = time;
    data["timestamp"] = timestamp;
    return data;
  }
}
