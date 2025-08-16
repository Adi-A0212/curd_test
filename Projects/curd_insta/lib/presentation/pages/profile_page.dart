import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import '../widgets/profile_header.dart';

class ProfilePage extends StatelessWidget {
  final UserController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.loadUserProfile();

    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.user.value == null) {
          return Center(child: Text("No profile found"));
        }
        return Padding(
          padding: EdgeInsets.all(16),
          child: ProfileHeader(user: controller.user.value!),
        );
      }),
    );
  }
}
