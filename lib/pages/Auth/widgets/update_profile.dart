import 'package:chat_application/widget/primaryButton.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primaryContainer),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          child: Center(
                              child: Icon(Icons.add_a_photo)
                          ),
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        SizedBox(height: 30,),
                        Row(
                          children: [
                            Text("Personel Info",style: Theme.of(context).textTheme.labelLarge,),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Text("Name",style: Theme.of(context).textTheme.bodyLarge,),
                          ],
                        ),
                        SizedBox(height: 5,),
                        TextField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "amit"
                          ),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Text("Email ID",style: Theme.of(context).textTheme.bodyLarge,),
                          ],
                        ),
                        SizedBox(height: 5,),
                        TextField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.alternate_email_rounded),
                            hintText: "example@gmail.com"
                          ),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Text("Phone no.",style: Theme.of(context).textTheme.bodyLarge,),
                          ],
                        ),
                        SizedBox(height: 5,),
                        TextField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                            hintText: "023456789",
                          ),
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrimaryButton(BtName: "Save", icon: Icons.save_alt, ontap: (){}),
                          ],
                        ),
                        SizedBox(height: 10,)

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
