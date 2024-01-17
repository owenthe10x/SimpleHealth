import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
          backgroundColor: const Color(0xFF008080),
          rippleColor: const Color(0xFFB2D8D8),
          color: const Color(0xFFB2D8D8),
          activeColor: const Color(0xFFB2D8D8),
          tabBackgroundColor: const Color(0xFF006666),
          tabMargin: const EdgeInsetsDirectional.symmetric(vertical: 10),
          gap: 8,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          iconSize: 30,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          onTabChange: (value) => onTabChange!(value),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.calendar_month,
              text: 'Schedule',
            ),
            GButton(
              icon: Icons.chat_bubble,
              text: 'Consult',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            )
          ]),
    );
  }
}
