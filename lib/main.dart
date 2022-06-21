import 'package:flutter/material.dart';
import 'package:notes_app_unpersisted/screens/greetings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //Material App Widget, creates a root widget to support Material Design Widgets
    return MaterialApp(
      //Theme data, to configure theme
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home, holds a Widget/Page (the first page you want to see on a screen)
      home: const GreetingsPage(),
    );
  }
}
