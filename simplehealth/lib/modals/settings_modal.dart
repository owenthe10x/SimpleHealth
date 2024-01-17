import 'package:flutter/material.dart';

class SettingsModal extends StatefulWidget {
  const SettingsModal({super.key});

  @override
  State<SettingsModal> createState() => _SettingsModalState();
}

class _SettingsModalState extends State<SettingsModal> {
  Set<String> selectedLanguage = <String>{"EN"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF008080),
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: Color(0xFFB2D8D8)),
            child: Row(
              children: [
                const Icon(Icons.person),
                const Text('App Language'),
                SegmentedButton(
                    segments: const [
                      ButtonSegment(value: 'ID', label: Text('ID')),
                      ButtonSegment(value: 'EN', label: Text('EN'))
                    ],
                    selected: selectedLanguage,
                    onSelectionChanged: (Set<String> newSelection) {
                      setState(() {
                        // By default there is only a single segment that can be
                        // selected at one time, so its value is always the first
                        // item in the selected set.
                        selectedLanguage = newSelection;
                      });
                    })
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Color(0xFFB2D8D8)),
            child: Row(
              children: [
                const Icon(Icons.person),
                const Text('Delete My Account'),
                TextButton(
                    onPressed: () {}, child: const Icon(Icons.arrow_forward))
              ],
            ),
          )
        ],
      ),
    );
  }
}
