import 'package:flutter/material.dart';
import 'package:smart_ed/utils/approutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart ED',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes().routes,
    );
  }
}
