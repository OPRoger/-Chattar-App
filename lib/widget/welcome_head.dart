import 'package:chat_application/config/strings.dart';
import 'package:flutter/material.dart';

class WelcomeHead extends StatefulWidget {
  const WelcomeHead({Key? key}) : super(key: key);

  @override
  State<WelcomeHead> createState() => _WelcomeHeadState();
}

class _WelcomeHeadState extends State<WelcomeHead> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            child: Image.asset("assets/Icons/AppIcon.png")),
        SizedBox(height: 10,),
        Text(
          AppNameStrings.appName,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.orangeAccent),
        ),
      ],
    );
  }
}
