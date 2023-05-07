import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class AddNotes extends StatelessWidget{

  TextEditingController title = TextEditingController();
  //TextEditingController title = TextEditingController();

  CollectionReference ref = Firestore.instance.collection('notes');


  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(onPressed: (){}, child: Text('save'),)
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          Children:[
            Container(
         decoration: BoxDecoration(border:Border.all()),
        child: TextField(
          controller: title,
          decoration: InputDecoration(hintText: 'Title'),
        ),
      ),
        SizeBox(height: 10, ),
        Expanded(
        child: Container(
         decoration: BoxDecoration(border: Border.all()),
         Child:TextField(
          controller: Content,
          maxLines: null,
          expands: true,
          decoration: InputDecoration(hintText: 'Content'),

    )
    ),
      )
    )
  }
}
