import 'package:flutter/material.dart';

class HelpModal extends StatelessWidget {
  const HelpModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF008080),
          title: const Text('Help'),
        ),
        body: Column(
          children: [
            const Text('Tell us your issue, let us help:'),
            Row(
              children: [
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFB2D8D8))),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFB2D8D8))),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFB2D8D8)))
              ],
            ),
            Column(
              children: [
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFB2D8D8))),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFB2D8D8))),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFB2D8D8)))
              ],
            )
          ],
        ));
  }
}
