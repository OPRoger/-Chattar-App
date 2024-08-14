import 'package:chat_application/config/strings.dart';
import 'package:chat_application/widget/slide_button.dart';
import 'package:chat_application/widget/welcome_body.dart';
import 'package:chat_application/widget/welcome_head.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: WelcomeHead(),
            ),
            const SizedBox(
              height: 60,
            ),
             WelcomeBody(),
            SizedBox(height: 50,),
            MySlideActionButton(),
          ],
        ),
      ),
    );
  }
}
