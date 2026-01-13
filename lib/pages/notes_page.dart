import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  //text controller to capture what user type
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // reading notes at the beginning of the page, like useeffect
    readNotes();
  }

  //create a note
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("New note"),
        content: TextField(controller: textController),
        actions: [
          //create button
          MaterialButton(
            onPressed: () {
              // add to the database
              context.read<NoteDatabase>().addNote(textController.text);
              // clear the text controller
              textController.clear();
              // close the dialog box
              Navigator.pop(context);
            },
            child: Text('Create'),
          ),
        ],
      ),
    );
  }

  // read a note
  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  // update a note
  void updateNote(Note note) {
    // pre-fill the controller with current note text
    textController.text = note.text;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Update note ${note.id}"),
        content: TextField(controller: textController),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<NoteDatabase>().updateNote(
                note.id,
                textController.text,
              );
              textController.clear();
              Navigator.pop(context);
            },
            child: Text("Update"),
          ),
        ],
      ),
    );
  }

  // delete a note
  void deleteNote(Note note) {
    context.read<NoteDatabase>().deleteNote(note.id);
  }

  @override
  Widget build(BuildContext context) {
    // note database instance
    final noteDatabase = context.watch<NoteDatabase>();

    // current notes
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: ListView.builder(
        itemCount: currentNotes.length,
        itemBuilder: (context, index) {
          final note = currentNotes[index];
          return ListTile(
            title: Text(note.text, style: const TextStyle(color: Colors.black)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min, // important
              children: [
                IconButton(
                  onPressed: () => updateNote(note),
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  style: ButtonStyle(
                    iconColor: WidgetStatePropertyAll(Colors.red),
                  ),
                  onPressed: () => deleteNote(note),
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: Icon(Icons.add),
      ),
    );
  }
}
