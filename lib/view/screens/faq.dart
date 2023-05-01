import 'package:flutter/material.dart';
import 'package:smart_ed/widget/expansiontile.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Frequently Asked Questions',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: ListView(
        children: const [
          AppExpansionTile(
              title: 'What is Smart ED?',
              subtitle:
                  'An education platform that allows university students to upload their learning materials and ask questions based on the uploaded materials.'),
          AppExpansionTile(
              title: 'How does the app extract text from images?',
              subtitle:
                  'It uses an Optical character Recognition to extract the text from images'),
          AppExpansionTile(
              title: 'Who is the target audience for the app?',
              subtitle:
                  'University students who are looking for an efficient and engaging way to study and prepare for exams.'),
          AppExpansionTile(
              title: 'What challenges do university students face?',
              subtitle:
                  'Managing the vast amount of learning materials they need to study, financial difficulties, and studying alone can be tedious and unmotivating.'),
          AppExpansionTile(
              title: 'How does the app address these challenges?',
              subtitle:
                  'By providing a platform for students to upload their learning materials, extract text from images, ask and answer questions, and earn rewards for engagement with the app.'),
          AppExpansionTile(
              title: 'What features does the app have?',
              subtitle:
                  'Progress tracking, personalized study plans, a point system, and a leaderboard for tracking progress relative to peers.'),
        ],
      ),
    );
  }
}
