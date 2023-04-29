import 'package:flutter/material.dart';
import 'package:smart_ed/auth/login.dart';
import 'package:smart_ed/auth/signup.dart';
import 'package:smart_ed/auth/splashscreen.dart';

class AppRoutes {
  Map<String, Widget Function(BuildContext ctx)> routes =
      <String, WidgetBuilder>{
    '/': (ctx) => const SplashScreen(),
    '/signup': (ctx) => const SignUpScreen(),
    '/login': (ctx) => const LoginScreen(),
  };
}
