import 'package:flutter/material.dart';
import 'package:smart_ed/view/auth/login.dart';
import 'package:smart_ed/view/auth/signup.dart';
import 'package:smart_ed/view/auth/splashscreen.dart';
import 'package:smart_ed/view/dashboard.dart';

const String splashRoute = 'splash';
const String signupRoute = 'signup';
const String loginRoute = 'login';
const String dashboardRoute = 'dashboard';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case signupRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case dashboardRoute:
        return MaterialPageRoute(builder: (_) => const DashBoard());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(_);
                  },
                  child: const Text('Go back'),
                )
              ],
            ),
          ),
        );
    }
  }
}
