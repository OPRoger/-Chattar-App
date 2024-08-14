import 'package:chat_application/config/strings.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:get/get.dart';

class MySlideActionButton extends StatelessWidget {
  const MySlideActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SlideAction(
            onSubmit: (){
              Get.offAllNamed("/authPage");
            },
            text: WelcomePageString.slideToStart,
            innerColor: Theme.of(context).colorScheme.onBackground,
            outerColor: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        )
      ],
    );
  }
}
