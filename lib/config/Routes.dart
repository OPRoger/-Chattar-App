import 'package:chat_application/pages/Auth/auth_page.dart';
import 'package:chat_application/pages/Auth/widgets/update_profile.dart';
import 'package:chat_application/pages/Home_Page/Home_Page.dart';
import 'package:chat_application/pages/chat/chat_Page.dart';
import 'package:chat_application/profile/profile_Page.dart';
import 'package:get/route_manager.dart';

var Routes = [
  GetPage(
      name: "/authPage",
      page: () => AuthPage(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/homePage",
      page: () => HomePage(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/chatPage",
      page: () => ChatPage(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/profilePage",
      page: () => ProfilePage(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/updateProfilePage",
      page: () => UpdateProfile(),
      transition: Transition.rightToLeft),
];
