import 'package:flutter/material.dart';
import '../components/bottom_navbar.dart';
import '../pages/schedule_page.dart';
import '../pages/consultation_page.dart';
import '../pages/profile_page.dart';
import '../pages/home_page.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  // this selected index is used to control the bottom navbar
  int _selectedIndex = 0;

  // pages to display
  late List<Widget> _pages = [
    HomePage(onTap: () {
      navigateBottomBar(2);
    }),
    const SchedulePage(),
    const ConsultationPage(),
    const ProfilePage(),
  ];

// this function will be called when the bottom navbar is tapped
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(
          onTabChange: (index) => setState(() => navigateBottomBar(index)),
        ),
        body: _pages[_selectedIndex]);
  }
}
