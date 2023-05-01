// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_ed/utils/approutes.dart';
import 'package:smart_ed/utils/texts.dart';
import 'package:smart_ed/widget/appcolor.dart';

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
                  const SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, courseRoute);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: AppColor.grey)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset('assets/images/book.png'),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('CPE 403'),
                                  const Text('Introduction to Computer'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
      // body: ListView(
      //   children: [
      //     _pickedImage == null
      //         ? Container(
      //             height: 300,
      //             color: Colors.grey[300],
      //             child: const Icon(
      //               Icons.image,
      //               size: 100,
      //             ),
      //           )
      //         : Container(
      //             height: 300,
      //             decoration: BoxDecoration(
      //               color: Colors.grey[300],
      //               image: DecorationImage(
      //                 image: FileImage(File(_pickedImage!.path)),
      //                 fit: BoxFit.fill,
      //               ),
      //             ),
      //           ),
      //     Container(
      //       height: 50,
      //       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      //       child: MaterialButton(
      //         color: Colors.green,
      //         child: const Text(
      //           'Pick Image with text',
      //           style: TextStyle(
      //             color: Colors.white,
      //           ),
      //         ),
      //         onPressed: () async {
      //           setState(() {
      //             _scanning = true;
      //           });
      //           _pickedImage =
      //               await picker.pickImage(source: ImageSource.gallery);
      //           _extractText =
      //               await FlutterTesseractOcr.extractText(_pickedImage!.path);
      //           setState(() {
      //             _scanning = false;
      //           });
      //         },
      //       ),
      //     ),
      //     const SizedBox(height: 20),
      //     _scanning
      //         ? const Center(child: CircularProgressIndicator())
      //         : const Icon(
      //             Icons.done,
      //             size: 40,
      //             color: Colors.green,
      //           ),
      //     const SizedBox(height: 20),
      //     Center(
      //       child: Text(
      //         _extractText,
      //         textAlign: TextAlign.center,
      //         style: const TextStyle(
      //           fontSize: 30,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
