import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:smart_ed/core/services/apis/course_api.dart';
import 'package:smart_ed/widget/app_button.dart';
import 'package:smart_ed/widget/image_widget.dart';
import 'package:smart_ed/widget/text_form.dart';
// import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';

class NewCourse extends StatefulWidget {
  const NewCourse({super.key});

  @override
  State<NewCourse> createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  bool _scanning = false, showEdit = false;
  final String _extractText = '';
  List images = [];
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
      appBar: AppBar(
        title: const Text('Add Note'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
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
                  const SizedBox(height: 25),
                  ImagePickerWidget.imageWidget(images, getImageWidget),
                  if (images.isNotEmpty)
                    TextButton(
                      onPressed: () async {
                        setState(() {
                          _scanning = true;
                        });
                        String convertedtext = '';
                        for (var i = 0;
                            i < (images.length > 5 ? 5 : images.length);
                            i++) {
                          await FlutterTesseractOcr.extractText(images[i])
                              .then((value) {
                            convertedtext += value;

                            return value;
                          });
                        }
                        _extract = TextEditingController(text: convertedtext);
                        log('Inside - $convertedtext');

                        setState(() {
                          _scanning = false;
                          showEdit = true;
                          _extract!.text == _extractText;
                        });
                      },
                      child: const Text('Convert to text'),
                    ),
                  const SizedBox(height: 20),
                  _scanning
                      ? Center(
                          child: Column(
                            children: const [
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
                  Visibility(
                    visible: showEdit,
                    child: AppTextFormField(
                      secure: false,
                      controller: _extract,
                      maxLines: 12,
                      text: 'Extracted text',
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
                  ),
                  const SizedBox(height: 30),
                  if (showEdit)
                    Consumer<CourseService>(
                      builder: (context, snap, child) {
                        if (snap.isLoading) {
                          return const CircularProgressIndicator();
                        }

                        return SizedBox(
                          width: MediaQuery.of(context).size.width - 20,
                          height: 48.0,
                          child: AppButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                snap.createcourse(
                                  context,
                                  code: _coursecode!.text,
                                  content: _extract!.text,
                                  name: _coursetitle!.text,
                                );
                              }
                            },
                            text: 'Add Note',
                          ),
                        );
                      },
                    ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getImageWidget() {
    ImagePickerWidget.showImagePickerDialog(
      context,
      onCameraTap: () async {
        final XFile? uploadedImage =
            await picker.pickImage(source: ImageSource.camera);
        if (uploadedImage != null && uploadedImage.path.isNotEmpty) {
          images.add(uploadedImage.path);
        }
      },
      onGalleryTap: () async {
        final List<XFile> selectedImages = await picker.pickMultiImage();
        if (selectedImages.isNotEmpty) {
          setState(() {
            for (var i = 0; i < selectedImages.length; i++) {
              images.add(selectedImages[i].path);
            }
          });
        }
      },
    );
  }
}
