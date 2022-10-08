import 'package:flutter/material.dart';
import 'package:flutterapi/pages/addForm.dart';
import 'package:flutterapi/pages/editForm.dart';
import 'package:flutterapi/pages/home.dart';
import 'package:flutterapi/pages/login.dart';
import 'package:flutterapi/pages/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScrenn(),
        '/addForm': (context) => AddForm(),
        '/editForm': (context) => EditForm(),
        '/login': (context) => LoginScreen()
      },
      home: LoginScreen(),
    );
  }
}
