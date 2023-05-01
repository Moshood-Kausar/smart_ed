import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_ed/core/services/apis/course_api.dart';
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
            const SizedBox(height: 5),
            LinearProgressIndicator(
              value: 0.2,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
              backgroundColor: AppColor.lightblue,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Consumer<CourseService>(
                builder: (context, snap, child) {
                  if (snap.isLoading && snap.list.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snap.list.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/empty.png'),
                            const Text('Add new notes to learn and earn'),
                            const SizedBox(height: 20),
                            TextButton(
                              child: Text(
                                'Add New Note +',
                                style: TextStyle(color: AppColor.primary),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, newcourseRoute);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: snap.list.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, courseRoute, arguments: snap.list[index]);
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Text(
                                    snap.list[index]['course_code'][0],
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(snap.list[index]['course_code']),
                              subtitle: Text(snap.list[index]['name']),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                          const Divider()
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CourseService>().courselist(context);
    });
  }
}
