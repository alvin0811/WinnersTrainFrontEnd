import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/trainer/custom_dailog_box.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/comment_view_model.dart';
import 'package:winner_trains_app/utils/app_colors.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CommentViewModel(),
      child: Consumer<CommentViewModel>(
        builder: (context, model, child) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: const MainHomeAppBar(
                title: "Comments",
              ),
              body: Column(
                children: [
                  20.verticalSpace,
                  _buildStatsRow(),
                  20.verticalSpace,
                  SizedBox(
                    width: 390.w,
                    child: Divider(height: 1.h, color: const Color(0xffD0D8E3)),
                  ),
                  20.verticalSpace,
                  Expanded(child: _buildCommentsList(context, model)),
                  _buildSharedCommentField(context, model),
                  20.verticalSpace,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatsRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          _iconText("assets/images/Mask Group 13113.png", "236 Likes"),
          20.horizontalSpace,
          _iconText("assets/images/Mask Group 131133.png", "36 Comments"),
        ],
      ),
    );
  }

  Widget _iconText(String assetPath, String text) => Row(
        children: [
          Image.asset(assetPath, width: 24.w, height: 24.h),
          10.horizontalSpace,
          Text(
            text,
            style: AppTextStyle.button(fontWeight: FontWeight.w400),
          ),
        ],
      );

  Widget _buildCommentsList(BuildContext context, CommentViewModel model) {
    return ListView.builder(
      itemCount: model.comments.length,
      itemBuilder: (context, index) => _buildCommentCard(context, model, index),
    );
  }

  Widget _buildCommentCard(
    BuildContext context,
    CommentViewModel model,
    int index,
  ) {
    final comment = model.comments[index];
    final replyList = model.replies[index] ?? [];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Card(
        color: Colors.white,
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _commentHeader(model, index, context),
              SizedBox(height: 4.h),
              Text(
                comment,
                style: AppTextStyle.body(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    model.setReplyMode(index); // Set reply mode
                  },
                  child: Text(
                    "Reply",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 14.sp,
                      color: const Color(0xff4C5157),
                    ),
                  ),
                ),
              ),
              if (replyList.isNotEmpty) Divider(color: Colors.grey.shade300),
              ...replyList
                  .map((reply) => _buildReplyTile(context, model, index, reply))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _commentHeader(
    CommentViewModel model,
    int index,
    context,
  ) =>
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const CircleAvatar(
          backgroundImage: AssetImage("assets/images/profileimg.png"),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Racheal Rebort",
              style: AppTextStyle.button(fontWeight: FontWeight.w500),
            ),
            if (model.isUserComment[index])
              PopupMenuButton<String>(
                color: AppColors.backgroundColor,
                onSelected: (value) {
                  if (value == 'Delete Comment') {
                    showCustomDialog(
                      context: context,
                      iconPath: "assets/svg/Group 15615 (4).svg",
                      title: "Delete Comment!",
                      description: "Are you sure you want to delete\ncomment?",
                      buttonText: "Yes delete",
                      secondaryButtonText: "No",
                      onPressed: () {
                        model.deleteComment(index);
                        Navigator.pop(context);
                        print("Post Yes");
                      },
                      onPressed1: () {
                        Navigator.pop(context);
                        print("No");
                      },
                    );
                  } else if (value == 'Edit Comment') {
                    model.startEditComment(index);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'Edit Comment',
                    child: Text(
                      "Edit Comment",
                      style: AppTextStyle.body(fontWeight: FontWeight.w500),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Delete Comment',
                    child: Text(
                      "Delete Comment",
                      style: AppTextStyle.body(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
          ],
        ),
        subtitle: Text("Today | 02:35 pm",
            style: AppTextStyle.small(
              color: Colors.grey.shade600,
            )),
      );

  Widget _buildReplyTile(
    BuildContext context,
    CommentViewModel model,
    int commentIndex,
    String reply,
  ) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage("assets/images/profileimg.png"),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Racheal Rebort",
              style: AppTextStyle.body(fontWeight: FontWeight.w500),
            ),
            PopupMenuButton<String>(
              color: AppColors.backgroundColor,
              child: const Icon(Icons.more_vert),
              onSelected: (value) {
                if (value == 'Edit') {
                  model.editReply(commentIndex, reply);
                } else if (value == 'Delete') {
                  if (context.mounted) {
                    model.deleteReply(commentIndex, reply);
                  }
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                    value: 'Edit',
                    child: Text(
                      "Edit",
                      style: AppTextStyle.body(fontWeight: FontWeight.w500),
                    )),
                PopupMenuItem(
                    value: 'Delete',
                    child: Text(
                      "Delete",
                      style: AppTextStyle.body(fontWeight: FontWeight.w500),
                    )),
              ],
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Today | 02:35 pm",
                style: AppTextStyle.small(
                  color: Colors.grey.shade600,
                )),
            5.verticalSpace,
            Text(reply,
                style: AppTextStyle.body(
                  fontWeight: FontWeight.w400,
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildSharedCommentField(
    BuildContext context,
    CommentViewModel model,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: TextFormField(
        controller: model.commentController,
        style: AppTextStyle.body(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: model.editingCommentIndex != null
              ? "Edit your comment..."
              : model.isReplying
                  ? (model.isEditingReply
                      ? "Edit reply..."
                      : "Write a reply...")
                  : "Write a comment...",
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 14.h,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff12131405)),
            borderRadius: BorderRadius.circular(28.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff12131405)),
            borderRadius: BorderRadius.circular(28.r),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              if (model.editingCommentIndex != null) {
                model.updateEditedComment();
              } else if (model.isReplying) {
                model.sendReply();
              } else {
                model.addComment(model.commentController.text);
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 0,
                bottom: 0,
                right: 15,
              ),
              child: SvgPicture.asset(
                "assets/svg/Icon akar-paper-airplane.svg",
                width: 16.w,
                height: 15.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        textInputAction: TextInputAction.send,
        onFieldSubmitted: (_) {
          if (model.editingCommentIndex != null) {
            model.updateEditedComment();
          } else if (model.isReplying) {
            model.sendReply();
          } else {
            model.addComment(model.commentController.text);
          }
        },
      ),
    );
  }
}
