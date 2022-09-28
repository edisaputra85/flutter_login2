import 'package:flutter/material.dart';
import 'package:flutter_login_2/dashboard.dart';
import 'package:flutter_login_2/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}
