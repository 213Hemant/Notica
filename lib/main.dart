import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notika/providers/notes_provider.dart';
import 'package:notika/launch/routes.dart';
import 'package:notika/theme/app_theme.dart';
import 'package:notika/launch/splash_screen.dart';

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

class NotikaApp extends StatefulWidget {
  const NotikaApp({Key? key}) : super(key: key);

  @override
  _NotikaAppState createState() => _NotikaAppState();
}

class _NotikaAppState extends State<NotikaApp> with WidgetsBindingObserver {
  DateTime? _lastPausedTime;
  final Duration timeoutDuration = const Duration(minutes: 5);
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Record the time when the app goes to the background.
      _lastPausedTime = DateTime.now();
    }
    if (state == AppLifecycleState.resumed) {
      // If the app was in the background longer than the threshold, force reauthentication.
      if (_lastPausedTime != null &&
          DateTime.now().difference(_lastPausedTime!) > timeoutDuration) {
        // Navigate to the splash screen, which triggers the biometric auth flow.
        _navigatorKey.currentState?.pushReplacementNamed(AppRoutes.splash);
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
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
