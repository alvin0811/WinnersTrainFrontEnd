import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';
import 'package:winner_trains_app/view/widgets/trainer/custom_socail_bottom_sheet.dart';
import 'package:winner_trains_app/models/saved_card_model.dart';
import 'package:winner_trains_app/view/trainer_flow/home/videos_reel.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/saved_post_view_model.dart';
import 'package:winner_trains_app/utils/app_colors.dart';

class SavedCardWidget extends StatelessWidget {
  final SavedCardModel item;
  final int index;

  const SavedCardWidget({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SavedPostViewModel>(context);

    return Card(
      color: Colors.white,
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    item.imageUrl,
                    width: 40.w,
                    height: 40.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      item.subtitle,
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: AppColors.backgroundColor,
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            gradient: AppColors.bottomsheetGradient,
                          ),
                          child: FractionallySizedBox(
                            heightFactor: 0.19.h,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: 30.h),
                                      Text("Options",
                                          style: AppTextStyle.heading()),
                                      SizedBox(height: 10.h),
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              print('Save Post tapped');
                                            },
                                            child: ListTile(
                                              leading: SvgPicture.asset(
                                                "assets/svg/savepost.svg",
                                              ),
                                              title: Text(
                                                'Unsave Post',
                                                style:  AppTextStyle.button(fontWeight: FontWeight.bold,)
                                                
                                               
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 370.w,
                                            height: 1,
                                            color: const Color(0xffE0E7F0),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {
                                          //     Navigator.pushNamed(
                                          //       context,
                                          //       RoutesName.trainerReportissue,
                                          //     );
                                          //   },
                                          //   child: ListTile(
                                          //     leading: SvgPicture.asset(
                                          //       "assets/svg/reportpost.svg",
                                          //     ),
                                          //     title: Text(
                                          //       'Report Post',
                                          //       style: AppTextStyle.button(fontWeight: FontWeight.bold)
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: -35.h,
                                  left:
                                      MediaQuery.of(context).size.width * 0.23,
                                  right:
                                      MediaQuery.of(context).size.width * 0.23,
                                  child: SvgPicture.asset(
                                    "assets/svg/Group 15364.svg",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: SvgPicture.asset("assets/svg/Mask Group 13114.svg"),
                ),
              ],
            ),
            15.verticalSpace,

            // 1. Show media (video or image)
            if (item.isVideo && !item.isImage)
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 150.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      image: DecorationImage(
                        image: AssetImage(item.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideosReel(),

                          //  VideoReelScreen(
                          //   videoUrl: item.description,
                          // ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.play_circle_fill,
                      size: 50.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            else if (item.isImage)
              Container(
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                    image: AssetImage(item.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            // 2. Description (Always show if not empty)
            if (item.description.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: Text(
                  item.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.body(),
                ),
              ),

            15.verticalSpace,
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<SavedPostViewModel>(
                  builder: (context, viewModel, child) {
                    final isLiked = viewModel.likes[index].value;
                    return GestureDetector(
                      onTap: () {
                        viewModel.toggleLike(index);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/Mask Group 13113 (5).svg",
                            color: isLiked ? Colors.blue :Color(0xff121314),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            isLiked ? "Liked" : "356 likes",
                            style: 
                            AppTextStyle.body(
                             color: isLiked ? Colors.blue : Colors.grey.shade700,)
                           
                          ),
                        ],
                      ),
                    );
                  },
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.commentsscreen);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/svg/Mask Group 13113 (3).svg"),
                      5.horizontalSpace,
                      Text(
                        "Comment",
                        style: AppTextStyle.body(color: Colors.grey.shade700,)
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: AppColors.backgroundColor,
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => const SocialMediaBottomSheet(),
                        );
                      },
                      child: SvgPicture.asset(
                          "assets/svg/Mask Group 13113 (4).svg",
                          color: Colors.black),
                      // SvgPicture.asset(
                      //   "assets/svg/Mask Group 13113 (4).svg",
                      // ),
                    ),
                    5.horizontalSpace,
                    Text(
                      "Share",
                      style:AppTextStyle.body(color: Colors.grey.shade700,)
                    
                    ),
                  ],
                ),
              ],
            ),
            15.verticalSpace,
            SizedBox(
              width: 365.w,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Add Comment...",
                  hintStyle: AppTextStyle.body(
                    color: const Color(0xff9BA8BB),
                  ),

                  contentPadding: EdgeInsets.only(
                    top: 25.h,
                    bottom: 0.h,
                    left: 10.w,
                    right: 10.w,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 15,
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
                  // Setting only bottom border and hiding others
                  border: InputBorder.none, // Hides all borders by default
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff9BA8BB), // Bottom border color
                      width: 0.1, // Light bottom line
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(
                        0xff9BA8BB,
                      ), // Bottom border color when focused
                      width: 1.5, // Slightly thicker bottom line when focused
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
