import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post_model.dart';
import '../models/user_model.dart';

class RemoteApi {
  final String baseUrl = "https://example.com/api"; // Replace with your API

  /// Fetch InstaFeed posts from API
  Future<List<PostModel>> fetchPosts({required int page}) async {
    // final response = await http.get(Uri.parse('$baseUrl/posts'));
    //
    // if (response.statusCode == 200) {
    // final List<dynamic> data = json.decode(response.body);
    await Future.delayed(const Duration(milliseconds: 1000));
    final data = [
      {
        "id": 1,
        "username": "Adi-\$page",
        "imageUrl": "https://picsum.photos/id/237/200/300",
        "type": "image",
        "caption": "Random cute dog",
        "liked": true,
      },
      {
        "id": 2,
        "username": "Sai-\$page",
        "imageUrl": "https://picsum.photos/seed/picsum/200/300",
        "type": "image",
        "caption": "Nature vibes",
        "liked": false,
      },
      {
        "id": 3,
        "username": "Subrahmanyam-\$page",
        "imageUrl":
            "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4",
        "type": "video",
        "caption": "Big Buck Bunny intro",
        "liked": true,
      },
      {
        "id": 4,
        "username": "CURD-\$page",
        "imageUrl": "https://picsum.photos/200/300/?blur",
        "type": "image",
        "caption": "Blur effect sample",
        "liked": false,
      },
      {
        "id": 5,
        "username": "C",
        "imageUrl": "https://www.w3schools.com/html/mov_bbb.mp4",
        "type": "video",
        "caption": "W3Schools demo video",
        "liked": false,
      },
      {
        "id": 6,
        "username": "U",
        "imageUrl": "https://samplelib.com/lib/preview/mp4/sample-5s.mp4",
        "type": "video",
        "caption": "Quick 5s sample",
        "liked": true,
      },
      {
        "id": 7,
        "username": "R",
        "imageUrl": "https://picsum.photos/seed/picsum/200/300",
        "type": "image",
        "caption": "Simple placeholder",
        "liked": false,
      },
      {
        "id": 8,
        "username": "D",
        "imageUrl":
            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        "type": "video",
        "caption": "Elephant’s Dream",
        "liked": true,
      },
      {
        "id": 9,
        "username": "User9",
        "imageUrl": "https://picsum.photos/id/1025/200/300",
        "type": "image",
        "caption": "Doggo photo",
        "liked": false,
      },
      {
        "id": 10,
        "username": "User10",
        "imageUrl":
            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
        "type": "video",
        "caption": "Sintel animation",
        "liked": true,
      },
      {
        "id": 11,
        "username": "User11",
        "imageUrl": "https://picsum.photos/id/1011/200/300",
        "type": "image",
        "caption": "Mountain landscape",
        "liked": false,
      },
      {
        "id": 12,
        "username": "User12",
        "imageUrl":
            "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_5mb.mp4",
        "type": "video",
        "caption": "Big Buck Bunny 5MB",
        "liked": true,
      },
      {
        "id": 13,
        "username": "User13",
        "imageUrl": "https://picsum.photos/id/1003/200/300",
        "type": "image",
        "caption": "Lake view",
        "liked": false,
      },
      {
        "id": 14,
        "username": "User14",
        "imageUrl":
            "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_2mb.mp4",
        "type": "video",
        "caption": "Big Buck Bunny 2MB",
        "liked": true,
      },
      {
        "id": 15,
        "username": "User15",
        "imageUrl": "https://picsum.photos/id/1005/200/300",
        "type": "image",
        "caption": "Bridge in forest",
        "liked": true,
      },
      {
        "id": 16,
        "username": "User16",
        "imageUrl": "https://samplelib.com/lib/preview/mp4/sample-10s.mp4",
        "type": "video",
        "caption": "10 second sample",
        "liked": false,
      },
      {
        "id": 17,
        "username": "User17",
        "imageUrl": "https://picsum.photos/id/1006/200/300",
        "type": "image",
        "caption": "River and rocks",
        "liked": false,
      },
      {
        "id": 18,
        "username": "User18",
        "imageUrl":
            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
        "type": "video",
        "caption": "Tears of Steel",
        "liked": true,
      },
      {
        "id": 19,
        "username": "User19",
        "imageUrl": "https://picsum.photos/id/1018/200/300",
        "type": "image",
        "caption": "Snow covered hills",
        "liked": true,
      },
      {
        "id": 20,
        "username": "User20",
        "imageUrl": "https://samplelib.com/lib/preview/mp4/sample-15s.mp4",
        "type": "video",
        "caption": "15 second sample",
        "liked": false,
      },
    ];

    return data.map((e) => PostModel.fromJson(e)).toList();
    // } else {
    //   throw Exception("Failed to load posts: ${response.statusCode}");
    // }
  }

  Future<void> like({required String postId, required bool like}) async {
    // final response = await http.post(Uri.parse('$baseUrl/posts/like'), body: jsonEncode({
    //   "like": like,
    //   "id": postId
    // }));
    //
    // if (response.statusCode == 200) {
    // final List<dynamic> data = json.decode(response.body);
    return;
    // } else {
    //   throw Exception("Failed to load posts: ${response.statusCode}");
    // }
  }

  /// Fetch user profile from API
  Future<UserModel> fetchUserProfile() async {
    final response = await http.get(Uri.parse('$baseUrl/profile'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception("Failed to load profile: ${response.statusCode}");
    }
  }

  Future<void> comment({
    required String postId,
    required String comment,
  }) async {
    // final response = await http.post(
    //   Uri.parse('$baseUrl/posts/comment'),
    //   body: jsonEncode({"comment": comment, "id": postId}),
    // );
    //
    // if (response.statusCode == 200) {
    // final List<dynamic> data = json.decode(response.body);
    return;
    // } else {
    //   throw Exception("Failed to load posts: ${response.statusCode}");
    // }
  }
}
