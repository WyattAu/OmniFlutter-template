import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/themes/theme_main.dart' as theme;
import 'package:flutter/foundation.dart';

void main() {
  // Enable detailed logging in debug mode
  if (kDebugMode) {
    debugPrint('Starting application in debug mode...');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omni Todo',
      theme: theme.AppTheme.lightTheme,
      darkTheme: theme.AppTheme.darkTheme,
      home: const TodoApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
