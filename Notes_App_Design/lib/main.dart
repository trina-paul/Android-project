import 'package:flutter/material.dart';
//import 'Notes.dart';

void main()  {

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget{
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold(),

    //
    // return BlocProvider(
    //     create: (context) => NotesCubit(),
    // child: MaterialApp(
    // debugShowCheckedModeBanner: false,
    // theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
    // home: const NotesView(),
    );
  }
  }
