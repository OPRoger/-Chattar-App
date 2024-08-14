import 'package:chat_application/Model/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  RxBool isLoading = true.obs;

  //For Login

  Future<void> isLogin(String email, String password) async {
    isLoading.value = true;
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print("LoggedIn Successfully");
      Get.offAllNamed("/homePage");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  // For Sign Up

  Future<void> isSignUp(String email, String password, String name) async {
    isLoading.value = true;
    try {
      final credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("Account Created");
      initUser(email, name);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Future<void> logoutUser() async {
    await auth.signOut();
    Get.toNamed("/authPage");
  }

  Future<void> initUser(String email, String name) async {
    var newUser = UserModel(
        email: email,
        name: name,
        id: auth.currentUser!.uid
    );
    try {
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .set(newUser.toJson());
    } catch (ex) {
      print(ex);
    }
  }
}
