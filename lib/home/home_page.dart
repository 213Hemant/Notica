import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notika/providers/notes_provider.dart';
import 'package:notika/notes/note_model.dart';
import 'package:notika/notes/note_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false;
  String _searchQuery = '';

  Future<void> _navigateToNoteEditor(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/noteEditor');
    if (result == true) {
      Provider.of<NotesProvider>(context, listen: false).loadNotes();
    }
  }

  void _openNoteDetails(BuildContext context, Note note) {
    Navigator.pushNamed(context, '/noteDetails', arguments: {
      'noteId': note.id,
      'noteTitle': note.title,
      'noteContent': note.content,
    }).then((result) {
      if (result == true) {
        Provider.of<NotesProvider>(context, listen: false).loadNotes();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine proper text style based on current brightness.
    final isLight = Theme.of(context).brightness == Brightness.light;
    final searchTextStyle = isLight
        ? Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black87)
        : Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white);

    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search notes...',
                  border: InputBorder.none,
                ),
                style: searchTextStyle,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              )
            : Text(
                'Welcome to Notica !',
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                if (_isSearching) {
                  _searchQuery = '';
                }
                _isSearching = !_isSearching;
              });
            },
          ),
        ],
      ),
      body: Consumer<NotesProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Filter notes by title and content based on the search query.
          List<Note> filteredNotes = provider.notes.where((note) {
            final query = _searchQuery.toLowerCase();
            return note.title.toLowerCase().contains(query) ||
                note.content.toLowerCase().contains(query);
          }).toList();

          return NoteList(
            notes: filteredNotes,
            onNoteTap: (note) => _openNoteDetails(context, note),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToNoteEditor(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
