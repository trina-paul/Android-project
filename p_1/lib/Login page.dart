import 'package:flutter/material.dart';
//import 'package:p_1/Loginpage.dart';
import 'package:p_1/main.dart';

class Loginpage extends StatelessWidget {
  const Loginpage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
        title: Text(
        'Login page',
        style: TextStyle(
            fontSize: 30,
          color: Colors.black,
          fontWeight: FontWeight.w500 ,
        )
        ),
      ),
    body: Column(
        children: [
      Padding(
      padding: const EdgeInsets.only(top: 20,left: 20),
      child:Text(
              'Login page',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
              )
          ),
    ),
      SizedBox(
       height:30,),

      TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
        Icons. email,
        ),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    ),
    label: Text(
    'Email',
    style: TextStyle(color: Colors.green),

    ),
     hintText: 'Email',
       hintStyle: TextStyle(color: Colors.black),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
       )),
    
      ),

    ),
    );

  }
}

