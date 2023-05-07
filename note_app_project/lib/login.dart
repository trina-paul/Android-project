import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import 'create.dart';
import 'method.dart';
import 'nev.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: isLoading
          ? Center(
        child: Container(
          height: size.height / 20,
          width: size.height / 20,
          child: CircularProgressIndicator(),
        ),
      )
          : SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 20,
            ),
            Container(
                alignment: Alignment.centerLeft,
                // width: size.width / 0.5,
                margin: EdgeInsets.only(top: 50),
                height: 180,
                width: 180,
                child: const Image(
                  image: AssetImage('assets/images/log.png'),
                )
              // width: size.width / 0.5,
              // child: IconButton(
              //     icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            Container(
              width: size.width / 1.7,
              child: Text(
                "Welcom Back",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: size.height / 60,
            ),
            Container(
              width: size.width / 1.9,
              child: Text(
                "Login to Contiue!",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            Container(
              width: size.width,
              alignment: Alignment.center,
              child: field(size, "email", Icons.account_box, _email),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Container(
                width: size.width,
                alignment: Alignment.center,
                child: field(size, "password", Icons.lock, _password),
              ),
            ),
            SizedBox(
              height: size.height / 40,
            ),
            customButton(size),
            SizedBox(
              height: size.height / 40,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => CreateAccount())),
              child: Text(
                "Create Account",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () {
        if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
          setState(() {
            isLoading = true;
          });

          logIn(_email.text, _password.text).then((user) {
            if (user != null) {
              print("Login Sucessfull");
              setState(() {
                isLoading = false;
              });
              Navigator.push(context, MaterialPageRoute(builder: (_) => nev()));
            } else {
              print("Login Failed");
              setState(() {
                isLoading = false;
              });
            }
          });
        } else {
          print("Please fill form correctly");
        }

        Navigator.push(context, MaterialPageRoute(builder: (_) => nev()));
      },
      child: Container(
          height: size.height / 14,
          width: size.width / 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue,
          ),
          alignment: Alignment.center,
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Widget field(
      Size size, String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.1,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}


// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//         color: Colors.white,
//         child: Column(
//           children: [
//             Image.asset(
//               "assets/images/log.png",
//               fit: BoxFit.cover,
//             ),

//             SizedBox(
//               height: 20.0,
//               //child: Text("fabiha"),
//             ),

//             Text(
//               "Welcome",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             // Image(image: AssetImage('images/login_image.png'),),
//             SizedBox(
//               height: 20.0,
//             ),

//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 32.0,
//                 vertical: 16.0,
//               ),
//               child: Column(
//                 children: [
//                   TextFormField(
//                     decoration: InputDecoration(
//                       hintText: "Enter Username:",
//                       labelText: "Username",
//                     ),
//                   ),
//                   TextFormField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       hintText: "Enter Password:",
//                       labelText: "Password",
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   ElevatedButton(
//                     child: Text("Login"),
//                     style: TextButton.styleFrom(),
//                     onPressed: () {
//                       print("Hi codepur");
//                     },
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
// }