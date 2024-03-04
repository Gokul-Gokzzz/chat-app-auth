import 'package:chat_app/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChatService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Reference firebaseStorage = FirebaseStorage.instance.ref();
  String downloadurl = "";

  sendMessage(String recieverId, String message, String messagetype) async {
    final String currentUserId = firebaseAuth.currentUser!.uid;
    final String currentuseremail = firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();
    Message newmessage = Message(
        messagetype: messagetype,
        content: message,
        recieverId: recieverId,
        senderId: currentUserId,
        time: timestamp,
        senderemail: currentuseremail);

    List ids = [currentUserId, recieverId];
    ids.sort();
    String chatroomid = ids.join("_");
    await firestore
        .collection("chat_room")
        .doc(chatroomid)
        .collection("messages")
        .add(newmessage.toJson());
  }

  addImageMessage(String recieverid, image) async {
    Reference childfolder = firebaseStorage.child('images');
    Reference? imageupload = childfolder.child("$recieverid.jpg");
    try {
      await imageupload.putFile(image);
      downloadurl = await imageupload.getDownloadURL();
      sendMessage(recieverid, downloadurl, "image");
    } catch (e) {
      throw Exception(e);
    }
  }
}
