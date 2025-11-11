import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_project/todo_homepage.dart';
import 'package:todo_app_project/todo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        home:  todoAPPProject(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
     