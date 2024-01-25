class MyRouteModel {
      String name;
      String path;

  MyRouteModel({
      this.name = "",
      this.path = "",
  });
}

class DrawerItemModel {
      String nameEN;
      String nameAR;
      String path;

  DrawerItemModel({
      this.nameEN = "",
      this.nameAR = "",
      this.path = "",
  });
}

class RouteNames {
  /////////////////////////////////
  ///                           ///
  /// LOGIN ROUTES              ///
  ///                           ///
  /////////////////////////////////
  static MyRouteModel login = MyRouteModel(
    name: "login",
    path: "/",
  );
  static MyRouteModel loginAdmin = MyRouteModel(
    name: "login-admin",
    path: "/admin",
  );
  /////////////////////////////////
  ///                           ///
  /// ADMIN ROUTES              ///
  ///                           ///
  /////////////////////////////////
  static MyRouteModel dashboard = MyRouteModel(
    name: "dashboard",
    path: "/admin/dashboard",
  );
  static MyRouteModel content1 = MyRouteModel(
    name: "content1",
    path: "/admin/content1",
  );
  static MyRouteModel content2 = MyRouteModel(
    name: "content2",
    path: "/admin/content2",
  );
  static MyRouteModel content3 = MyRouteModel(
    name: "content3",
    path: "/admin/content3",
  );
  static MyRouteModel content4 = MyRouteModel(
    name: "content4",
    path: "/admin/content4",
  );
}

class ListItems {
  static List<DrawerItemModel> drawerItems = [
    DrawerItemModel(
      nameEN: "Dashboard",
      nameAR: "Dashboard (AR)",
      path: RouteNames.dashboard.path,
    ),
    DrawerItemModel(
      nameEN: "Content Management 1",
      nameAR: "Content Management 1 (AR)",
      path: RouteNames.content1.path,
    ),
    DrawerItemModel(
      nameEN: "Content Management 2",
      nameAR: "Content Management 2 (AR)",
      path: RouteNames.content2.path,
    ),
    DrawerItemModel(
      nameEN: "Content Management 3",
      nameAR: "Content Management 3 (AR)",
      path: RouteNames.content3.path,
    ),
    DrawerItemModel(
      nameEN: "Content Management 4",
      nameAR: "Content Management 4 (AR)",
      path: RouteNames.content4.path,
    ),
  ];
}