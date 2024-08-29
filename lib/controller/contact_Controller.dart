import 'package:chat_application/Model/chatRoom_Model.dart';
import 'package:chat_application/Model/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  RxList<UserModel> userList = <UserModel>[].obs;
  RxList<ChatRoomModel> chatRoomList = <ChatRoomModel>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getUserDetails();
    await getChatRoomList();
  }

  Future<void> getUserDetails() async {
    isLoading.value = true;
    try {
      userList.clear();
      await db.collection("users").get().then((value) => {
            userList.value =
                value.docs.map((e) => UserModel.fromJson(e.data())).toList()
          });
    } catch (ex) {
      print(ex);
    }
    isLoading.value = false;
  }

  Future<void> getChatRoomList() async {
    isLoading.value = true;
    List<ChatRoomModel> tempChatRoomList = [];
    try {
      tempChatRoomList.clear();
      await db.collection("chats").get().then((value) => {
        tempChatRoomList =
                value.docs.map((e) => ChatRoomModel.fromJson(e.data())).toList()
          });
      chatRoomList.value = tempChatRoomList.where((e) => e.id!.contains(auth.currentUser!.uid)).toList();
    } catch (ex) {
      print(ex);
    }

    isLoading.value = false;
  }
}
