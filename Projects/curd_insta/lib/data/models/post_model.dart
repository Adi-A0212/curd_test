class PostModel {
  final int id;
  final String username;
  final String imageUrl;
  final String type;
  final bool liked;
  final String caption;

  PostModel({
    required this.id,
    required this.username,
    required this.imageUrl,
    required this.type,
    required this.liked,
    required this.caption,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    id: json['id'],
    username: json['username'],
    imageUrl: json['imageUrl'],
    type: json['type'],
    liked: json['liked'],
    caption: json['caption'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'username': username,
    'imageUrl': imageUrl,
    'type': type,
    'liked': liked,
    'caption': caption,
  };
}
