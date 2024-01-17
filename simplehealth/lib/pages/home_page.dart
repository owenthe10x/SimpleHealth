import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../components/schedule_tile.dart';
import '../models/schedule.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onTap;

  const HomePage({super.key, required this.onTap});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Container(
              width: 100,
            ),
            TextButton(onPressed: () {}, child: const Icon(Icons.notifications))
          ],
        ),
        const Divider(indent: 10, endIndent: 10),
        Center(child: Image.asset('assets/images/yoga.png')),
        const Center(
          child: Text(
            'YOU ARE ON A GOOD PROGRESS',
            style: TextStyle(color: Color(0xFF008080), fontSize: 20),
          ),
        ),
        Center(
          child: LinearPercentIndicator(
              lineHeight: 30,
              barRadius: const Radius.circular(20),
              percent: 0.5,
              center: const Text(
                '80% Wellness',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              backgroundColor: const Color(0xFF008080),
              progressColor: const Color(0xFF96EEBF)),
        ),
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
        Expanded(
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  Schedule schedule = Schedule(
                      title: 'Panadol 160 mg',
                      description:
                          'The medicine is stored inside the pink dashboard besides the table in the living room, labeled “Panadol”',
                      intensity: 'intensity',
                      frequency: 'frequency',
                      duration: 'duration',
                      attachments: 'attachments');
                  return ScheduleTile(schedule: schedule);
                })),
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
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
          child: ElevatedButton(
            onPressed: widget.onTap,
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xFF008080)),
                maximumSize: MaterialStatePropertyAll(Size(100, 50))),
            child: const Text(
              "Start consulting",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
