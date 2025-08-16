import 'package:curd_insta/presentation/components/anim_button.dart';
import 'package:curd_insta/presentation/components/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/styles/app_colors.dart';
import '../../config/styles/font_styles.dart';
import '../components/sheet_nob.dart';

class CommentsSheetController extends GetxController {
  final commentControl = TextEditingController();
  final isLoading = false.obs;
  final error = "".obs;
}

class CommentSheet extends StatefulWidget {
  final Function(String comment) onCommentSend;

  const CommentSheet({super.key, required this.onCommentSend});

  @override
  State<CommentSheet> createState() => _CommentSheetState();
}

class _CommentSheetState extends State<CommentSheet> {
  final control = CommentsSheetController();

  @override
  void initState() {
    ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Spacer(),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26),
              topRight: Radius.circular(26),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withAlpha(20),
                offset: Offset(2, 0),
                spreadRadius: 1,
                blurRadius: 2,
              ),
            ],
          ),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SheetNob(),
              const SizedBox(height: 26),
              Text("Comments", style: FontStyles.s16Primary7),
              const SizedBox(height: 22),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 16,
                    children: List.generate(20, (index) => _commentTile(index)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: control.commentControl,
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter comment here..",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  AnimButton(
                    onClick: () =>
                        widget.onCommentSend(control.commentControl.text),
                    child: SvgIcon(path: "ic_send"),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget _commentTile(int index) {
    if (index % 3 == 0) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: CircleAvatar(child: Text("A"), radius: 20),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary25,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Some random message used to test the mock comments",
                    style: FontStyles.s14Primary706,
                  ),
                  Text("12:00 PM", textAlign: TextAlign.end, style: FontStyles.s12Grey4,)
                ],
              ),
            ),
          ),
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: CircleAvatar(child: Text("C")),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.primary25),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Some random message used to test the mock comments",
                  style: FontStyles.s14Primary706,
                ),
                Text("12:00 PM", textAlign: TextAlign.end, style: FontStyles.s12Grey4,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
