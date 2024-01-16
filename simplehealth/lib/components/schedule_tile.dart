import 'package:flutter/material.dart';
import 'package:simplehealth/models.dart/schedule.dart';

class ScheduleTile extends StatelessWidget {
  Schedule schedule;

  ScheduleTile({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: FilledButton(
          onPressed: () {},
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Image.asset(
                  'assets/icon/medication.png',
                  height: 100,
                ),
              ),
              Column(
                children: [Text(schedule.title), Text(schedule.description)],
              )
            ],
          )),
    );
  }
}
