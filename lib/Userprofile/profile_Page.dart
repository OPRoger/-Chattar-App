import 'package:chat_application/Model/userModel.dart';
import 'package:chat_application/Userprofile/widget/profile_userInfo.dart';
import 'package:chat_application/controller/Auth_Controller.dart';
import 'package:chat_application/controller/profile_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfilePage extends StatelessWidget {
  final UserModel userModel;
  const UserProfilePage({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed("/userupdateProfilePage");
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            LoginUserInfo(
                profileImage: userModel.profileImage ?? "assets/Images/boy.png",
                userName: userModel.name ?? "users",
                userEmail: userModel.email ?? ""
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  authController.logoutUser();
                },
                child: Text("Log Out"))
          ],
        ),
      ),
    );
  }
}
