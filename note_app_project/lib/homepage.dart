import 'package:flutter/material.dart';

import 'nev.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GestureDetector(
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (_) => nev())),
          child: const Text(
            "Login",
            style: TextStyle(
              color: Color.fromARGB(255, 5, 28, 47),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}