// lib/notes/note_list.dart
import 'package:flutter/material.dart';
import 'note_model.dart';
import 'note_card.dart';

class NoteList extends StatelessWidget {
  final List<Note> notes;
  final Function(Note) onNoteTap;

  const NoteList({
    Key? key,
    required this.notes,
    required this.onNoteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      return Center(
        child: Text(
          'No Notes Yet',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: notes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,    // 2 columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final note = notes[index];
          return NoteCard(
            note: note,
            onTap: () => onNoteTap(note),
          );
        },
      ),
    );
  }
}
