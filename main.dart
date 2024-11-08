import 'package:flutter/material.dart';
import 'package:flutter_task_1/validationscreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ValidationScreen(),
    );
  }
}