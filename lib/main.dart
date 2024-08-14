import 'package:chat_application/config/Routes.dart';
import 'package:chat_application/config/theme.dart';
import 'package:chat_application/firebase_options.dart';
import 'package:chat_application/pages/Auth/auth_page.dart';
import 'package:chat_application/pages/splashPage/splash_page.dart';
import 'package:chat_application/pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatter',
      theme: lightTheme,
      getPages: Routes,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: SplashPage(),

    );
  }
}
