import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.horizontal,
        addAutomaticKeepAlives: false,
        children: [
          Container(
            color: Colors.red,
            width: 1024,
            height: 1024,
          ),
          Container(
            color: Colors.blue,
            width: 1024,
            height: 1024,
          ),
          Container(
            color: Colors.yellow,
            width: 1024,
            height: 1024,
          )
        ],
      ),
    );
  }
}
