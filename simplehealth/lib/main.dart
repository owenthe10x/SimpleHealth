import 'package:flutter/material.dart';
import 'package:simplehealth/pages/login.dart';
import 'package:simplehealth/pages/home.dart';
import 'package:simplehealth/pages/intro.dart';

void main() {
  runApp(const SimpleHealthApp());
}

class SimpleHealthApp extends StatelessWidget {
  const SimpleHealthApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      
    );
  }
}
