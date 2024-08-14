import 'package:chat_application/pages/chat/Widgets/chat_Bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/Images/boy.png"),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Amit Kumar",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Online",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
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
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
              color: Theme.of(context).colorScheme.primaryContainer
        ),
        child: Row(
          children: [
            Container(
                width: 30,
                child: Icon(Icons.mic)),
            SizedBox(width: 10,),
            Expanded(child: TextField(
              decoration: InputDecoration(
                filled: false,
                hintText: "Type message here"

              ),
            )),
            SizedBox(width: 10,),
            Container(child: Image.asset("assets/Icons/gallery.png",color: Colors.white,)),
            SizedBox(width: 10,),
            Container(child: Image.asset("assets/Icons/right_arrow.png",color: Colors.white,width: 40,)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ChatBubble(
                message: "hi I'm coming",
                time: "09:33 PM",
                status: "read",
                imageUrl: "",
                isComing: true),
            ChatBubble(
                message: "hi I'm coming",
                time: "09:33 PM",
                status: "read",
                imageUrl: "",
                isComing: true),
            ChatBubble(
                message: "hi I'm coming",
                time: "09:33 PM",
                status: "read",
                imageUrl: "https://www.mindinventory.com/blog/wp-content/uploads/2022/10/flutter-3.png",
                isComing: false),
            ChatBubble(
                message: "hi I'm coming",
                time: "09:33 PM",
                status: "read",
                imageUrl: "",
                isComing: true),
            ChatBubble(
                message: "hi I'm coming",
                time: "09:33 PM",
                status: "read",
                imageUrl: "https://www.mindinventory.com/blog/wp-content/uploads/2022/10/flutter-3.png",
                isComing: false),
            ChatBubble(
                message: "hi I'm coming",
                time: "09:33 PM",
                status: "read",
                imageUrl: "",
                isComing: true),
            ChatBubble(
                message: "hi I'm coming",
                time: "09:33 PM",
                status: "read",
                imageUrl: "https://www.mindinventory.com/blog/wp-content/uploads/2022/10/flutter-3.png",
                isComing: false),
          ],
        ),
      ),
    );
  }
}
