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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["callerName"] = callerName;
    _data["callerPic"] = callerPic;
    _data["callerUid"] = callerUid;
    _data["callerEmail"] = callerEmail;
    _data["receiverName"] = receiverName;
    _data["receiverPic"] = receiverPic;
    _data["receiverUid"] = receiverUid;
    _data["receiverEmail"] = receiverEmail;
    _data["status"] = status;
    _data["type"] = type;
    _data["time"] = time;
    _data["timestamp"] = timestamp;
    return _data;
  }
}
