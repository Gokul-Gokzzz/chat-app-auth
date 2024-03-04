import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String? messagetype;
  String? content;
  String? senderId;
  String? senderemail;
  String? recieverId;
  Timestamp? time;
  Message(
      {required this.content,
      required this.messagetype,
      required this.recieverId,
      required this.senderId,
      required this.time,
      required this.senderemail});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        messagetype: json["messagetype"],
        senderemail: json["senderemail"],
        content: json["content"],
        recieverId: json["recieverId"],
        senderId: json["senderId"],
        time: json["time"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "messagetype": messagetype,
      'senderemail': senderemail,
      "content": content,
      "recieverId": recieverId,
      "senderId": senderId,
      "time": time
    };
  }
}
