import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:notika/launch/routes.dart';
import 'package:notika/theme/animations.dart';

class BiometricAuthScreen extends StatefulWidget {
  const BiometricAuthScreen({Key? key}) : super(key: key);

  @override
  _BiometricAuthScreenState createState() => _BiometricAuthScreenState();
}

class _BiometricAuthScreenState extends State<BiometricAuthScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticating = false;
  String _authStatus = "Not Authenticated";

  Future<void> _authenticate() async {
    setState(() {
      _isAuthenticating = true;
      _authStatus = "Authenticating...";
    });
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Use your fingerprint to continue',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );
      setState(() {
        _authStatus = authenticated ? "Authenticated" : "Authentication failed";
      });
    } catch (e) {
      setState(() {
        _authStatus = "Error: $e";
      });
    }
    setState(() {
      _isAuthenticating = false;
    });
    if (authenticated) {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use the current theme's background and text/icon styles.
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: FadeInAnimation(
            duration: const Duration(milliseconds: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.fingerprint,
                  size: 80,
                  color: Theme.of(context).iconTheme.color,
                ),
                const SizedBox(height: 20),
                Text(
                  _authStatus,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isAuthenticating ? null : _authenticate,
                  child: Text(
                    'Authenticate',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
