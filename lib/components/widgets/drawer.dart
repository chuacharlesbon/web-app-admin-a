import 'dart:developer';

import 'package:captiveportal/components/constants.dart';
import 'package:captiveportal/components/widgets/buttons.dart';
import 'package:captiveportal/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class DrawerAdmin extends StatefulWidget {
  const DrawerAdmin({super.key, this.title});

  final String? title;

  @override
  State<DrawerAdmin> createState() => _MyDrawerAdminState();
}

class _MyDrawerAdminState extends State<DrawerAdmin> {

  bool isCollapsed = false;

  void initData() {
    log("Initialize drawer component");
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

  Widget drawerButton({
    required String route,
    required String label,
  }) {
    return MyFilledButton(
      // buttonText: label,
      buttonChild: Expanded(
        child: Text(
          label,
          style: MyTheme.textbody16(
            color: widget.title == label
                ? Colors.blue
                : Colors.white
          )
        ),
      ),
      onPressed: () {
        GetIt.instance<GoRouter>().go(route);
      },
      mainAxisAlignment: MainAxisAlignment.start,
      buttonStyle: MyTheme.buttonStyleTypeA(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 12
        ),
        color: widget.title == label
            ? Colors.white
            : Colors.transparent,
        isRounded: false
      ),
    );
    return Container(
      color: widget.title == label ? Colors.white : null,
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          GetIt.instance<GoRouter>().go(route);
        },
        child: Text(
          label,
          style: TextStyle(
            color: widget.title == label ? Colors.blue : Colors.white
          ),
          textAlign: TextAlign.left,
        )
      ),
    );
  }

  Widget collapsedDrawer() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width >= 1536 ? 80 : 60,
      height: double.infinity,
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isCollapsed = !isCollapsed;
          });
        },
        child: const Text(
          'Drawer'
        ),
      )
    );
  }

  Widget fullDrawer() {
    Size size = MediaQuery.of(context).size;
    List<DrawerItemModel> drawerValues = ListItems.drawerItems;
    return Container(
      width: size.width >= 1536 ? 300 : 250,
      height: double.infinity,
      color: Colors.blue,
      child: Column(
        children: [
          ...drawerValues.map((item) => drawerButton(
            label: item.nameEN,
            route: item.path
          )),
          MyFilledButton(
            // buttonText: label,
            buttonChild: Expanded(
              child: Text(
                "LOG OUT",
                style: MyTheme.textbody16(
                  color: Colors.white
                )
              ),
            ),
            onPressed: () {
              GetIt.instance<GoRouter>().goNamed(RouteNames.login.name);
            },
            mainAxisAlignment: MainAxisAlignment.start,
            buttonStyle: MyTheme.buttonStyleTypeA(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 12
              ),
              color: Colors.transparent,
              isRounded: false
            ),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return isCollapsed
        ? collapsedDrawer()
        : fullDrawer();
    /* final myAppCubit = GetIt.instance<MyAppCubit>();
    return BlocBuilder<MyAppCubit, MyAppState>(
      bloc: myAppCubit,
      builder: (context, state) {
        return isCollapsed
        ? collapsedDrawer()
        : fullDrawer();
      }
    ); */
  }
}