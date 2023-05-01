import 'package:flutter/material.dart';
import 'package:smart_ed/utils/approutes.dart';
import 'package:smart_ed/widget/app_button.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            // SizedBox(
            //   height: 100,
            // ),
            Center(
              child: Image.asset(
                'assets/images/bookcover.png',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'CPE 304 - Reasearch Methodology',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonS(text: 'Read', onPressed: () {}),
                ButtonS(
                    text: 'Quiz',
                    onPressed: () {
                       Navigator.pushNamed(context,   quizRoute);
                    }),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonS(text: 'Update', onPressed: () {}),
                ButtonS(text: 'Delete', onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
