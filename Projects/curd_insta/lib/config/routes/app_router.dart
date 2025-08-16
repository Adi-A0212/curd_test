import 'package:curd_insta/presentation/pages/post_list_page.dart';
import 'package:curd_insta/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routers.dart';

class AppRouter {
  static List<GetPage> pages = [
    // ------------------------------------------------------------------------ LAUNCH
    GetPage(
      name: "/",
      page: () => const PostListPage(),
      // middlewares: [PretendAuthMiddleware()],
    ),
    GetPage(
      name: feedsRoute.route,
      page: () => const PostListPage(),
      middlewares: [PretendAuthMiddleware()],
    ),

    GetPage(name: profileRoute.route, page: () => ProfilePage()),


    //kIsWeb ? const HomePage() :
    // GetPage(name: homeRoute
    //     .route,
    //     page: () =>
    //         HomePage(
    //           navIndex: int.tryParse(Get.parameters['index'] ?? "0") ?? 0,)),
    // GetPage(name: landingRoute.route, page: () => const LandingPage()),
  ];
}

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // if (!Auth.isLogin) AppState.setPersistenceRoute(route ?? "/");
    // return Auth.isLogin ? null : RouteSettings(name: landingRoute.route);
    return null;
  }
}

class PretendAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // return Auth.isLogin ? RouteSettings(name: homeRoute.route) : null;
    return null;
  }
}
