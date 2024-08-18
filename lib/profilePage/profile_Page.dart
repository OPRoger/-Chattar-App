import 'dart:io';

import 'package:chat_application/controller/Auth_Controller.dart';
import 'package:chat_application/controller/image_Picker_Controller.dart';
import 'package:chat_application/controller/profile_Controller.dart';
import 'package:chat_application/widget/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  RxBool isEdit = false.obs;
  ProfileController profileController = Get.put(ProfileController());
  AuthController authController = Get.put(AuthController());
  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  RxString imagePath = "".obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
              onPressed: () {
                authController.logoutUser();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(() => isEdit.value
                                ? InkWell(
                                    onTap: () async {
                                      imagePath.value =
                                          await imagePickerController
                                              .pickImage();
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: imagePath.value == ""
                                          ? Icon(Icons.add_a_photo)
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Image.file(
                                                File(imagePath.value),
                                                fit: BoxFit.cover,
                                              )),
                                    ))
                                : Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: profileController.currentUser.value
                                                    .profileImage ==
                                                "" ||
                                            profileController.currentUser.value
                                                    .profileImage ==
                                                null
                                        ? Icon(Icons.image)
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.network(
                                              profileController.currentUser
                                                  .value.profileImage!,
                                              fit: BoxFit.cover,
                                            ),
                                          )))
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Obx(
                          () => TextField(
                            controller: profileController.name,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                              labelText: "name",
                              prefixIcon: Icon(Icons.person),
                              filled: isEdit.value,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => TextField(
                            controller: profileController.name,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                              labelText: "about",
                              prefixIcon: Icon(Icons.info),
                              filled: isEdit.value,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: profileController.email,
                          enabled: false,
                          decoration: InputDecoration(
                            labelText: "email",
                            prefixIcon: Icon(Icons.alternate_email_rounded),
                            filled: isEdit.value,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => TextField(
                            controller: profileController.phone,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                              labelText: "phone no.",
                              prefixIcon: Icon(Icons.call),
                              filled: isEdit.value,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => isEdit.value
                                  ? PrimaryButton(
                                      BtName: "Save",
                                      icon: Icons.save_alt,
                                      ontap: () async {
                                        await profileController.updateProfile(
                                          imagePath.value,
                                        );

                                        isEdit.value = false;
                                      })
                                  : PrimaryButton(
                                      BtName: "Edit",
                                      icon: Icons.edit,
                                      ontap: () {
                                        isEdit.value = true;
                                      }),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
