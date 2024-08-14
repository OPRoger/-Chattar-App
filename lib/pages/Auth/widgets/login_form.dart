import 'package:chat_application/controller/Auth_Controller.dart';
import 'package:chat_application/widget/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
             TextField(
               controller: authController.emailController,
              decoration:const InputDecoration(
                hintText: "Email",
                labelText: "Email",
                prefixIcon: Icon(Icons.alternate_email_rounded),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
             TextField(
               controller: authController.passwordController,
              obscureText: true,
              decoration:const InputDecoration(
                hintText: "Password",
                labelText: "Password",

                prefixIcon: Icon(Icons.password),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                PrimaryButton(
                  BtName: "Login",
                  icon: Icons.lock_open,
                  ontap: () {
                    authController.isLogin(authController.emailController.text, authController.passwordController.text);
                    // Get.offAllNamed("/homePage");
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
