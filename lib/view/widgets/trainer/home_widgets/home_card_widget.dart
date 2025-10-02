import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/trainer/custom_socail_bottom_sheet.dart';
import 'package:winner_trains_app/view/widgets/trainer/custom_dailog_box.dart';
import 'package:winner_trains_app/models/home_card_model.dart';
import 'package:winner_trains_app/view/trainer_flow/home/videos_reel.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/home_card_view_model.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';
import 'package:winner_trains_app/utils/app_colors.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

// class HomeCard extends StatelessWidget {
//   final HomeCardModel item;
//   final int index;

//   const HomeCard({super.key, required this.item, required this.index});

//   @override
//   Widget build(BuildContext context) {
//     final bottomindex = Provider.of<TrainerMainHomeViewModel>(context);
//     return Card(
//       clipBehavior: Clip.none,
//       color: Colors.white,
//       elevation: 5,
//       child: Column(
//         children: [
//           ListTile(
//             leading: item.isMyPost
//                 ? GestureDetector(onTap: () {
//                  Navigator.pushNamed(context, RoutesName.homemain);
//                       bottomindex.updateIndex(3);
//                 },
//                   child: ClipOval(
//                       child: Image.asset(
//                         item.proimageUrl,
//                         fit: BoxFit.cover,
//                         width: 40.w,
//                         height: 40.h,
//                       ),
//                     ),
//                 )
//                 : GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, RoutesName.userprofile);
//                     },
//                     child: ClipOval(
//                       child: Image.asset(
//                         item.proimageUrl,
//                         fit: BoxFit.cover,
//                         width: 40.w,
//                         height: 40.h,
//                       ),
//                     ),
//                   ),
//             title: Text(
//               item.title,
//               style: TextStyle(
//                 fontSize: 16.sp,
//                 color: const Color(0xff121314),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             subtitle: Text(
//               item.subtitle,
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 color: const Color(0xff121314),
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//             trailing: GestureDetector(
//               onTap: () {
//                 showModalBottomSheet(
//                   backgroundColor: AppColors.backgroundColor,
//                   context: context,
//                   isScrollControlled: true,
//                   builder: (context) {
//                     return Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.r),
//                         gradient: AppColors.bottomsheetGradient,
//                       ),
//                       child: FractionallySizedBox(
//                         heightFactor: 0.25.h,
//                         child: Stack(
//                           clipBehavior: Clip.none,
//                           children: [
//                             SingleChildScrollView(
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   SizedBox(height: 30.h),
//                                   Text(
//                                     "Options",
//                                     style: TextStyle(
//                                       fontSize: 20.sp,
//                                       fontWeight: FontWeight.bold,
//                                       color: const Color(0xff000000),
//                                     ),
//                                   ),
//                                   SizedBox(height: 10.h),
//                                   item.isMyPost
//                                       ? Column(
//                                           children: [
//                                             GestureDetector(
//                                               onTap: () {
//                                                 print('Edit Post tapped');
//                                                 Navigator.pop(context);
//                                                 Navigator.pushNamed(
//                                                   context,
//                                                   RoutesName.editpost,
//                                                 );
//                                               },
//                                               child: ListTile(
//                                                 leading: SvgPicture.asset(
//                                                   "assets/svg/editpost.svg", // Make sure this asset exists
//                                                 ),
//                                                 title: Text(
//                                                   'Edit Post',
//                                                   style: TextStyle(
//                                                     fontSize: 16.sp,
//                                                     color:
//                                                         const Color(0xff121314),
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             Container(
//                                               width: 370.w,
//                                               height: 1,
//                                               color: const Color(0xffE0E7F0),
//                                             ),
//                                             GestureDetector(
//                                               onTap: () {
//                                                 showCustomDialog(
//                                                   context: context,
//                                                   iconPath:
//                                                       "assets/svg/Group 15615 (4).svg",
//                                                   title: "Delete!",
//                                                   description:
//                                                       "Are you sure you want to delete \nthis post?",
//                                                   buttonText: "No",
//                                                   secondaryButtonText:
//                                                       "Yes, Delete",
//                                                   onPressed: () {
//                                                     Navigator.pop(context);
//                                                     Navigator.pop(context);
//                                                     print("Post Deleted");
//                                                   },
//                                                   onPressed1: () {
//                                                     Navigator.pop(context);
//                                                     Navigator.pop(context);
//                                                     print("Cancelled");
//                                                   },
//                                                 );
//                                               },
//                                               child: ListTile(
//                                                 leading: SvgPicture.asset(
//                                                     "assets/svg/Mask Group 13115 (5).svg"),
//                                                 title: Text(
//                                                   'Delete Post',
//                                                   style: TextStyle(
//                                                     fontSize: 16.sp,
//                                                     color:
//                                                         const Color(0xff121314),
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         )
//                                       : Column(
//                                           children: [
//                                             GestureDetector(
//                                               onTap: () {
//                                                 Navigator.pop(context);
//                                                 print('Save Post tapped');
//                                               },
//                                               child: ListTile(
//                                                 leading: SvgPicture.asset(
//                                                   "assets/svg/savepost.svg",
//                                                 ),
//                                                 title: Text(
//                                                   'Save Post',
//                                                   style: TextStyle(
//                                                     fontSize: 16.sp,
//                                                     color:
//                                                         const Color(0xff121314),
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             Container(
//                                               width: 370.w,
//                                               height: 1,
//                                               color: const Color(0xffE0E7F0),
//                                             ),
//                                             GestureDetector(
//                                               onTap: () {
//                                                 Navigator.pushNamed(
//                                                   context,
//                                                   RoutesName.trainerReportissue,
//                                                 );
//                                               },
//                                               child: ListTile(
//                                                 leading: SvgPicture.asset(
//                                                   "assets/svg/reportpost.svg",
//                                                 ),
//                                                 title: Text(
//                                                   'Report Post',
//                                                   style: TextStyle(
//                                                     fontSize: 16.sp,
//                                                     color:
//                                                         const Color(0xff121314),
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                 ],
//                               ),
//                             ),
//                             Positioned(
//                               top: -35.h,
//                               left: MediaQuery.of(context).size.width * 0.23,
//                               right: MediaQuery.of(context).size.width * 0.23,
//                               child: SvgPicture.asset(
//                                 "assets/svg/Group 15364.svg",
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//               child: SvgPicture.asset("assets/svg/Mask Group 13114.svg"),
//             ),
//           ),
//           10.verticalSpace,
//           if (item.isVideo && !item.isImage)
//             Column(
//               children: [
//                 Opacity(
//                   opacity: 0.90,
//                   child: Container(
//                     width: 370.w,
//                     height: 178.h,
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15.r),
//                       image: DecorationImage(
//                         image: AssetImage(item.imageUrl),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const VideosReel(),

