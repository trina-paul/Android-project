import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

// class Note extends StatefulWidget {
//   const Note({super.key});

//   @override
//   State<Note> createState() => _NoteState();
// }

// class _NoteState extends State<Note> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

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
              return Container(child: AddNoteForm((note) {
                _addNote(note);
                Navigator.pop(context);
              }));
            },
          );
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}

//import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//      title: "Note App",
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: NoteList(),
//     );
//   }
// }
//
// class NoteList extends StatefulWidget {
//   const NoteList({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => NoteListState();
// }
//
// class NoteListState extends State<NoteList> {
//   final List<String> _notes = [];
//
//   void _addNote(String note) {
//     setState(() {
//       _notes.add(note);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         centerTitle: true,
//         title: Text('Notes'),
//       ),
//       body: ListView.builder(
//         itemCount: _notes.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//           title: Text(_notes[index]),
//       );
//       },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showModalBottomSheet(
//             context: context,
//             builder: (context) {
//               return Container(
//                   child: AddNoteForm((note) {
//                     _addNote(note);
//                     Navigator.pop(context);
//                   })
//               );
//
//             },
//           );
//         },
//         tooltip: 'Add Note',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
class AddNoteForm extends StatefulWidget {
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
            decoration: InputDecoration(labelText: 'Note'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter a note';
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