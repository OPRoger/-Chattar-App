import 'package:chat_application/Model/chatModel.dart';
import 'package:chat_application/Model/userModel.dart';
import 'package:chat_application/Userprofile/profile_Page.dart';
import 'package:chat_application/Userprofile/widget/profile_userInfo.dart';
import 'package:chat_application/controller/chat_Controller.dart';
import 'package:chat_application/controller/profile_Controller.dart';
import 'package:chat_application/pages/chat/Widgets/chat_Bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;
  const ChatPage({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    ChatController chatController = Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: () {
                Get.to(UserProfilePage(userModel: userModel));
              },
              child: Image.asset("assets/Images/boy.png")),
        ),
        title: InkWell(
          onTap: () {
            Get.to(UserProfilePage(userModel: userModel));

          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.name!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "Online",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: Row(
          children: [
            Container(width: 30, child: Icon(Icons.mic)),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: TextField(
              controller: chatController.messageController,
              decoration:
                  InputDecoration(filled: false, hintText: "Type message here"),
            )),
            SizedBox(
              width: 10,
            ),
            Container(
                child: Image.asset(
              "assets/Icons/gallery.png",
              color: Colors.white,
            )),
            SizedBox(
              width: 10,
            ),
            InkWell(
                onTap: () {
                  if (chatController.messageController.text.isNotEmpty) {
                    chatController.sendMessages(userModel.id!,
                        chatController.messageController.text, userModel);
                    chatController.messageController.clear();
                  }
                },
                child: Container(
                    child: Image.asset(
                  "assets/Icons/right_arrow.png",
                  color: Colors.white,
                  width: 40,
                ))),
          ],
        ),
      ),
      body: Padding(
          padding:
              const EdgeInsets.only(bottom: 80.0, top: 10, left: 10, right: 10),
          child: StreamBuilder<List<ChatModel>>(
            stream: chatController.getMessages(userModel.id!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error : ${snapshot.error}"),
                );
              }
              if (snapshot.data == null) {
                return Center(
                  child: Text("No messages"),
                );
              } else {
                return ListView.builder(
                    reverse: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      DateTime timestamp =
                          DateTime.parse(snapshot.data![index].timestamp!);
                      String formattedTime =
                          DateFormat('hh:mm:a').format(timestamp);
                      return ChatBubble(
                          message: snapshot.data![index].message!,
                          time: formattedTime,
                          status: "read",
                          imageUrl: snapshot.data![index].imageUrl ?? "",
                          isComing: snapshot.data![index].senderId !=
                              profileController.currentUser.value.id!);
                    });
              }
            },
          )),
    );
  }
}
