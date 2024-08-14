
import 'package:chat_application/config/strings.dart';
import 'package:flutter/material.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/Images/boy.png",width: 120,height: 110,),
              Image.asset("assets/Icons/connect.png"),
              Image.asset("assets/Images/girl.png",width: 120,height: 110,),
            ],
          ),
        ),
        SizedBox(height: 30,),
        Text(
          WelcomePageString.nowYouAreConnected,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),

        Text(
            WelcomePageString.connected,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.orangeAccent)
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          WelcomePageString.discription,
          style: TextStyle(fontSize: 18),
        ),
        const Text(
          WelcomePageString.secDiscription,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
