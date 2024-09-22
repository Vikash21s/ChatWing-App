class AudioCallModel {
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

  AudioCallModel(
      {this.id,
      this.callerName,
      this.callerPic,
      this.callerUid,
      this.callerEmail,
      this.receiverName,
      this.receiverPic,
      this.receiverUid,
      this.receiverEmail,
      this.status});

  AudioCallModel.fromJson(Map<String, dynamic> json) {
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
    return _data;
  }
}
