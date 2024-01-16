import 'package:flutter/material.dart';
import 'package:simplehealth/models.dart/schedule.dart';

class ScheduleTile extends StatelessWidget {
  Schedule schedule;

  ScheduleTile({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
          decoration: BoxDecoration(color: Color(0xFFB2D8D8)),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/icons/medication.png',
                    height: 150,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        schedule.title,
                        style: const TextStyle(
                            color: Color(0xFF008080),
                            fontSize: 25,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        schedule.description,
                        style: const TextStyle(
                            color: Color(0xFF008080), fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text('More',
                    style: TextStyle(
                      color: Color(0xFF008080),
                    )),
              )
            ],
          )),
    );
  }
}
