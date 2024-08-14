import 'package:chat_application/pages/Home_Page/widgets/Chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          InkWell(
            onTap: (){
              Get.toNamed("/chatPage");
            },
            child: ChatTile(
                imageUrl: "assets/Images/boy.png",
                name: "Amit kumar",
                lastChat: "baad m baat krte h ",
                lastTime: "08:33 PM"),
          ),
          ChatTile(
              imageUrl: "assets/Images/boy.png",
              name: "Amit kumar",
              lastChat: "baad m baat krte h ",
              lastTime: "08:33 PM"),
          ChatTile(
              imageUrl: "assets/Images/girl.png",
              name: "Amit kumar",
              lastChat: "baad m baat krte h ",
              lastTime: "08:33 PM"),
          ChatTile(
              imageUrl: "assets/Images/boy.png",
              name: "Amit kumar",
              lastChat: "baad m baat krte h ",
              lastTime: "08:33 PM"),
          ChatTile(
              imageUrl: "assets/Images/girl.png",
              name: "Amit kumar",
              lastChat: "baad m baat krte h ",
              lastTime: "08:33 PM"),
          ChatTile(
              imageUrl: "assets/Images/boy.png",
              name: "Amit kumar",
              lastChat: "baad m baat krte h ",
              lastTime: "08:33 PM"),
          ChatTile(
              imageUrl: "assets/Images/girl.png",
              name: "Amit kumar",
              lastChat: "baad m baat krte h ",
              lastTime: "08:33 PM"),
          ChatTile(
              imageUrl: "assets/Images/boy.png",
              name: "Amit kumar",
              lastChat: "baad m baat krte h ",
              lastTime: "08:33 PM"),
        ],
      ),
    );
  }
}
