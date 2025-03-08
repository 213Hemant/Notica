// lib/notes/note_details.dart
import 'package:flutter/material.dart';
import 'package:notika/database/notes_database.dart';
import 'note_editor.dart';

class NoteDetails extends StatelessWidget {
  final String noteId;
  final String noteTitle;
  final String noteContent;

  const NoteDetails({
    Key? key,
    required this.noteId,
    required this.noteTitle,
    required this.noteContent,
  }) : super(key: key);

  void _deleteNote(BuildContext context) async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Note'),
        content: const Text('Are you sure you want to delete this note?'),
        actions: [
          TextButton(
  onPressed: () => Navigator.pop(context, false),
  child: const Text(
    'Cancel',
    style: TextStyle(
      color: Colors.green,
      fontWeight: FontWeight.bold,
    ),
  ),
),
TextButton(
  onPressed: () => Navigator.pop(context, true),
  child: const Text(
    'Delete',
    style: TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
    ),
  ),
),

        ],
      ),
    );

    if (confirm == true) {
      await NotesDatabase.instance.deleteNote(noteId);
      Navigator.pop(context, true); // Signal deletion so HomePage can reload notes.
    }
  }

  void _editNote(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/noteEditor', arguments: {
      'noteId': noteId,
      'initialTitle': noteTitle,
      'initialContent': noteContent,
    });
    if (result == true) {
      Navigator.pop(context, true); // Signal that the note was edited.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(noteTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _editNote(context),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _deleteNote(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            noteContent,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
