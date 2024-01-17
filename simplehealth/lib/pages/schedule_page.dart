import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:simplehealth/components/schedule_tile.dart';
import 'package:simplehealth/models/schedule.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) =>
      setState(() => today = day);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            child: Column(children: [
          TextButton(onPressed: () {}, child: const Icon(Icons.close)),
          Row(
            children: [
              Image.asset('assets/icons/brain.png', height: 100),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'AI-Powered Scheduler',
                    style: TextStyle(color: Color(0xFF006666), fontSize: 25),
                  ),
                  const Text(
                    'Revolutionize your fitness routine effortlessly with our cutting-edge AI technology, ensuring an optimal and personalized workout schedule for you!',
                    style: TextStyle(color: Color(0xFF006666), fontSize: 15),
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Color(0xFF008080))),
                      onPressed: () {},
                      child: const Text(
                        'Try it!',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ],
          )
        ])),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF006666)),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Column(children: [
            const Text('Schedule',
                style: TextStyle(color: Color(0xFF006666), fontSize: 20)),
            const Divider(),
            SizedBox(
              height: 300,
              width: 300,
              child: TableCalendar(
                locale: "en_US",
                shouldFillViewport: true,
                calendarStyle: CalendarStyle(
                    todayTextStyle: const TextStyle(color: Colors.black87),
                    todayDecoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: const Color(0xFF006666), width: 1),
                      backgroundBlendMode: BlendMode.colorBurn,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: const BoxDecoration(
                        color: Color(0xFF006666), shape: BoxShape.circle)),
                headerStyle: const HeaderStyle(
                    formatButtonVisible: false, titleCentered: true),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                onDaySelected: _onDaySelected,
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 40,
        ),
        const Divider(
          endIndent: 20,
          indent: 20,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    DateFormat("EEEEEEEE, MMM d yyyy").format(today),
                    style: const TextStyle(
                      color: Color(0xFF006666),
                      fontSize: 20,
                    ),
                  ),
                ),
                TextButton(onPressed: () {}, child: const Icon(Icons.add))
              ],
            ),
            const Column()
          ],
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  Schedule schedule = Schedule(
                      title: 'title',
                      description: 'description',
                      intensity: 'intensity',
                      frequency: 'frequency',
                      duration: 'duration',
                      attachments: 'attachments');
                  return ScheduleTile(schedule: schedule);
                }))
      ],
    );
  }
}
