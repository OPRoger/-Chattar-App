
import 'package:chat_application/pages/Auth/widgets/Auth_Page_Body.dart';
import 'package:chat_application/widget/welcome_head.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:const  [
              Padding(
                padding:  EdgeInsets.only(top: 60.0),
                child: WelcomeHead(),
              ),
              SizedBox(
                height: 20,
              ),
              AuthPageBody()
            ],
          ),
        ),
      ),
    );
  }
}
