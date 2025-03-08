import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notika/providers/notes_provider.dart';
import 'package:notika/launch/routes.dart';
import 'package:notika/theme/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NotesProvider()..loadNotes(),
        ),
      ],
      child: const NotikaApp(),
    ),
  );
}

class NotikaApp extends StatelessWidget {
  const NotikaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notica',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
