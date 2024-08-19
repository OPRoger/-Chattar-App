import 'dart:io';

import 'package:chat_application/Model/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController about = TextEditingController();
  final store = FirebaseStorage.instance;
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  Rx<UserModel> currentUser = UserModel().obs;

  void onInit() async {
    super.onInit();
    await getUserDetails();
  }

  Future<void> getUserDetails() async {
    await db.collection("users").doc(auth.currentUser!.uid).get().then(
        (value) => {currentUser.value = UserModel.fromJson(value.data()!)});
  }

  Future<void> updateProfile(
      String imageUrl,
      // String about,
      // String name,
      // String number,
      )async{
    isLoading.value=true;
    try{
      final imageLink = await uploadFiletoFirebase(imageUrl);
      final updatedUser = UserModel(
        id: auth.currentUser!.uid,
          email: auth.currentUser!.email,
          name: name.text,
          about: about.text,
          profileImage: imageUrl == "" ? currentUser.value.profileImage : imageLink,
          phoneNumber: phone.text
      );
      await db.collection("users").doc(auth.currentUser!.uid).set(updatedUser.toJson());
      await getUserDetails();
    }
    catch(ex){
      print(ex);
    }
    isLoading.value = false;
  }

  Future<String> uploadFiletoFirebase(String imagePath) async{
    final path = "file/${imagePath}";
    final file = File(imagePath);
    if(imagePath != ''){
      try{
        final  ref = store.ref().child(path).putFile(file);
        final uploadTask = await ref.whenComplete(() {});
        final downloadImageUrl = uploadTask.ref.getDownloadURL();
        print(downloadImageUrl);
        return downloadImageUrl;
      }
      catch(e){
        print(e);
        return "";
      }
    }
    return "";
  }
}
