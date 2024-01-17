import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.person,
                      color: Color(0xFFB2D8D8),
                      size: 40,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF008080),
                    ),
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jason Jahja',
                        style:
                            TextStyle(color: Color(0xFF004C4C), fontSize: 25),
                      ),
                      Text(
                        '+62 826172837',
                        style:
                            TextStyle(color: Color(0xFF004C4C), fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.calendar_month,
                        color: Color(0xFF008080), size: 40),
                    Text(
                      '16 Years',
                      style: TextStyle(color: Color(0xFF004C4C)),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.monitor_weight,
                        color: Color(0xFF008080), size: 40),
                    Text(
                      '72kg',
                      style: TextStyle(color: Color(0xFF004C4C)),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.height, color: Color(0xFF008080), size: 40),
                    Text(
                      '177 cm',
                      style: TextStyle(color: Color(0xFF004C4C)),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text('Edit Profile',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF008080),
                            decoration: TextDecoration.underline))),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ]),
        ),
        Column(
          children: [
            const Divider(
              height: 0,
            ),
            TextButton(
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                    shape: MaterialStatePropertyAll(LinearBorder(
                        side: BorderSide(style: BorderStyle.none)))),
                onPressed: () {},
                child: Row(children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child:
                          Image.asset('assets/icons/target.png', scale: 0.8)),
                  const Text(
                    'Goals',
                    style: TextStyle(color: Color(0xFF008080), fontSize: 20),
                  )
                ])),
            const Divider(
              height: 0,
            ),
            TextButton(
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                    shape: MaterialStatePropertyAll(LinearBorder(
                        side: BorderSide(style: BorderStyle.none)))),
                onPressed: () {},
                child: Row(children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Image.asset('assets/icons/cs.png', scale: 0.8)),
                  const Text(
                    'Help',
                    style: TextStyle(color: Color(0xFF008080), fontSize: 20),
                  )
                ])),
            const Divider(
              height: 0,
            ),
            TextButton(
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                    shape: MaterialStatePropertyAll(LinearBorder(
                        side: BorderSide(style: BorderStyle.none)))),
                onPressed: () {},
                child: Row(children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child:
                          Image.asset('assets/icons/setting.png', scale: 0.8)),
                  const Text(
                    'Settings',
                    style: TextStyle(color: Color(0xFF008080), fontSize: 20),
                  )
                ]))
          ],
        ),
        Center(
          child: Column(
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'LOG OUT',
                    style: TextStyle(
                        color: Color(0xFF66B2B2),
                        decoration: TextDecoration.underline,
                        fontSize: 25),
                  )),
              const Text('App Version 10.003',
                  style: TextStyle(color: Color(0xFF008080)))
            ],
          ),
        )
      ],
    );
  }
}
