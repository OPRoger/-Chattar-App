import 'package:chat_application/controller/chat_Controller.dart';
import 'package:chat_application/controller/contact_Controller.dart';
import 'package:chat_application/controller/profile_Controller.dart';
import 'package:chat_application/pages/Contact_Page/widgets/contactSearchField.dart';
import 'package:chat_application/pages/Contact_Page/widgets/newContactTile.dart';
import 'package:chat_application/pages/Home_Page/widgets/Chat_tile.dart';
import 'package:chat_application/pages/chat/chat_Page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  ContactController contactController = Get.put(ContactController());
  ChatController chatController = Get.put(ChatController());
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnable = false.obs;
    return Scaffold(
      appBar: AppBar(
        title: Text("Select contact"),
        actions: [
          Obx(() => IconButton(
              onPressed: () {
                isSearchEnable.value = !isSearchEnable.value;
              },
              icon: isSearchEnable.value
                  ? Icon(Icons.close)
                  : Icon(Icons.search)))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Obx(() => isSearchEnable.value ? ContactSearchField() : SizedBox()),
            SizedBox(
              height: 5,
            ),
            NewContactTile(
                BtName: "New Contacts", icon: Icons.person_add, onTap: () {}),
            SizedBox(
              height: 20,
            ),
            NewContactTile(
                BtName: "Group Contacts", icon: Icons.group_add, onTap: () {}),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text("Contacts on Chattar"),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Obx(() => Column(
                children: contactController.userList
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          Get.to(ChatPage(
                            userModel: e,
                          ));
                          // String roomId = chatController.getRoomId(e.id!);
                          // print(roomId);
                        },
                        child: ChatTile(
                            imageUrl: e.profileImage ?? "assets/Images/boy.png",
                            name: e.name ?? "user",
                            lastChat: e.about ?? "baad m baat krte h ",
                            lastTime: e.email ==
                                    profileController.currentUser.value.email
                                ? "you"
                                : "10:00"),
                      ),
                    )
                    .toList()))
          ],
        ),
      ),
    );
  }
}
