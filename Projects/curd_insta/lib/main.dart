import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/routes/app_router.dart';
import 'data/datasources/remote_api.dart';
import 'data/repositories/post_repository_impl.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/usecases/get_posts_usecase.dart';
import 'domain/usecases/get_user_profile_usecase.dart';
import 'presentation/controllers/post_controller.dart';
import 'presentation/controllers/user_controller.dart';
import 'presentation/pages/post_list_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Use FFI for desktop
  // if (!kIsWeb &&
  //     (defaultTargetPlatform == TargetPlatform.windows ||
  //         defaultTargetPlatform == TargetPlatform.linux ||
  //         defaultTargetPlatform == TargetPlatform.macOS)) {
  //   sqfliteFfiInit();
  //   databaseFactory = databaseFactoryFfi;
  // } else {
  //   databaseFactory = databaseFactoryFfiWeb;
  // }
  // final localDb = LocalDb();
  // final userLocalDb = UserLocalDb();
  final remoteApi = RemoteApi();

  // Posts
  final postRepo = PostRepositoryImpl(
    remoteApi: remoteApi,
    // localDb: localDb
  );
  final postUseCase = GetPostsUseCase(postRepo);
  Get.put(PostController(postUseCase));

  // User
  final userRepo = UserRepositoryImpl(
    remoteApi: remoteApi,
    // localDb: userLocalDb
  );
  final userUseCase = GetUserProfileUseCase(userRepo);
  Get.put(UserController(userUseCase));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: PostListPage(),
      initialRoute: "/",
      getPages: AppRouter.pages,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.trackpad,
        },
      ),
    );
  }
}

//
// class HomeTabs extends StatefulWidget {
//   @override
//   State<HomeTabs> createState() => _HomeTabsState();
// }
//
// class _HomeTabsState extends State<HomeTabs> {
//   int _selectedIndex = 0;
//   final pages = [PostListPage(), ProfilePage()];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: (index) => setState(() => _selectedIndex = index),
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Feed"),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
//         ],
//       ),
//     );
//   }
// }
