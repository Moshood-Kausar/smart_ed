import 'package:flutter/material.dart';

class ReadPage extends StatelessWidget {
  final dynamic content;
  const ReadPage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '$content',
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
