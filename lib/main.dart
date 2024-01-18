import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onyx/screens/loading_screen.dart';
import 'package:onyx/screens/login_page.dart';
import 'screens/index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final navigatorKey = GlobalKey<NavigatorState>();

  MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => IndexPage(),
      },
      home: FutureBuilder(
        future: Future.wait([
          Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ),
        ]),
        builder: (context, snapshot) {
          // if (snapshot.hasError) return const ErrorScreen();

          if (snapshot.connectionState == ConnectionState.done) {

            FirebaseAuth.instance.authStateChanges().listen((user) {
              if (user == null) {

                navigatorKey.currentState!.pushReplacementNamed('/login');
              } else {

                navigatorKey.currentState!.pushReplacementNamed('/home');
              }
            });
          }

          return const LoadingScreen();
        },
      ),
    );
  }
}
