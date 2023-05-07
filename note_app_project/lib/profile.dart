import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'login.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 155, 213, 239),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LogIn()));
              },
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(46.0),
                fixedSize: const Size(250, 200),
                primary: const Color.fromARGB(255, 6, 98, 173),
                textStyle:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                onPrimary: const Color.fromARGB(255, 255, 255, 255),
                elevation: 15,
              ),
              child: const Text('LogOut'),
            ),
          ],
        ),
      ),
    );
  }
}
