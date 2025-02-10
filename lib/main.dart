import 'package:flutter/material.dart';
import 'package:todo/ui/todo_page.dart';
import 'package:todo/ui/widget/todo_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(),
    );
  }
}