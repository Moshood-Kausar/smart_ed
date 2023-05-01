import 'package:flutter/material.dart';
import 'package:smart_ed/widget/appcolor.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String? question;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Let\'s practice together',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const Text(
                '1. What percentage of the global population between the ages of 15 and 65 used cannabis in 2013?'),
            RadioListTile(
              activeColor: AppColor.primary,
              title: const Text('A. 2.7%'),
              value: 'A. 2.7%',
              groupValue: question,
              onChanged: (value) {
                setState(() {
                  question = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: AppColor.primary,
              title: const Text('B. 4.9%'),
              value: 'B. 4.9%',
              groupValue: question,
              onChanged: (value) {
                setState(() {
                  question = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: AppColor.primary,
              title: const Text('C. 7.2%'),
              value: 'C. 7.2%',
              groupValue: question,
              onChanged: (value) {
                setState(() {
                  question = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: AppColor.primary,
              title: const Text('D. 9.4%'),
              value: 'D. 9.4%',
              groupValue: question,
              onChanged: (value) {
                setState(() {
                  question = value.toString();
                });
              },
            ),
            RadioListTile(
              activeColor: AppColor.primary,
              title: const Text('E. 11.7%'),
              value: 'E. 11.7%%',
              groupValue: question,
              onChanged: (value) {
                setState(() {
                  question = value.toString();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
