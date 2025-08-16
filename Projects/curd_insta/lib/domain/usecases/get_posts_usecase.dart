import '../entities/post.dart';
import '../repositories/post_repository.dart';

class GetPostsUseCase {
  final PostRepository repository;

  GetPostsUseCase(this.repository);

  Future<List<Post>> call({bool refresh = false, int page = 1}) async {
    final list = await repository.getPosts(refresh: refresh, page: page);
    return list;
  }

  Future<void> like({required String postId, required bool like}) async {
    await repository.like(postId: postId, like: like);
  }

  Future<void> comment({
    required String postId,
    required String comment,
  }) async {
    await repository.comment(postId: postId, comment: comment);
  }
}
