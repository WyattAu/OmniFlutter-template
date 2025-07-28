import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/themes/theme_main.dart' as theme;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omni Todo',
      theme: theme.appTheme,
      home: TodoApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
