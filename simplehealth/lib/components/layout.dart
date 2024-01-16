import 'package:flutter/material.dart';
import '../components/bottom_navbar.dart';
import '../pages/intro_page.dart';
import '../pages/schedule_page.dart';
import '../pages/consultation_page.dart';
import '../pages/profile_page.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  // this selected index is used to control the bottom navbar
  int _selectedIndex = 0;

  // this function will be called when the bottom navbar is tapped
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    const HomePage(),
    const SchedulePage(),
    const Consultation(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(
          onTabChange: (index) => navigateBottomBar(index),
        ),
        body: _pages[_selectedIndex]);
  }
}
