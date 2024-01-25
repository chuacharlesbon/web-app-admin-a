import 'dart:developer';

import 'package:captiveportal/components/constants.dart';
import 'package:captiveportal/components/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key, this.title});

  final String? title;

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  void initData() {
    log("Initialize ${widget.title} screen");
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          DrawerAdmin(title: widget.title),
          Expanded(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.deepPurple.withOpacity(0.2),
                child: GestureDetector(
                  onTap: () {
                    //GetIt.instance<GoRouter>().goNamed(RouteNames.login.name);
                  },
                  child: Text(widget.title ?? "Content"),
                )),
          )
        ],
      ),
    );
    /* final myAppCubit = GetIt.instance<MyAppCubit>();
    return BlocBuilder<MyAppCubit, MyAppState>(
      bloc: myAppCubit,
      builder: (context, state) {
        return Scaffold(
          body: Row(
            children: [
              const DrawerAdmin(),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.deepPurple.withOpacity(0.2),
                  child: GestureDetector(
                    onTap: () {
                      GetIt.instance<GoRouter>().goNamed(Routes.login.name);
                    },
                    child: const Text(
                      'Home'
                    ),
                  )
                ),
              )
            ],
          ),
        );
      }
    ); */
  }
}
