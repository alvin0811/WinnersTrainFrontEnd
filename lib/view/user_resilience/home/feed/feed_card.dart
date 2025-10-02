import 'package:flutter_svg/svg.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/custom_divider.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/home/feed/report_post_bottom_sheet.dart';
import 'package:winner_trains_app/view/user_resilience/home/feed/delete_post_bottom_sheet.dart';
import 'package:winner_trains_app/view/user_resilience/home/feed/share_content_bottomsheet.dart';
import 'package:winner_trains_app/view/widgets/custom_profile_image.dart';

class FeedCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String? imageUrl;
  final bool isSavedPost;
  final String? description;
  final bool isVideo;
  TextEditingController? cont;
  final bool isOnlyDescription;
  final String? videoUrl;
  final String profilePicUrl;
  final bool isimage;
  final int? index;
  FeedCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isSavedPost,
    this.cont,
    this.imageUrl,
    this.index,
    this.description,
    required this.isVideo,
    this.videoUrl,
    required this.profilePicUrl,
    required this.isimage,
    required this.isOnlyDescription,
  });

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  final ValueNotifier<bool> _isLiked = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isLiked.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      clipBehavior: Clip.none,
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          color: context.primary,
          boxShadow: CustomShadows.defaultShadow,
          border: Border.all(color: Color(0xff1213141A), width: 1.0),
          borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ProfilePicture(
                imageUrl: widget.profilePicUrl,
                width: 44.w,
                height: 44.h,
              ),
              20.w.horizontalSpace,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: context.onPrimary),
                        ),
                        Text(widget.subtitle,
                            style: AppTextStyle.small(color: Colors.grey)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          AppAssets.icon.horizontalIcon,
                          width: 24.w,
                          height: 24.h,
                        ).inkWell(onTap: () {
                          (widget.isVideo && !widget.isSavedPost)
                              ? deleteEditPostBottomSheet(context)
                              : reportSavePostBottomSheet(context,
                                  isSaved: widget.isSavedPost);
                        })
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          10.h.verticalSpace,
          if (widget.isimage)
            imagePost(
              imageUrl: widget.imageUrl!,
              description: widget.description!,
            ),
          if (widget.isVideo)
            videoPost(
              videoThumbnail: widget.videoUrl!,
              description: widget.description!,
              onPlay: () {
                // Navigate to video screen
              },
            ).inkWell(onTap: () {
              Navigator.pushNamed(context, RoutesName.videoReels);
            }),
          if (widget.isOnlyDescription)
            Text(
              widget.description!,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: context.onPrimaryContainer),
            ),
          10.h.verticalSpace,
          const CustomDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _isLiked.value = !_isLiked.value;
                      print("Toggled like: ${_isLiked.value}");
                    },
                    child: ValueListenableBuilder<bool>(
                      valueListenable: _isLiked,
                      builder: (context, isLiked, _) {
                        return Row(
                          children: [
                            isLiked
                                ? SvgPicture.asset(
                                    AppAssets.icon.postLikeIcon,
                                    width: 24.w,
                                    height: 24.h,
                                    color: Colors.blue,
                                  )
                                : SvgPicture.asset(
                                    AppAssets.icon.postLikeIcon,
                                    width: 24.w,
                                    height: 24.h,
                                  ),
                            SizedBox(width: 8.w),
                            Text(
                              isLiked ? "Liked" : "236 Likes",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: isLiked
                                      ? Colors.blue
                                      : context.onPrimary),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    AppAssets.icon.commentIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "36 Comments",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: context.onPrimary),
                  ),
                ],
              ).inkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, RoutesName.commentsscreen)),
              // Share Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    AppAssets.icon.shareIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "Share",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: context.onPrimary.withOpacity(0.5)),
                  ),
                ],
              ).inkWell(onTap: () {
                showModalBottomSheet(
                  backgroundColor: context.background,
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const SocialMediaBottomSheet(),
                );
              })
            ],
          ),
          10.h.verticalSpace,
          SizedBox(
            width: 365.w,
            child: TextFormField(
              controller: widget.cont ?? TextEditingController(),
              decoration: InputDecoration(
                hintText: "Add Comment...",
                hintStyle: context.bodySmall.copyWith(
                  color: const Color(0xff9BA8BB),
                ),
                contentPadding: EdgeInsets.only(
                  top: 25.h,
                  bottom: 0.h,
                  left: 10.w,
                  right: 10.w,
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset(
                    "assets/svg/Icon akar-paper-airplane.svg",
                    width: 16.w,
                    height: 15.h,
                    fit: BoxFit.contain,
                  ),
                ),
                border: InputBorder.none,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff9BA8BB),
                    width: 0.1,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff9BA8BB),
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
          20.h.verticalSpace,
        ],
      ),
    );
  }
}

Widget imagePost({required String imageUrl, required String description}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: double.infinity,
        height: 150.h,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
      5.h.verticalSpace,
      Text(
        description,
        style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColor.lightScheme.onPrimaryContainer),
      ),
    ],
  );
}

Widget videoPost({
  required String videoThumbnail,
  required String description,
  required VoidCallback onPlay,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: double.infinity,
        height: 150.h,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          image: DecorationImage(
            image: AssetImage(videoThumbnail),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
                onTap: onPlay,
                child: SvgPicture.asset(
                  AppAssets.icon.playIcon,
                  width: 45.w,
                  height: 45.h,
                )),
          ],
        ),
      ),
      5.h.verticalSpace,
      Text(
        description,
        style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColor.lightScheme.onPrimaryContainer),
      ),
    ],
  );
}
