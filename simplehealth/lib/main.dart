import 'package:flutter/material.dart';
import 'package:simplehealth/pages/login_page.dart';
import 'package:simplehealth/pages/intro_page.dart';
import 'package:go_router/go_router.dart';
import 'package:simplehealth/components/layout.dart';

void main() {
  runApp(SimpleHealthApp());
}

class SimpleHealthApp extends StatelessWidget {
  SimpleHealthApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/intro',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Layout(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: '/intro',
        builder: (context, state) => const Intro(),
      ),
    ],
  );
}
