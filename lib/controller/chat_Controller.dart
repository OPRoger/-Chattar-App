import 'package:chat_application/Model/chatModel.dart';
import 'package:chat_application/Model/chatRoom_Model.dart';
import 'package:chat_application/Model/userModel.dart';
import 'package:chat_application/controller/profile_Controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ChatController extends GetxController {
  TextEditingController messageController = TextEditingController();

  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  var uuid = Uuid();
  RxBool isLoading = false.obs;
  ProfileController profileController = Get.put(ProfileController());

  String getRoomId(String targetUserId) {
    String currentUserId = auth.currentUser!.uid;

    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currentUserId + targetUserId;
    } else {
      return targetUserId + currentUserId;
    }
  }

  Future<void> sendMessages(
      String targetUserId, String message, UserModel targetUser) async {
    isLoading.value = true;
    String roomId = getRoomId(targetUserId);
    DateTime timestamp =
    DateTime.now();
    String nowTime =
    DateFormat('hh:mm:a').format(timestamp);
    String chatId = uuid.v6();
    var newChat = ChatModel(
      message: message,
      id: chatId,
      senderId: auth.currentUser!.uid,
      recieverId: targetUserId,
      senderName: profileController.currentUser.value.name,
      timestamp: DateTime.now().toString(),
    );

    var roomDetails = ChatRoomModel(
      id: roomId,
      lastMessage: message,
      lastMessageTimestamp: nowTime,
      sender: profileController.currentUser.value,
      receiver: targetUser,
      timestamp: DateTime.now().toString(),
      unReadMessNo: 0,
    );

    try {
      await db.collection("chats").doc(roomId).set(roomDetails.toJson());

      await db
          .collection("chats")
          .doc(roomId)
          .collection("messages")
          .doc(chatId)
          .set(
            newChat.toJson(),
          );
    } catch (ex) {
      print(ex);
    }
    isLoading.value = false;
  }

  Stream<List<ChatModel>> getMessages(String targetUserId) {
    String roomId = getRoomId(targetUserId);
    return db
        .collection("chats")
        .doc(roomId)
        .collection("messages")
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map(
                (doc) => ChatModel.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }
}
