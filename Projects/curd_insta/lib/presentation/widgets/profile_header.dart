import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';

class ProfileHeader extends StatelessWidget {
  final User user;

  ProfileHeader({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(user.profileImageUrl),
        ),
        SizedBox(height: 8),
        Text(user.username, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text(user.bio, textAlign: TextAlign.center),
      ],
    );
  }
}
