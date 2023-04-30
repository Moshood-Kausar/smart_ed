import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_ed/core/services/apis/auth_api.dart';
import 'package:smart_ed/utils/approutes.dart';
import 'package:smart_ed/widget/app_button.dart';
import 'package:smart_ed/widget/appcolor.dart';

import '../../widget/text_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController? _email, _password;
  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Your Study Buddy to Learn and Earn...',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: AppColor.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      AppTextFormField(
                        controller: _email,
                        text: 'Email',
                        hintText: 'your_mail@email.com',
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = RegExp(pattern.toString());
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
                        secure: true,
                        text: 'Password',
                        hintText: 'Enter your password',
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Empty field detected';
                          } else if (value.length < 3) {
                            return 'password cannot be less than 3 characters';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 100),
                      Consumer<AuthService>(
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
                                  snap.login(
                                    context,
                                    email: _email!.text,
                                    pass: _password!.text,
                                  );
                                }
                              },
                              text: 'Login',
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, signupRoute);
                  },
                  child: const Text('Does not have an account?Sign Up'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
