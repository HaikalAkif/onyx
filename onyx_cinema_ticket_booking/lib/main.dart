import 'package:flutter/material.dart';
import 'screens/index.dart';
import 'screens/registration_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/registration',
      routes: {
        '/home': (context) => IndexPage(),
        '/registration': (context) => RegistrationPage(),
      },
      home: IndexPage(),
    );
  }
}
