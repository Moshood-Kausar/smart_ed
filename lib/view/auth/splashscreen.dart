import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_ed/utils/approutes.dart';
import 'package:smart_ed/utils/texts.dart';
import 'package:smart_ed/widget/appcolor.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      var box = Hive.box(infobox).listenable();
      String data = box.value.get('username', defaultValue: 'null');
      Navigator.pushNamed(
        context,
        data == 'null' ? onboardingRoute : dashboardRoute,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'SMART ED',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: AppColor.primary,
              ),
            ),
            Text(
              'Your Study Buddy to Learn and Earn...',
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: AppColor.grey),
            ),
          ],
        ),
      ),
    );
  }
}
