import '../entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts({bool refresh, required int page});
  Future<void> like({required String postId, required bool like});
  Future<void> comment({required String postId, required String comment});
}
