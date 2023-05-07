// class nev extends StatefulWidget {
//   const nev({super.key});

//   @override
//   State<nev> createState() => _nevState();
// }

// class _nevState extends State<nev> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//             //mainAxisAlignment: MainAxisAlignment.center,
//             // crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   // alignment: Alignment.center,
//                   foregroundColor: const Color.fromARGB(255, 6, 98, 173),
//                   // padding: const EdgeInsets.all(20.0),
//                   backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//                   fixedSize: const Size(500, 250),
//                   textStyle: const TextStyle(
//                       fontSize: 35, fontWeight: FontWeight.bold),
//                   elevation: 15,
//                 ),
//                 child: const Text('Notes'),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   alignment: Alignment.center,
//                   padding: EdgeInsets.all(20.0),
//                   fixedSize: Size(500, 250),
//                   foregroundColor: const Color.fromARGB(255, 6, 98, 173),
//                   textStyle: const TextStyle(
//                       fontSize: 35, fontWeight: FontWeight.bold),
//                   backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//                   elevation: 15,
//                 ),
//                 child: const Text('TO-DO Lists'),
//               ),
//             ]),
//       ),
//       backgroundColor: const Color.fromARGB(255, 155, 213, 239),
//       bottomNavigationBar: CurvedNavigationBar(
//           backgroundColor: const Color.fromARGB(255, 155, 213, 239),
//           animationDuration: const Duration(milliseconds: 200),
//           onTap: (index) {},
//           items: const [
//             Icon(Icons.home),
//             Icon(Icons.favorite),
//             Icon(Icons.settings),
//           ]),
//     );
//   }
// }

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_application_1/pages/options.dart';
// import 'package:flutter_application_1/pages/profile.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:note_app_project/profile.dart';

import 'options.dart';

class nev extends StatefulWidget {
  const nev({super.key});

  @override
  State<nev> createState() => _nevState();
}

class _nevState extends State<nev> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: const Color.fromARGB(255, 155, 213, 239),
          animationDuration: const Duration(milliseconds: 200),

          // onTap: (){
          //   },

          onTap: (selectIndex) {
            setState(() {
              index = selectIndex;
            });
          },
          items: const [
            Icon(Icons.home),
            Icon(Icons.favorite),
            Icon(Icons.settings),
          ]),
      body: Container(
        child: getSelectedWidget(index: index),
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const Options();
        break;
      case 1:
        widget = const Options();
        break;
      case 2:
        widget = const Profile();
        break;
      default:
        widget = const Options();
        break;
    }
    return widget;
  }
}