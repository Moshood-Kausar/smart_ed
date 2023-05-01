import 'package:flutter/material.dart';

class ReadPage extends StatelessWidget {
  final dynamic content;
  const ReadPage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '$content',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
