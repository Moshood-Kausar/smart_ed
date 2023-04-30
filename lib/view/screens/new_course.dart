import 'package:flutter/material.dart';


import 'package:smart_ed/utils/widget/appcolor.dart';
import 'package:smart_ed/utils/widget/text_form.dart';




class NewCourse extends StatefulWidget {
  const NewCourse({super.key});

  @override
  State<NewCourse> createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _coursecode, _coursetitle;
  @override
  void initState() {
    super.initState();
    _coursecode = TextEditingController();
    _coursetitle = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
                      text: 'course code',
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
                    const SizedBox(height: 100),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width - 20,
                    //   height: 48.0,
                    //   child: AppButton(
                    //     onPressed: () {
                    //       // Navigator.pushNamed(context, dashboardRoute);
                    //     },
                    //     text: 'Login',
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
