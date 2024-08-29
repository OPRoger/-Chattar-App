import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_application/controller/profile_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginUserInfo extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String userEmail;
  const LoginUserInfo({Key? key, required this.profileImage, required this.userName, required this.userEmail}) : super(key: key);

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
                    Container(
                      height: 180,
                      width: 180,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:
                        CachedNetworkImage(
                          imageUrl: profileController.currentUser
                              .value.profileImage!,
                          fit: BoxFit.cover,
                          placeholder: (context,url)=> CircularProgressIndicator(),
                          errorWidget: (context,url,error)=> Icon(Icons.error),
                        )
                      ),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(100)
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        userName,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userEmail,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
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

