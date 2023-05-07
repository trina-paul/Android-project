import 'package:flutter/material.dart';

import 'note.dart';
import 'nt.dart';


// import 'package:flutter_application_1/note.dart';


class Options extends StatefulWidget {
  const Options({super.key});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 155, 213, 239),
        body: Center(
          child: Column(children: [
            const SizedBox(
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NoteList()));
              },
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(46.0),
                fixedSize: const Size(250, 200),
                onPrimary: const Color.fromARGB(255, 6, 98, 173),
                textStyle:
                const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                 primary: const Color.fromARGB(255, 255, 255, 255),
                elevation: 15,
              ),
              child: const Text('Notes'),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => todo()));
              },
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20.0),
                fixedSize: const Size(250, 200),
                onPrimary: const Color.fromARGB(255, 6, 98, 173),
                textStyle:
                const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                primary: const Color.fromARGB(255, 255, 255, 255),
                elevation: 15,
              ),
              child: const Text('TO-DO Lists'),
            ),
          ]),
        ));
  }
}