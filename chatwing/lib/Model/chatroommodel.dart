import 'package:chatwing/Model/chatmodel.dart';
import 'package:chatwing/Model/usermodel.dart';

class ChatRoomModel {
  String? id;
  UserModel? sender;
  UserModel? receiver;
  List<ChatModel>? messages;
  int? unReadMessNo;
  String? toUnreadCount;
  String? fromUnreadCount;
  String? lastMessage;
  String? lastMessageTimestamp;
  String? timestamp;

  ChatRoomModel(
      {this.id,
      this.sender,
      this.receiver,
      this.messages,
      this.unReadMessNo,
      this.toUnreadCount,
      this.fromUnreadCount,
      this.lastMessage,
      this.lastMessageTimestamp,
      this.timestamp});

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["sender"] is Map) {
      sender =
          json["sender"] == null ? null : UserModel.fromJson(json["sender"]);
    }
    if (json["receiver"] is Map) {
      receiver = json["receiver"] == null
          ? null
          : UserModel.fromJson(json["receiver"]);
    }
    if (json["messages"] is List) {
      messages = json["messages"] ?? [];
    }
    if (json["unReadMessNo"] is int) {
      unReadMessNo = json["unReadMessNo"];
    }
    if (json["toUnreadCount"] is String) {
      toUnreadCount = json["toUnreadCount"];
    }
    if (json["fromUnreadCount"] is String) {
      fromUnreadCount = json["fromUnreadCount"];
    }
    if (json["lastMessage"] is String) {
      lastMessage = json["lastMessage"];
    }
    if (json["lastMessageTimestamp"] is String) {
      lastMessageTimestamp = json["lastMessageTimestamp"];
    }
    if (json["timestamp"] is String) {
      timestamp = json["timestamp"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    if (sender != null) {
      data["sender"] = sender?.toJson();
    }
    if (receiver != null) {
      data["receiver"] = receiver?.toJson();
    }
    if (messages != null) {
      data["messages"] = messages;
    }
    data["unReadMessNo"] = unReadMessNo;
    data["toUnreadCount"] = toUnreadCount;
    data["fromUnreadCount"] = fromUnreadCount;
    data["lastMessage"] = lastMessage;
    data["lastMessageTimestamp"] = lastMessageTimestamp;
    data["timestamp"] = timestamp;
    return data;
  }
}
