import 'package:flutter/material.dart';

class TextField extends StatelessWidget {
  const TextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(

        ),
      ),
      body: Center(
        child: Padding(
        padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration:InputDecoration(label: Text('Name')),
          ),
        ),
      ),
    );
  }
}
