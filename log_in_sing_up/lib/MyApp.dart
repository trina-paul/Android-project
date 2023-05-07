import 'package:flutter/material.dart';
//import 'package:MyApp/ui/home/home_page.dart';
import 'package:log_in_sing_up/Homepage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      //home : HomePage(title: 'Flutter Demo Home Page'),
home: Scaffold(
  appBar: AppBar(
    title: const Text('Flutter Demo Home Page'),
  ),
),
    );
  }
}

























































































