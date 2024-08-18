import 'package:chat_application/controller/profile_Controller.dart';
import 'package:chat_application/pages/Home_Page/widgets/Tab_Bar.dart';
import 'package:chat_application/pages/Home_Page/widgets/chat_list_View.dart';
import 'package:chat_application/profilePage/profile_Page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        appBar: AppBar(

          title: Text(
            "CHATTAR",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset("assets/Icons/AppIcon.png"),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () async{
              // Get.toNamed("/userprofilePage")
             await profileController.getUserDetails();
              Get.to(ProfilePage());
            }, icon: Icon(Icons.more_vert)),
          ],
          bottom: myTabBar(tabController, context),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            ChatListView(),
            ListView(
              children: [
                ListTile(
                  title: Text("Name is amit"),
                ),
              ],
            ),
            ListView(
              children: [
                ListTile(
                  title: Text("Name is amit"),
                ),
              ],
            ),
          ],
        ));
  }
}
