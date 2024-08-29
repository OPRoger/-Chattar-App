import 'package:chat_application/controller/contact_Controller.dart';
import 'package:chat_application/pages/Home_Page/widgets/Chat_tile.dart';
import 'package:chat_application/pages/chat/chat_Page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());
    return RefreshIndicator(child: Obx(() => Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
          children: contactController.chatRoomList.map((e) =>InkWell(
            onTap: (){
              Get.to(ChatPage(userModel: e.receiver!));
            },
            child: ChatTile(
                imageUrl:  e.receiver!.profileImage ?? "assets/Images/boy.png",
                name: e.receiver!.name ?? "user",
                lastChat: e.lastMessage ?? "last message",
                lastTime: e.lastMessageTimestamp ?? ""),
          ) ).toList()
      ),
    )), onRefresh: ()async{
      return contactController.getChatRoomList();
    });
  }
}
