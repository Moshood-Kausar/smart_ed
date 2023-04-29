import 'package:flutter/material.dart';
import 'package:smart_ed/utils/widget/app_button.dart';
import 'package:smart_ed/utils/widget/appcolor.dart';

import '../utils/widget/text_form.dart';

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
                      controller: _email,
                      text: 'Email',
                      hintText: 'your_mail@email.com',
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Empty field detected';
                        } else if (value.length < 6) {
                          return 'email cannot be less than 6 characters';
                        } else if (!value.contains('@')) {
                          return 'Invalid email address entered';
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
                        } else if (value.length < 6) {
                          return 'password cannot be less than 6 characters';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 100),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 20,
                      height: 48.0,
                      child: AppButton(onPressed: () {}, text: 'Login'),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/signup',
                  );
                },
                child: const Text('Does not have an account?Sign Up'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
