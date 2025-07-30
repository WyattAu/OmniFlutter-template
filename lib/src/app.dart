import 'package:flutter/material.dart';
import 'themes/app_theme.dart';
import 'features/todo/presentation/pages/todo_page.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omni Todo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const TodoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
