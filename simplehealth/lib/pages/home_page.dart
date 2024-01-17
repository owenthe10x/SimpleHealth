import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(),
          const Divider(indent: 10, endIndent: 10),
          Center(child: Image.asset('assets/images/yoga.png')),
          const Center(
            child: Text(
              'YOU ARE ON A GOOD PROGRESS',
              style: TextStyle(color: Color(0xFF008080), fontSize: 20),
            ),
          ),
          Container(),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF008080)),
              ),
              child: const Row(
                children: [
                  Text(
                    'Set your goal',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  Icon(Icons.arrow_right_alt)
                ],
              ),
            ),
          ]),
          const Divider(indent: 10, endIndent: 10),
          const Center(
            child: Text(
              'Upcoming Schedule',
              style: TextStyle(color: Color(0xFF008080), fontSize: 25),
            ),
          ),
          const Divider(indent: 10, endIndent: 10),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Try Our Consultation!',
              style: TextStyle(color: Color(0xFF008080), fontSize: 25),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Elevate your inquiries with our AI chatbot - lightning-fast answers, expert validation, and instant diagnosis through AI lens and image recognition. Smart solutions, swift results!',
              style: TextStyle(color: Color(0xFF008080)),
            ),
          )
        ],
      )),
    );
  }
}
