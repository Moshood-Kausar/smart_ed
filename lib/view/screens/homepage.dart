// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smart_ed/core/services/apis/course_api.dart';
import 'package:smart_ed/utils/approutes.dart';
import 'package:smart_ed/utils/texts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Box>(
        valueListenable: Hive.box(infobox).listenable(),
        builder: (context, box, widget) {
          String fname = box.get('fullname', defaultValue: 'null');
          // String uname = box.get('username', defaultValue: 'null');
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text(
                  'Hi $fname',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const Text(
                  'Your Courses',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Image.asset('assets/images/books.png'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'My  List',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, newcourseRoute);
                      },
                      child: const Text(
                        'Add New +',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Consumer<CourseService>(
                    builder: (context, snap, child) {
                      if (snap.isLoading && snap.list.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snap.list.isEmpty) {
                        return const Center(
                          child: Text(
                            'No courses yet, click on the + button to add new course',
                            textAlign: TextAlign.center,
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
                                  Navigator.pushNamed(context, courseRoute);
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
          );
        },
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