//                                 //  VideoReelScreen(
//                                 //   videoUrl: item.description,
//                                 // ),
//                               ),
//                             );
//                           },
//                           child: const Icon(
//                             Icons.play_arrow,
//                             size: 50,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 20.verticalSpace,
//                 SizedBox(
//                   width: 370.w,
//                   child: Text(
//                     item.description,
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       color: const Color(0xff4C5157),
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           else if (item.isImage)
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         FullScreenImageView(imageUrl: item.imageUrl),
//                   ),
//                 );
//               },
//               child: Opacity(
//                 opacity: 0.90,
//                 child: Container(
//                   width: 370.w,
//                   height: 150.h,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15.r),
//                     image: DecorationImage(
//                       image: AssetImage(item.imageUrl),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           else
//             SizedBox(
//               width: 330.w,
//               child: Text(item.description, style: TextStyle(fontSize: 14.sp)),
//             ),
//           20.verticalSpace,
//           Container(width: 370.w, height: 1.h, color: Colors.grey),
//           20.verticalSpace,
//           FractionallySizedBox(
//             alignment: Alignment.center,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 15.w),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                     width: 100.w,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Consumer<HomeCardViewModel>(
//                           builder: (context, viewModel, child) {
//                             final isLiked = viewModel.likes[index].value;
//                             return GestureDetector(
//                               onTap: () {
//                                 viewModel.toggleLike(index);
//                               },
//                               child: Row(
//                                 children: [
//                                   SvgPicture.asset(
//                                     "assets/svg/Mask Group 13113 (5).svg",
//                                     color: isLiked ? Colors.blue : Colors.black,
//                                   ),
//                                   8.horizontalSpace,
//                                   Text(
//                                     isLiked ? "Liked" : "356 likes",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 13.sp,
//                                       color:
//                                           isLiked ? Colors.blue : Colors.black,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, RoutesName.commentsscreen);
//                     },
//                     child: SizedBox(
//                       width: 116.w,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           SvgPicture.asset(
//                             "assets/svg/Mask Group 13113 (3).svg",
//                           ),
//                           8.horizontalSpace,
//                           Text(
//                             "36 Comments",
//                             style: TextStyle(
//                               fontSize: 13.sp,
//                               color: const Color(0xff48576E),
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           showModalBottomSheet(
//                             backgroundColor: AppColors.backgroundColor,
//                             context: context,
//                             isScrollControlled: true,
//                             builder: (context) =>
//                                 const SocialMediaBottomSheet(),
//                           );
//                         },
//                         child: SvgPicture.asset(
//                           "assets/svg/Mask Group 13113 (4).svg",
//                           color: Colors.black,
//                         ),
//                       ),
//                       8.horizontalSpace,
//                       Text(
//                         "Share",
//                         style: TextStyle(
//                           fontSize: 13.sp,
//                           color: const Color(0xff48576E),
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Consumer<HomeCardViewModel>(
//                           builder: (context, viewModel, child) {
//                             final isLiked = viewModel.likes[index].value;
//                             return GestureDetector(
//                               onTap: () {
//                                 viewModel.toggleLike(index);
//                               },
//                               child: Row(
//                                 children: [
//                                   SvgPicture.asset(
//                                     "assets/svg/Mask Group 13113 (5).svg",
//                                     color: isLiked ? Colors.blue : Colors.black,
//                                   ),
//                                   8.horizontalSpace,
//                                   Text(
//                                     isLiked ? "Liked" : "356 likes",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 13.sp,
//                                       color:
//                                           isLiked ? Colors.blue : Colors.black,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pushNamed(context, RoutesName.commentsscreen);
//                   },
//                   child: Row(
//                     children: [
//                       SvgPicture.asset("assets/svg/Mask Group 13113 (3).svg"),
//                       5.horizontalSpace,
//                       Text(
//                         "Comments",
//                         style: TextStyle(
//                           color: Colors.grey.shade700,
//                           fontSize: 13.sp,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         showModalBottomSheet(
//                           backgroundColor: AppColors.backgroundColor,
//                           context: context,
//                           isScrollControlled: true,
//                           builder: (context) => const SocialMediaBottomSheet(),
//                         );
//                       },
//                       child: SvgPicture.asset(
//                         "assets/svg/Mask Group 13113 (4).svg",
//                       ),
//                     ),
//                     5.horizontalSpace,
//                     Text(
//                       "Share",
//                       style: TextStyle(
//                         color: Colors.grey.shade700,
//                         fontSize: 13.sp,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           SizedBox(
//             width: 365.w,
//             child: TextFormField(
//               textCapitalization: TextCapitalization.words,
//               decoration: InputDecoration(
//                 hintText: "Add Comment...",
//                 hintStyle: TextStyle(
//                   color: const Color(0xff9BA8BB),
//                   fontSize: 14.sp,
//                 ),
//                 contentPadding: EdgeInsets.only(
//                   top: 25.h,
//                   bottom: 0.h,
//                   left: 10.w,
//                   right: 10.w,
//                 ),
//                 suffixIcon: Padding(
//                   padding: const EdgeInsets.only(
//                     left: 15,
//                     top: 15,
//                     bottom: 0,
//                     right: 15,
//                   ),
//                   child: SvgPicture.asset(
//                     "assets/svg/Icon akar-paper-airplane.svg",
//                     width: 16.w,
//                     height: 15.h,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 border: InputBorder.none,
//                 enabledBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color(0xff9BA8BB),
//                     width: 0.1,
//                   ),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: const Color(
//                       0xff9BA8BB,
//                     ),
//                     width: 1.5.w,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           20.verticalSpace,
//         ],
//       ),
//     );
//   }
// }

class FullScreenImageView extends StatelessWidget {
  final String imageUrl;

  const FullScreenImageView({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: InteractiveViewer(
                panEnabled: true,
                minScale: 1,
                maxScale: 4,
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.cancel,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final HomeCardModel item;
  final int index;

  const HomeCard({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    final bottomindex = Provider.of<TrainerMainHomeViewModel>(context);
    final viewModel = Provider.of<HomeCardViewModel>(context);

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
            /// Profile Header
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (item.isMyPost) {
                      Navigator.pushNamed(context, RoutesName.homemain);
                      bottomindex.updateIndex(3);
                    } else {
                      Navigator.pushNamed(context, RoutesName.userprofile);
                    }
                  },
                  child: ClipOval(
                    child: Image.asset(
                      item.proimageUrl,
                      width: 40.w,
                      height: 40.h,
                      fit: BoxFit.cover,
                    ),
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
                    Text(item.subtitle,
                        style: AppTextStyle.small(color: Colors.grey)),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    showPostOptions(context, item);
                  },
                  child: SvgPicture.asset("assets/svg/Mask Group 13114.svg"),
                ),
              ],
            ),

            15.verticalSpace,

            /// Media Section
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FullScreenImageView(imageUrl: item.imageUrl),
                    ),
                  );
                },
                child: Container(
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
              ),

            /// Description
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
                Consumer<HomeCardViewModel>(
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
                            color: isLiked ? Colors.blue : Colors.black,
                          ),
                          SizedBox(width: 8.w),
                          Text(isLiked ? "Liked" : "356 likes",
                              style: AppTextStyle.body(
                                color: isLiked ? Colors.blue : Colors.black,
                              )),
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
                      Text("Comments",
                          style: AppTextStyle.body(
                            color: Colors.grey.shade700,
                          )),
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
                    ),
                    5.horizontalSpace,
                    Text("Share",
                        style: AppTextStyle.body(
                          color: Colors.grey.shade700,
                        )),
                  ],
                ),
              ],
            ),

            15.verticalSpace,

            /// Comment Text Field
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
          ],
        ),
      ),
    );
  }

  void showPostOptions(BuildContext context, HomeCardModel item) {
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
            heightFactor: 0.25.h,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 30.h),
                      Text("Options", style: AppTextStyle.heading()),
                      SizedBox(height: 10.h),
                      item.isMyPost
                          ? Column(
                              children: [
                                buildOptionTile(
                                  context,
                                  "assets/svg/editpost.svg",
                                  "Edit Post",
                                  () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(
                                        context, RoutesName.editpost);
                                  },
                                ),
                                Divider(color: const Color(0xffE0E7F0)),
                                buildOptionTile(
                                  context,
                                  "assets/svg/Mask Group 13115 (5).svg",
                                  "Delete Post",
                                  () {
                                    showCustomDialog(
                                      context: context,
                                      iconPath:
                                          "assets/svg/Group 15615 (4).svg",
                                      title: "Delete!",
                                      description:
                                          "Are you sure you want to delete \nthis post?",
                                      buttonText: "No",
                                      secondaryButtonText: "Yes, Delete",
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        print("Post Deleted");
                                      },
                                      onPressed1: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        print("Cancelled");
                                      },
                                    );
                                  },
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                buildOptionTile(
                                  context,
                                  "assets/svg/savepost.svg",
                                  "Save Post",
                                  () => Navigator.pop(context),
                                ),
                                Divider(color: const Color(0xffE0E7F0)),
                                buildOptionTile(
                                  context,
                                  "assets/svg/reportpost.svg",
                                  "Report Post",
                                  () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(
                                        context, RoutesName.trainerReportissue);
                                  },
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
                Positioned(
                  top: -35.h,
                  left: MediaQuery.of(context).size.width * 0.23,
                  right: MediaQuery.of(context).size.width * 0.23,
                  child: SvgPicture.asset("assets/svg/Group 15364.svg"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildOptionTile(
      BuildContext context, String iconPath, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: SvgPicture.asset(iconPath),
        title: Text(title,
            style: AppTextStyle.button(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
