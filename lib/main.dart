import 'package:captiveportal/cubits/login_cubit.dart';
import 'package:captiveportal/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';

final serviceLocator = GetIt.instance;

void initializeRoutes() {
  serviceLocator.registerLazySingleton<RouteBase>(
    instanceName: 'all-routes',
    () => ShellRoute(
      pageBuilder: (context, state, child) => NoTransitionPage(
        child: child,
      ),
      routes: MyRoutes.myRoutes
    )
  );
  serviceLocator.registerLazySingleton<GoRouter>(
    () => GoRouter(
      initialLocation: '/',
      routes: [
        serviceLocator<RouteBase>(instanceName: 'all-routes'),
      ],
    ),
  );
}

void initializeData() {
  serviceLocator.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions.defaultOptions,
    ),
  );
  serviceLocator.registerLazySingleton<LoginCubit>(() => LoginCubit());
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Here we set the URL strategy for our web app.
  // This will remove /#/
  setPathUrlStrategy();
  initializeRoutes();
  initializeData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Captive Portal | Connect',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: GoogleFonts.montserrat().fontFamily),
      routerConfig: serviceLocator<GoRouter>(),
    );
  }
}
