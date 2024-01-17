import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(children: [
            Row(
              children: [
                FilledButton(onPressed: () {}, child: const Icon(Icons.person)),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('Jason Jahja'), Text('+62 826172837')],
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [Icon(Icons.calendar_month), Text('16 Years')],
                ),
                Column(
                  children: [Icon(Icons.monitor_weight), Text('72kg')],
                ),
                Column(
                  children: [Icon(Icons.height), Text('177 cm')],
                ),
              ],
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
                      child: Image.asset('assets/icons/target.png')),
                  const Text(
                    'Goals',
                    style: TextStyle(color: Color(0xFF008080)),
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
                      child: Image.asset('assets/icons/cs.png')),
                  const Text(
                    'Help',
                    style: TextStyle(color: Color(0xFF008080)),
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
                      child: Image.asset('assets/icons/setting.png')),
                  const Text(
                    'Settings',
                    style: TextStyle(color: Color(0xFF008080)),
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
                        color: Color(0xFF008080),
                        decoration: TextDecoration.underline),
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
