import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF008080),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(children: [
          const Text('SimpleHealth',
              style: TextStyle(fontSize: 30, color: Colors.white)),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Image.asset('assets/icons/logo.png', height: 100),
          ),
          const Text(
            'Revolutionizing Wellness Management with Integrated Health Solutions',
            style: TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF66B2B2))),
              onPressed: () {
                GoRouter.of(context).go('/login');
              },
              child: const Text(
                'Get Started!',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ))
        ]),
      )),
    );
  }
}
