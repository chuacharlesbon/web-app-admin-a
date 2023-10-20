import 'package:captiveportal/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyRoutes {
  static List<RouteBase> myRoutes = [
    GoRoute(
      path: '/',
      name: 'login',
      pageBuilder: (context, state) => const MaterialPage(
        child: LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/works',
      name: 'works',
      pageBuilder: (context, state) => MaterialPage(
        child: Container(
          child: Text('')
        ),
      ),
    )
  ];
}