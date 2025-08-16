import 'package:curd_insta/presentation/widgets/comments_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../domain/entities/post.dart';
import '../../domain/usecases/get_posts_usecase.dart';

class PostController extends GetxController {
  final listScrollController = ScrollController();
  int presentPage = 1;
  final GetPostsUseCase getPostsUseCase;

  var posts = <Post>[].obs;
  var isLoading = false.obs;

  PostController(this.getPostsUseCase);

  void setup() {
    listScrollController.addListener(() {
      if (listScrollController.position.pixels >=
          listScrollController.position.maxScrollExtent - 50) {
        paginatePosts(page: ++presentPage);
      }
    });
    loadPosts();
  }

  Future<void> loadPosts({bool refresh = false}) async {
    isLoading.value = true;
    try {
      posts.value = await getPostsUseCase(refresh: refresh);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> paginatePosts({required int page}) async {
    try {
      posts.addAll(await getPostsUseCase(page: page));
    } finally {}
  }

  onPostLikeClick(Post post) {
    post.liked.toggle();
    getPostsUseCase.like(postId: post.id.toString(), like: post.liked.value);
  }

  onPostCommentClick(Post post) {
    print("Comment");
    Get.bottomSheet(
      CommentSheet(
        onCommentSend: (comment) async {
          getPostsUseCase.comment(postId: post.id.toString(), comment: comment);
        },
      ),
      isScrollControlled: true,
    );
  }

  Future<void> onRefresh() async {
    loadPosts();
  }
}
