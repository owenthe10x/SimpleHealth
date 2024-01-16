import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:simplehealth/components/schedule_tile.dart';
import 'package:simplehealth/models.dart/schedule.dart';

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
    return Column(
      children: [
        Container(
            child: Column(children: [
          TextButton(onPressed: () {}, child: const Icon(Icons.close)),
          Row(
            children: [
              Image.asset('assets/icons/brain.png', height: 100),
              Column(
                children: [
                  const Text('AI-Powered Scheduler'),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                        'Revolutionize your fitness routine effortlessly with our cutting-edge AI technology, ensuring an optimal and personalized workout schedule for you!'),
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('Try it!'))
                ],
              )
            ],
          )
        ])),
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              const Text('Schedule'),
              TableCalendar(
                locale: "en_US",
                rowHeight: 40,
                shouldFillViewport: false,
                calendarFormat: CalendarFormat.week,
                headerStyle: const HeaderStyle(
                    formatButtonVisible: false, titleCentered: true),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                onDaySelected: _onDaySelected,
              )
            ])),
        const Divider(),
        Column(
          children: [
            Row(
              children: [
                Text(DateFormat("EEEEEEEE, MMM d yyyy").format(today)),
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
