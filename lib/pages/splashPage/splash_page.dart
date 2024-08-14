
import 'package:chat_application/controller/splash_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Image.asset("assets/Icons/AppIcon.png"),
      ),
    );
  }
}
