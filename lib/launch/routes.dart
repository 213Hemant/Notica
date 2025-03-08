// lib/launch/routes.dart
import 'package:flutter/material.dart';
import 'package:notika/home/home_page.dart';
import 'package:notika/launch/splash_screen.dart';
import 'package:notika/notes/note_editor.dart';
import 'package:notika/notes/note_details.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String noteEditor = '/noteEditor';
  static const String noteDetails = '/noteDetails';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case noteEditor:
        final args = settings.arguments as Map<String, dynamic>? ?? {};
        return MaterialPageRoute(
          builder: (_) => NoteEditor(
            noteId: args['noteId'],
            initialTitle: args['initialTitle'],
            initialContent: args['initialContent'],
          ),
        );
      case noteDetails:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => NoteDetails(
            noteId: args['noteId'],
            noteTitle: args['noteTitle'],
            noteContent: args['noteContent'],
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
