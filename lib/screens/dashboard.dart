import 'package:flutter/material.dart';
import 'package:smart_ed/screens/homepage.dart';
import 'package:smart_ed/screens/learn_earn.dart';
import 'package:smart_ed/screens/scholarship.dart';
import 'package:smart_ed/screens/settings.dart';
import 'package:smart_ed/utils/widget/appcolor.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int currentIndex = 0;
  final List<Widget> screens = [
    const HomePage(),
    Scholarship(),
    const LearnToEarn(),
    Settings()
  ];
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: AppColor.primary,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) => setState(() {
          currentIndex = value;
        }),
        selectedIconTheme: IconThemeData(color: AppColor.primary),
        unselectedIconTheme: IconThemeData(color: AppColor.grey),
        selectedLabelStyle: TextStyle(color: AppColor.primary),
        unselectedLabelStyle: TextStyle(color: AppColor.grey),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined), label: 'Scholarship'),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), label: 'Learn to Earn'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
