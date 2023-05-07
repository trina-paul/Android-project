import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  startTimer() {
    // var duration = Duration(seconds: 3);
    // return Timer(duration, route);
    Future.delayed(const Duration(seconds: 8), () {
      //Using getx
      Get.to(()=> const LogIn());
    });
  }

  // route() {
  //   Navigator.of(context).pushReplacementNamed('/login');
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          color: Color.fromARGB(255, 26, 113, 135),
          child: Container(
            child: Image.asset('assets/images/sp.png'),
          )),
    );
  }
}