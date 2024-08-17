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


  TextEditingController name = TextEditingController(text: "amit" );
  TextEditingController email = TextEditingController(text: "example@gmail.com");
  TextEditingController phone = TextEditingController(text: "012345678");
  TextEditingController about = TextEditingController(text: "all is well");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
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
                            CircleAvatar(
                              child: Container(
                                alignment: Alignment.bottomRight,
                                child:
                                  Obx(() => isEdit.value
                                      ? InkWell(onTap: (){},child: Icon(Icons.add_a_photo))
                                      : Container()),

                              ),
                              radius: 50,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Obx(
                          () => TextField(
                            controller: name,
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
                            controller: about,
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
                          controller: email,
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
                            controller: phone,
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
                                      ontap: () {
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
