import 'package:curd_insta/presentation/components/anim_button.dart';
import 'package:curd_insta/presentation/components/auto_play_video_item.dart';
import 'package:curd_insta/presentation/components/image_loader.dart';
import 'package:curd_insta/presentation/components/like_tile_button.dart';
import 'package:curd_insta/presentation/components/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final Function(Post post) onLikeClick;
  final Function(Post post) onCommentClick;

  const PostCard({
    super.key,
    required this.post,
    required this.onLikeClick,
    required this.onCommentClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          leading: CircleAvatar(child: Text(post.username[0])),
          title: Text(post.username),
        ),
        const SizedBox(height: 12),
        if (post.type == "image")
          ImageLoader(url: post.imageUrl, height: 400, fit: BoxFit.cover),
        if (post.type == "video") AutoPlayVideoItem(videoUrl: post.imageUrl),
        Padding(padding: EdgeInsets.all(8), child: Text(post.caption)),
        Row(
          children: [
            Expanded(
              child: Obx(() {
                return LikeTileButton(
                  isActive: post.liked.value,
                  onClick: (value) => onLikeClick(post),
                );
              }),
            ),
            Expanded(
              child: AnimButton(
                onClick: () => onCommentClick(post),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgIcon(path: "ic_comment"),
                    const SizedBox(width: 12),
                    Text("Comments"),
                  ],
                ),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
