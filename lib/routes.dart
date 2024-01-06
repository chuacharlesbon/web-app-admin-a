import 'package:captiveportal/components/constants.dart';
import 'package:captiveportal/pages/features/content-management/content-page.dart';
import 'package:captiveportal/pages/features/dashboard/dashboard-page.dart';
import 'package:captiveportal/pages/login-admin.dart';
import 'package:captiveportal/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyRoutes {
  static List<GoRoute> myRoutes = [
    /////////////////////////////////
    ///                           ///
    /// LOGIN ROUTES              ///
    ///                           ///
    /////////////////////////////////
    GoRoute(
      path: '/',
      name: RouteNames.login.name,
      builder: (context, state) => const SafeArea(
        child: Scaffold(
          body: LoginScreen()
        ),
      ),
    ),

    /////////////////////////////////
    ///                           ///
    /// ADMIN ROUTES              ///
    ///                           ///
    /////////////////////////////////
    GoRoute(
      path: '/admin',
      name: RouteNames.loginAdmin.name,
      builder: (context, state) => const SafeArea(
        child: Scaffold(
          body: LoginAdminScreen()
        ),
      ),
      routes: [
        GoRoute(
          path: 'dashboard',
          name: RouteNames.dashboard.name,
          builder: (context, state) => const SafeArea(
            child: Scaffold(
              body: DashboardPage(title: "Dashboard"),
            ),
          ),
          pageBuilder: (context, state) => const MaterialPage(
            child: DashboardPage(title: "Dashboard"),
          ),
        ),
        GoRoute(
          path: 'content',
          name: RouteNames.content.name,
          builder: (context, state) => const SafeArea(
            child: Scaffold(
              body: ContentPage(title: "Content"),
            ),
          ),
        ),
      ]
    ),

    
    
  ];
}