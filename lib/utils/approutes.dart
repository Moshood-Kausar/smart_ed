import 'package:flutter/material.dart';
import 'package:smart_ed/auth/login.dart';
import 'package:smart_ed/auth/signup.dart';
import 'package:smart_ed/auth/splashscreen.dart';
import 'package:smart_ed/screens/dashboard.dart';
import 'package:smart_ed/screens/homepage.dart';
import 'package:smart_ed/screens/scholarship.dart';
import 'package:smart_ed/screens/settings.dart';

class AppRoutes {
  Map<String, Widget Function(BuildContext ctx)> routes =
      <String, WidgetBuilder>{
    '/': (ctx) => const SplashScreen(),
    '/signup': (ctx) => const SignUpScreen(),
    '/login': (ctx) => const LoginScreen(),
    '/dashboard': (ctx) => const DashBoard(),
    '/homepage': (ctx) => const HomePage(),
    '/settings': (ctx) => const Settings(),
    '/scholarship': (ctx) => const Scholarship(),
  };
}
