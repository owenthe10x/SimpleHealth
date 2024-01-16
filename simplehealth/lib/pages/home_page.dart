import 'package:flutter/material.dart';
import '../components/bottom_navbar.dart';
import 'intro_page.dart';
import 'schedule_page.dart';
import 'consultation_page.dart';
import 'profile_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    const Intro(),
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
