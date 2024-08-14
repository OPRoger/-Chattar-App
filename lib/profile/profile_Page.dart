import 'package:chat_application/controller/Auth_Controller.dart';
import 'package:chat_application/profile/widget/profile_userInfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",style: Theme.of(context).textTheme.headlineSmall,),
        actions: [
          IconButton(onPressed: (){
            Get.toNamed("/updateProfilePage");
          }, icon: Icon(Icons.edit))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProfileUserInfo(),
            Spacer(),
            ElevatedButton(onPressed: (){
              authController.logoutUser();
            }, child: Text("Log Out"))
          ],
        ),
      ),
    );
  }
}
