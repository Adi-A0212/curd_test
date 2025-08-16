import 'package:get/get.dart';

class Post {
  final int id;
  final String username;
  final String imageUrl;
  final String type;
  Rx<bool> liked;
  final String caption;

  Post({
    required this.id,
    required this.username,
    required this.imageUrl,
    required this.type,
    required this.liked,
    required this.caption,
  });
}
