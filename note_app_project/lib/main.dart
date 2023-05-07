import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'create.dart';
import 'splash.dart';


void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return GetMaterialApp(debugShowCheckedModeBanner: false,
      // routes: {
      //   "/": (context) => Splash(),
      //   //'/welcome': (context) => const Welcome(),
      //   '/login': (context) => LinearProgressIndicator(),
      //   'register': (context) => CreateAccount(),
      // },
      home: const Splash(),
      //initialRoute: '/splash',
      // routes: {
      //   "/": (context) => Splash(),
      //    "/splash":(context) => LoginPage(),
      //    //"/splash":(context) => LogIn(),
      //  // "/login":(context) => CreateAccount(),
      // },
    );
  }
}