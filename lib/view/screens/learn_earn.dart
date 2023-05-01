import 'package:flutter/material.dart';
import 'package:smart_ed/utils/approutes.dart';
import 'package:smart_ed/widget/appcolor.dart';

class LearnToEarn extends StatefulWidget {
  const LearnToEarn({super.key});

  @override
  State<LearnToEarn> createState() => _LearnToEarnState();
}

class _LearnToEarnState extends State<LearnToEarn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Keep Learning to Earn',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text('Points gained'), Text('20%')],
            ),
            const SizedBox(
              height: 5,
            ),
            LinearProgressIndicator(
              value: 0.2,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
              backgroundColor: AppColor.lightblue,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, courseRoute);
                          },
                          child: const ListTile(
                            title: Text('CPE 403'),
                            subtitle: Text('Introduction to Computer'),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                        const Divider()
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
    // return Center(
    //   child: Padding(
    //     padding: const EdgeInsets.all(18.0),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Image.asset('assets/images/empty.png'),
    //         Text('Add new notes to learn and earn'),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         TextButton(
    //           child: Text(
    //             'Add New Note +',
    //             style: TextStyle(color: AppColor.primary),
    //           ),
    //           onPressed: () {
    //             Navigator.pushNamed(context, newcourseRoute);
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
