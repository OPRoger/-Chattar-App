import 'package:chat_application/controller/profile_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileUserInfo extends StatefulWidget {
  const ProfileUserInfo({Key? key}) : super(key: key);

  @override
  State<ProfileUserInfo> createState() => _ProfileUserInfoState();
}

class _ProfileUserInfoState extends State<ProfileUserInfo> {
  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return Container(
      padding: EdgeInsets.all(20),
      // height: 200,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/Images/boy.png",
                      width: 100,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        profileController.currentUser.value.name! == null
                            ? "Users"
                            : profileController.currentUser.value.name!,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),),
                SizedBox(
                  height: 5,
                ),
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      profileController.currentUser.value.email!,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Call",
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.chat,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Chat",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
