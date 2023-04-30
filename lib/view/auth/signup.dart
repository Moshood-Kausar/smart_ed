import 'package:flutter/material.dart';
import 'package:smart_ed/utils/approutes.dart';
import 'package:smart_ed/widget/app_button.dart';
import 'package:smart_ed/widget/appcolor.dart';
import 'package:smart_ed/widget/text_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  int? selectedIndex;
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordd = TextEditingController();
  bool btnLoad = false, _hideshoww = true, _hideShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        height: 35,
                      ),
                      AppTextFormField(
                        controller: _username,
                        text: 'Username',
                        hintText: 'SmarTee',
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Empty field detected';
                          } else if (value.length < 2) {
                            return 'Username cannot be less than 3 characters';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      AppTextFormField(
                        controller: _fullname,
                        text: 'Full name',
                        hintText: 'Kausar Moshood',
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
                        controller: _email,
                        text: 'Email',
                        hintText: 'your_mail@email.com',
                        icon: const Icon(Icons.email, color: Colors.grey),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = RegExp(
                            pattern.toString(),
                          );
                          if (!regex.hasMatch(value!)) {
                            return 'Invalid email address';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 24),
                      AppTextFormField(
                        controller: _password,
                        secure: _hideShow,
                        text: 'Password',
                        hintText: '••••••••',
                        textInputAction: TextInputAction.next,
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              _hideShow = !_hideShow;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye,
                              color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Empty field detected';
                          } else if (value.length < 6) {
                            return '6 characters or more required';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 24),
                      AppTextFormField(
                        controller: _passwordd,
                        secure: _hideshoww,
                        text: 'Confirm Password',
                        hintText: '••••••••',
                        textInputAction: TextInputAction.done,
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              _hideshoww = !_hideshoww;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye,
                              color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Empty field detected';
                          } else if (value != _password.text) {
                            return "Password doesn't match";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 80),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 20,
                        height: 48.0,
                        child: AppButton(onPressed: () {}, text: 'Sign Up'),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, loginRoute);
                        },
                        child: const Text('Already have an account? Sign In'),
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
