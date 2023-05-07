import 'package:flutter/material.dart';
import 'package:notes_app_design/notes_view.dart';
//import 'notes_view_body.dart';
//import 'widgets/notes_view_body.dart';

class NotesPage extends StatefulWidget {
  NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
   // notesDescriptionMaxLength=noteDescriptionMaxLines*noteDescriptionMaxLines;
    notesDescriptionMaxLenth =
        notesDescriptionMaxLines * notesDescriptionMaxLines;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  }
@override
  void dispose(){
    super.dispose();
    noteDescriptionController.dispose();
    noteHeadingController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: notesHeader(),
      ),
      body: notesHeading.length>0
          ?buildNotes()
          :Center(
        child: Text("AddNotes..."),
      ),
        floatingActionButton:FloatingActionButton(
      backgroundColor: Colors.blueAccent,onPressed: (){
      settingModalBottonSheet(context);
    },
      child:Icon(Icons.create) ,
    ),

    );
  }

  Widget buildNotes() {
    return Padding(
      Padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: ListView.builder(
        itemCount: noteHeading.length,
        itemBuilder: (context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 5.5),
            child: Dismissible(
              key: new UniqueKey(),

              direction: DismissDirection.horizontal,
              onDismissed: (direction){
                serState((){
                  deletedNoteHeading=noteHeading[index];
                  deletedNoteDescription=noteDescription[index];
                  noteHeading.removeAt(index);
                  Scaffold.of(context).showSnackBar(
                      new SnackBar(
                          backgroundColor: Colors.purple,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Note Deleted"),
                              deletedNoteHeading!=""?GestureDetector(onTap:(){
                                setState(() {
                                  if(deletedNoteHeading!=""){
                                    noteHeading.add(deletedNoteHeading);
                                    noteDescription
                                       .add(deletedNoteDescription);
                                  }
                                  deletedNoteHeading = "";
                                  deletedNoteDescription = "";
                                });

                              },
                                child: Text("undo"),
                              )
                             :SizedBox(),

                            ],

                          ),
                      ),
                  );
                });
              },
             background:ClipRRect (
              borderRadius: BorderRadius.circular(5.5),
              Child:Container(
               color: Colors.green,
               child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                   Padding:EdgeInsets.only(left: 10),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Icon(
                         Icons.delete,
                         color: Colors.white,
                       ),
                       Text(
                         "Delete",
                         style: TextStyle(color: Colors.white),
                       ),
                     ],
                   ),
                  ),

          ),
               ),

              ),
              secondaryBackground:ClipRRect (
                borderRadius: BorderRadius.circular(5.5),
                Child:Container(
                  color: Colors.red,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      Padding:EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          Text(
                            "Delete",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                  ),
                ),

              ),
              child: noteList(index),
            ),
          ),
        },
      ),

    );
  }
}

 Widget noteList(int index){
  return ClipRRect(
    borderRadius: BorderRadius.circular(5.5),
    child: Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: noteColor[(index % noteColor.length).floor()],
      borderRadius: BorderRadius.circular(5.5),
      ),
      child: Center
        (child: Row(
        children: [
        Container(
          color:
          noteMarginColor[(index % noteMarginColor.length).floor()],
          width: 3.5,
          height: double.infinity,
        ),
          Flexible(
            child: Padding(
              Padding:EdgeInsets.only(top: 10,left: 10,right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      noteHeading[index],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20.00,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.5,
                  ),
                  Flexible(
                    child: Container(
                      height: double.infinity,
                      child:AutoSizeText(
                        "${(noteDescription[index])}",
                        maxLines:2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.00,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      ],),),
    ),
  )
 }
void _settingModalBottonSheet(context) {
  showModalBottomSheet(context: context,
      isScrollControlled: true,
      elevation: 50,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      clipBehavior: clip.antiAliasWithsaveLayer,
      builder:(BuildContext bc) {
         return Padding(
           padding: EdgeInsets.only(
             left: 25,
             right: 25,
           ),
           child: Form(
             key: _formKey,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: (MediaQuery.of(context).size.height),
                  ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 250,top: 50),
                  child: new column(
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New Note",
                            style: TextStyle(
                              fontSize: 20.00,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap:() {
                              if (_formKey.CurrentState.validate()){
                                setState(() {
                                  noteHeading.add(noteHeadingController.text);
                                  noteDescription
                                      .add(noteDescriptionController.text);
                                  noteHeadingController.clear();
                                  noteDescriptionController.clear();
                                });
                                Navigator.pop(context);
                              }
                            },
                            child: Container(child:Row(
                              children: [
                                Text(
                                  "save",
                                  style: TextStyle(
                                    fontSize: 20.00,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                              Divider(
                                color: Colors.blueAccent,
                                thickness: 2.5,
                              ),
                              TextFormField(
                                maxLength: notesHeaderMaxLenth,
                                controller: noteHeadingController,
                                decoration: InputDecoration(
                                  hintText: "Notes Header",
                                  hintStyle: TextStyle(
                                    fontSize:15.00,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500
                                  ),
                                  prefixIcon: Icon(Icons.text_fields),
                                ),
                                validator: (String noteHeading) {
                                  if (noteHeading.isEmpty) {
                                    return "Enter Note Heading";
                                  } else if (noteHeading.startsWith("")){
                                    return "please avoid whitespaces";
                                  }
                                },
                                onFieldSubmitted: (String value){
                                  FocusScope.of(context)
                                      .requestFocus(textSecondFocusNode);
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Container(
                                  margin: EdgeInsets.all(1),
                                  height: 5*24.0,
                                  child: TextFormField(
                                    focusNode: textSeconcFocusNode,
                                    maxLines: notesDescriptionMaxLines,
                                    maxLength: notesDescriptionMaxLength,
                                    controller: ,noteDescriptionController,
                                    decoration: InputDecoration(border: OutlineInputBorderutl()
                                    hintText: "Description",
                                    hintStyle: TextStyle(fontSize: 15.00,
                                    color: Colors.grey,
                                    ),
                                    ),
                                    validator: (String noteDescription){
                                      if(noteDescription.isEmpty){
                                        return "Enter Note Desc";
                                      }
                                      else if(noteDescription.startsWith("")){
                                        return "Avoid whitespaces";
                                      }
                                    },
                                  ),
                                ),

                              ),

                            )
                          ),
                    ],
                  ),
                ),

                  )constraints),
            ),
           ),
         )
      }
      builder: null);

}

Widget notesHeader() {
  return Padding(
    Padding: EdgeInsets.only(top: 10,left: 2.5,right: 2.5),
    child: column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Text("My Notes",
        style: TextStyle(
            color: Colors.blueAccent,
            fontSize:25.00,
            fontWeight: FontWeight.w500 ),
        ),
        Divider(color: Colors.blueAccent,
        thickness: 2.5,),
      ],
    ),
  );
}



