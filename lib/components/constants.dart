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
  static MyRouteModel content = MyRouteModel(
    name: "content",
    path: "/admin/content",
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
      nameEN: "Content Management",
      nameAR: "Content Management (AR)",
      path: RouteNames.content.path,
    ),
    DrawerItemModel(
      nameEN: "Languages",
      nameAR: "Languages (AR)",
      path: RouteNames.dashboard.path,
    ),
    DrawerItemModel(
      nameEN: "Portal Customization",
      nameAR: "Portal Customization (AR)",
      path: RouteNames.dashboard.path,
    ),
    DrawerItemModel(
      nameEN: "Themes",
      nameAR: "Themes (AR)",
      path: RouteNames.dashboard.path,
    ),
  ];
}