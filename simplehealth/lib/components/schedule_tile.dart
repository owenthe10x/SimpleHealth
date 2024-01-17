import 'package:flutter/material.dart';
import 'package:simplehealth/models/schedule.dart';

class ScheduleTile extends StatelessWidget {
  Schedule schedule;

  ScheduleTile({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
          decoration: const BoxDecoration(color: Color(0xFFB2D8D8)),
          height: 180,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/medication.png',
                      scale: 0.75,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              schedule.title,
                              style: const TextStyle(
                                  color: Color(0xFF008080),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    schedule.description,
                                    style: const TextStyle(fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('More',
                        style: TextStyle(
                            color: Color(0xFF008080),
                            decoration: TextDecoration.underline)),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
