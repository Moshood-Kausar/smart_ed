import 'package:flutter/material.dart';
import 'package:smart_ed/view/auth/login.dart';
import 'package:smart_ed/view/auth/signup.dart';
import 'package:smart_ed/view/auth/splashscreen.dart';
import 'package:smart_ed/view/dashboard.dart';
import 'package:smart_ed/view/screens/homepage.dart';
import 'package:smart_ed/view/screens/scholarship.dart';
import 'package:smart_ed/view/screens/settings.dart';

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
