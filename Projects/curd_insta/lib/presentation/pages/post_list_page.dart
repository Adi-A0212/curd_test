import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/post_controller.dart';
import '../widgets/post_card.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({super.key});

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  final PostController controller = Get.find();

  @override
  void initState() {
    controller.setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("CURD Insta")),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: controller.onRefresh,
            child: ListView.builder(
              controller: controller.listScrollController,
              itemCount: controller.posts.length,
              itemBuilder: (_, index) => PostCard(
                post: controller.posts[index],
                onLikeClick: controller.onPostLikeClick,
                onCommentClick: controller.onPostCommentClick,
              ),
            ),
          );
        }),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.refresh),
        //   onPressed: () => controller.loadPosts(refresh: true),
        // ),
      ),
    );
  }
}
