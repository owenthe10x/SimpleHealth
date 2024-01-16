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
            TextButton(onPressed: () {}, child: const Text('Edit Profile'))
          ]),
        ),
        Column(
          children: [
            const Divider(),
            TextButton(
                onPressed: () {},
                child: const Row(children: [Icon(Icons.person), Text('Goals')])),
            const Divider(),
            TextButton(
                onPressed: () {},
                child: const Row(children: [Icon(Icons.headset_mic), Text('Help')])),
            const Divider(),
            TextButton(
                onPressed: () {},
                child: const Row(children: [Icon(Icons.settings), Text('Settings')]))
          ],
        ),
        Center(
          child: Column(
            children: [
              TextButton(onPressed: () {}, child: const Text('LOG OUT')),
              const Text('App Version 10.003')
            ],
          ),
        )
      ],
    );
  }
}
