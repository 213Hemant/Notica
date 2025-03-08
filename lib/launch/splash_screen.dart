import 'package:flutter/material.dart';
import 'package:notika/launch/biometric_auth_screen.dart';
import 'package:notika/launch/routes.dart';
import 'package:notika/theme/app_theme.dart';
import 'package:notika/theme/animations.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // After 2 seconds, navigate to the biometric auth screen.
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const BiometricAuthScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.note_alt,
              size: 80,
              color: Theme.of(context).iconTheme.color,
            ),
            const SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ),

            const SizedBox(height: 20),
            // Use the theme's text styles for the title and tagline.
            Text('Notica', style: Theme.of(context).textTheme.displayLarge),
            Text(
              'Think. Write. Organize.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
