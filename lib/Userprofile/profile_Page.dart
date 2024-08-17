import 'package:chat_application/Userprofile/widget/profile_userInfo.dart';
import 'package:chat_application/controller/Auth_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",style: Theme.of(context).textTheme.headlineSmall,),
        actions: [
          IconButton(onPressed: (){
            Get.toNamed("/userupdateProfilePage");
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
