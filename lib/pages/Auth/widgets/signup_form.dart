import 'package:chat_application/controller/Auth_Controller.dart';
import 'package:chat_application/widget/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: authController.nameController,
              decoration: const InputDecoration(
                hintText: "Name",
                labelText: "Name",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: authController.emailController,
              decoration: const InputDecoration(
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
              decoration: const InputDecoration(
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
              children: [
                PrimaryButton(
                  BtName: "Sign UP",
                  icon: Icons.lock_open,
                  ontap: () {
                    authController.isSignUp(authController.emailController.text,
                        authController.passwordController.text,  authController.nameController.text);
                    // Get.offAllNamed("/homePage") ;
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
