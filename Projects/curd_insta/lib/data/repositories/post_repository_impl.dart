import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/remote_api.dart';
import '../models/post_model.dart';

class PostRepositoryImpl implements PostRepository {
  final RemoteApi remoteApi;

  // final LocalDb localDb;

  PostRepositoryImpl({
    required this.remoteApi,
    // required this.localDb
  });

  @override
  Future<List<Post>> getPosts({bool refresh = false, required int page}) async {
    List<PostModel> postModels;

    // if (refresh) {
    postModels = await remoteApi.fetchPosts(page: page);
    // await localDb.insertPosts(postModels);
    // } else {
    //   final cachedPosts = await localDb.getPosts();
    //   if (cachedPosts.isEmpty) {
    //     postModels = await remoteApi.fetchPosts();
    //     await localDb.insertPosts(postModels);
    //   } else {
    //     postModels = cachedPosts;
    //   }
    // }

    // Convert PostModel → Post before returning
    return postModels
        .map(
          (model) => Post(
            id: model.id,
            caption: model.caption,
            imageUrl: model.imageUrl,
            type: model.type,
            liked: Rx(model.liked),
            username: model.username,
          ),
        )
        .toList();
  }

  @override
  Future<void> comment({required String postId, required String comment})async {
    await remoteApi.comment(postId: postId, comment: comment);
  }

  @override
  Future<void> like({required String postId, required bool like})async {
    await remoteApi.like(postId: postId, like: like);
  }
}
