import 'package:flutter/material.dart';
import 'package:notika/notes/note_model.dart';
import 'package:notika/database/notes_database.dart';

class NotesProvider with ChangeNotifier {
  List<Note> _notes = [];
  bool _isLoading = true;

  List<Note> get notes => _notes;
  bool get isLoading => _isLoading;

  NotesProvider() {
    loadNotes();
  }

  Future<void> loadNotes() async {
    _isLoading = true;
    notifyListeners();

    final noteMaps = await NotesDatabase.instance.getNotes();
    _notes = noteMaps.map((map) => Note.fromMap(map)).toList();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    await NotesDatabase.instance.insertNote(note.toMap());
    await loadNotes();
  }

  Future<void> updateNote(Note note) async {
    await NotesDatabase.instance.updateNote(note.toMap());
    await loadNotes();
  }

  Future<void> deleteNote(String id) async {
    await NotesDatabase.instance.deleteNote(id);
    await loadNotes();
  }
}
