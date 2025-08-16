
import 'package:flutter/material.dart';

import 'anim_button.dart';
import 'svg_icon.dart';

class LikeButton extends StatelessWidget {
  final bool isActive;
  final Function(bool value) onClick;
  final double? size;

  const LikeButton({
    super.key,
    required this.isActive,
    required this.onClick,
    this.size = 14,
  });

  @override
  Widget build(BuildContext context) {
    return AnimButton(
      onClick: () => onClick(!isActive),
      child: Container(
        // decoration: Decorations.card.copyWith(
        //   borderRadius: BorderRadius.circular(100),
        // ),
        padding: const EdgeInsets.all(10),
        child: SvgIcon(size: size, path: isActive ? "ic_like" : "ic_like_fill"),
      ),
    );
  }
}
