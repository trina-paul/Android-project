//
//
//
//
//
//
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Color(0xff2B2D2D),
//         scaffoldBackgroundColor: Color(0xff2B2D2D),
//
//       ),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   String input = "";
//   List todo = [];
//  // List todo = List();
//
//
//   @override
//   void initState() {
//     todo.add("Study");
//     todo.add("add");
//     todo.add("Cycling");
//     todo.add("add");
//     todo.add("add");
//     todo.add("Cycling");
//     todo.add("add");
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 0.0,
//           centerTitle: true,
//           title: const Text('Notes App',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize:25,
//             fontStyle: FontStyle.italic,
//             letterSpacing: 4
//           ), )
//         ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: Colors.white,
//           child: Icon(Icons.add,color: Colors.blue[500],size: 35,),
//           onPressed: (){
//     showDialog(
//         context: context,
//         builder: (BuildContext context)
//         {
//           return AlertDialog(
//             backgroundColor: const Color(0xffF48C8C),
//             title: const Text("Add ToDo's"),
//             content: TextField(
//               decoration: const InputDecoration(
//                   hintText: "ToDo's"
//               ),
//     onChanged: (String value)
//     {
//       input = value;
//       },),
//             actions: [
//               FlatButton(
//                   onPressed: ()
//                   {
//                     setState(() {
//                       todo.add(input);
//                     });
//                     Navigator.of(context).pop();
//                     },
//                   child: const Text("ADD",style: TextStyle(color: Colors.black),)
//               )
//             ],
//           );
//         });
//     },
//         ),
//
//         body: Padding(
//           padding: const EdgeInsets.all(5),
//           child: ListView.builder(
//               itemCount: todo.length,
//               itemBuilder: (BuildContext context,int index){
//                 return Dismissible(
//                   key: Key(todo[index]),
//                   child: Card(
//                     elevation: 4,
//                     margin: const EdgeInsets.all(8),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: ListTile(
//                       title: Text(todo[index],
//                         style: const TextStyle(
//                           color: Colors.black,
//                         ),),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.delete_forever_rounded,color: Colors.blue,),
//                         onPressed: (){
//                           setState(() {
//                             todo.removeAt(index);});
//                           },
//                       ),
//                     ),
//                   ),
//                 );
//               }
//            ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: "Note App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteList(),
    );
  }
}

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NoteListState();
}

class NoteListState extends State<NoteList> {
  final List<String> _notes = [];

  void _addNote(String note) {
    setState(() {
      _notes.add(note);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          return ListTile(
          title: Text(_notes[index]),
      );
      },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                  child: AddNoteForm((note) {
                    _addNote(note);
                    Navigator.pop(context);
                  })
              );

            },
          );
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}
  class AddNoteForm extends StatefulWidget{
   final Function(String) onNoteAdd;

   AddNoteForm(this.onNoteAdd);
   @override
    State<StatefulWidget> createState() => AddNoteFormState();
  }
  class AddNoteFormState extends State<AddNoteForm> {
  final _formkey = GlobalKey<FormState>();
  String _note = '';

  void _submitForm() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      widget.onNoteAdd(_note);
     }
    }

    @override
      Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText:'Note'),
            validator: (value){
              if(value!.isEmpty){
                return'please enter a note';
              }
              return null;
            },
            onSaved: (value) => _note = value!,

      ),
       Container(
        child: ElevatedButton(
         onPressed: _submitForm,
        child: const Text('Add'),
       ),
       ),
     ],
    ),
    );



   }
}












