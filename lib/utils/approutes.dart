import 'package:flutter/material.dart';
import 'package:smart_ed/view/auth/login.dart';
import 'package:smart_ed/view/auth/onboarding.dart';
import 'package:smart_ed/view/auth/signup.dart';
import 'package:smart_ed/view/auth/splashscreen.dart';
import 'package:smart_ed/view/dashboard.dart';
import 'package:smart_ed/view/screens/course/course_details.dart';
import 'package:smart_ed/view/screens/course/quiz.dart';
import 'package:smart_ed/view/screens/course/read.dart';
import 'package:smart_ed/view/screens/new_course.dart';

const String splashRoute = 'splash';
const String signupRoute = 'signup';
const String loginRoute = 'login';
const String dashboardRoute = 'dashboard';
const String courseRoute = 'coursedetails';
const String newcourseRoute = 'newcourse';
const String onboardingRoute = 'onboarding';
const String quizRoute = 'quiz';
const String readRoute = 'read';

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
      case courseRoute:
        return MaterialPageRoute(
          builder: (_) => CourseDetails(
            data: settings.arguments,
          ),
        );
      case newcourseRoute:
        return MaterialPageRoute(builder: (_) => const NewCourse());
      case onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case quizRoute:
        return MaterialPageRoute(builder: (_) => const Quiz());
      case readRoute:
        return MaterialPageRoute(
          builder: (_) => ReadPage(
            content: settings.arguments,
          ),
        );

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
