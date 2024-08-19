import 'package:chat_application/Model/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DbController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  RxList<UserModel> userList = <UserModel>[].obs;


  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getUserDetails();
  }

  Future<void> getUserDetails() async {
    isLoading.value = true;
    try {
      await db.collection("users").get().then((value) => {
            userList.value =
                value.docs.map((e) => UserModel.fromJson(e.data())).toList()
          });
    } catch (ex) {
      print(ex);
    }
    isLoading.value = false;
  }


}
