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
          const SizedBox(
            height: 80,
          ),
          const Text('SimpleHealth',
              style: TextStyle(fontSize: 30, color: Colors.white)),
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Image.asset(
              'assets/icons/logo.png',
              scale: 0.75,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Revolutionizing Wellness Management with Integrated Health Solutions',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(400, 50)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF006666))),
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
