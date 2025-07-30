import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/shared/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure dependencies
  configureDependencies();

  // Wait for all async dependencies to be ready
  await getIt.allReady();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const TodoApp();
  }
}
