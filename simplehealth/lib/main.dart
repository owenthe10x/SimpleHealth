import 'package:flutter/material.dart';
import 'package:simplehealth/pages/login_page.dart';
import 'package:simplehealth/pages/intro_page.dart';
import 'package:go_router/go_router.dart';
import 'package:simplehealth/components/layout.dart';
import 'package:provider/provider.dart';
import './providers/models_provider.dart';
import './providers/chats_provider.dart';

void main() {
  runApp(SimpleHealthApp());
}

class SimpleHealthApp extends StatelessWidget {
  SimpleHealthApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ModelsProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ChatProvider(),
          ),
        ],
        child: MaterialApp.router(
          theme: ThemeData(fontFamily: 'Roboto'),
          routerConfig: _router,
          debugShowCheckedModeBanner: false,
        ));
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
