class UserModel {
  final int id;
  final String username;
  final String profileImageUrl;
  final String bio;

  UserModel({
    required this.id,
    required this.username,
    required this.profileImageUrl,
    required this.bio,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    username: json['username'],
    profileImageUrl: json['profileImageUrl'],
    bio: json['bio'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'username': username,
    'profileImageUrl': profileImageUrl,
    'bio': bio,
  };
}
