import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_ed/widget/appcolor.dart';
import 'package:smart_ed/widget/text_form.dart';
// import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';

class NewCourse extends StatefulWidget {
  const NewCourse({super.key});

  @override
  State<NewCourse> createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  bool _scanning = false;
  String _extractText = '';
  XFile? _pickedImage;
  final ImagePicker picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _coursecode, _coursetitle, _extract;
  @override
  void initState() {
    super.initState();
    _coursecode = TextEditingController();
    _coursetitle = TextEditingController();
    _extract = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'SmartED',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Your Study Buddy to Learn and Earn...',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, color: AppColor.grey),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      AppTextFormField(
                        controller: _coursecode,
                        text: 'Course code',
                        hintText: 'CPE 504',
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Empty field detected';
                          } else if (value.length < 2) {
                            return 'Firstname cannot be less than 3 characters';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 24),
                      AppTextFormField(
                        controller: _coursetitle,
                        text: 'Course Title',
                        hintText: 'Research Methodology',
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Empty field detected';
                          } else if (value.length < 2) {
                            return 'Firstname cannot be less than 3 characters';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _pickedImage == null
                          ? Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey[300],
                              child: const Icon(
                                Icons.image,
                                size: 100,
                              ),
                            )
                          : Container(
                              height: 300,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                image: DecorationImage(
                                  image: FileImage(File(_pickedImage!.path)),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                      Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: MaterialButton(
                          color: AppColor.primary,
                          child: const Text(
                            'Pick Note Image',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              _scanning = true;
                            });
                            _pickedImage = await picker.pickImage(
                                source: ImageSource.gallery);
                            // _extractText =
                            //     await FlutterTesseractOcr.extractText(
                            //         _pickedImage!.path);
                            log(_extractText);
                            log(_pickedImage!.path);

                            setState(() {
                              _scanning = false;
                              _extract!.text == _extractText;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      _scanning
                          ? Center(
                              child: Column(
                                children: [
                                  CircularProgressIndicator(),
                                  Text(
                                    'Please wait while we extract the image to text',
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                      const SizedBox(height: 20),
                      AppTextFormField(
                        secure: false,
                        controller: _extract,
                        maxLines: 8,
                        //initialValue: _extractText,
                        text: 'Extracted text',
                        //hintText: 'CPE 504',
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Empty field detected';
                          } else if (value.length < 2) {
                            return 'Firstname cannot be less than 3 characters';
                          } else {
                            return null;
                          }
                        },
                      ),
                      Center(
                        child: Text(
                          _extractText,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
