import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/resources/app_strings.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';
import 'package:winner_trains_app/utils/extensions/custom_border_radius.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/best_resilience_trainer.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/trainer_details_card.dart';
import 'package:winner_trains_app/view/user_resilience/home/feed/feed_card.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/viewModel/user_view_models/home_view_model.dart';

class HomeFragmentScreen extends StatelessWidget {
  HomeFragmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UserHomeViewModel>(context);
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.h.verticalSpace,
              Text(
                'Live Resilience Trainer',
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
              10.h.verticalSpace,
              SizedBox(
                  height: 140.h,
                  width: 390.w,
                  child: ListView.builder(
                    //padding: EdgeInsets.zero,
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Opacity(
                          opacity: 0.7,
                          child: Container(
                            width: 119.w,
                            height: 140.h,
                            margin: EdgeInsets.only(right: 10.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.2)),
                              image: DecorationImage(
                                image:
                                    AssetImage(AppAssets.images.doctor2Image),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      AppAssets.icon.videoPauseIcon,
                                      width: 30.w,
                                      height: 30.h,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Positioned(
                                    right: 5.w,
                                    top: 5.h,
                                    child: Container(
                                        width: 43.w,
                                        height: 17.h,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: context.primary,
                                                width: 0.85),
                                            color: Color(0xffE70000),
                                            borderRadius:
                                                BorderRadius.circular(24.r)),
                                        child: Row(children: [
                                          5.w.horizontalSpace,
                                          Container(
                                            width: 6.w,
                                            height: 6.h,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: context.primary,
                                            ),
                                          ),
                                          5.w.horizontalSpace,
                                          Text(
                                            'Live',
                                            style: context.bodySmall.copyWith(
                                                fontSize: 10.sp,
                                                color: context.primary),
                                          ),
                                          5.w.horizontalSpace,
                                        ])),
                                  )
                                ]),
                          ).inkWell(onTap: () {
                            Navigator.pushNamed(
                              context,
                              RoutesName.subscription,
                              arguments: {'isfromLiveSession': true},
                            );
                          }));
                    },
                  )),
              10.h.verticalSpace,
              Text(
                'Quote Of The Day',
                style: context.titleMedium
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 18.sp),
              ),
              30.h.verticalSpace,
              Stack(clipBehavior: Clip.none, children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xffE0F2F3).withOpacity(0.8),
                      borderRadius: CustomBorderRadius.medium,
                      boxShadow: CustomShadows.defaultShadow,
                      border: CustomBorder.thin(color: Color(0xffD5D1D2))),
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Text(
                      AppStrings.description,
                      style: context.bodySmall.copyWith(
                        color: Color(0xff4C5157),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: -20,
                    left: 15.w,
                    child: SvgPicture.asset(
                      AppAssets.icon.quotesIcon,
                      width: 44.w,
                      height: 44.h,
                    ))
              ]),
              10.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Resilience Trainer',
                    style: context.titleMedium
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 18.sp),
                  ),
                  Text(
                    'See All',
                    style: context.titleMedium.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        decoration: TextDecoration.underline,
                        decorationColor: context.onPrimary),
                  ).inkWell(
                      onTap: () => Navigator.pushNamed(
                          context, RoutesName.bestResilienceTrainer,arguments: TrainerRoute.fromhome))
                ],
              ),
              10.h.verticalSpace,
              SizedBox(
                  height: 123.h,
                  width: 390.w,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (c, i) => TrainerDetailsCard(
                            rightMargin: 10.w,
                            imageUrl: AppAssets.images.trainerImage,
                            name: 'Dr.Lucas Henry',
                            ratings: '4.8',
                            age: '54',
                            gender: 'Male',
                            experience: '42',
                            consultingFee: '\$100.00',
                          ))).inkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, RoutesName.trainerProfile)),
              //10.h.verticalSpace,
              SizedBox(
                width: 390.w,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: Text("Feed",
                      style: AppTextStyle.heading(
                        fontSize: 18.sp,
                      )),
                  title: SizedBox(
                    width: 331.w,
                    child: const Divider(
                      thickness: 0.2,
                      color: Color(0xffBAC4D4),
                    ),
                  ),
                ),
              ),
              //10.h.verticalSpace,
              ListView.builder(
                //  padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return index == 1
                      ? FeedCard(
                          cont: vm.c,
                          title: "Alexandar Benjamin",
                          isSavedPost: false,
                          subtitle: "Jan 11,2023",
                          profilePicUrl: AppAssets.images.person2Image,
                          videoUrl: AppAssets.images.yogaImage,
                          description: "This is a video description or review",
                          isVideo: true,
                          isOnlyDescription: false,
                          isimage: false,
                        )
                      : index == 2
                          ? FeedCard(
                              cont: vm.c,
                              isSavedPost: false,
                              title: "Dr Lucas Henry",
                              subtitle: "Jan 11,2023",
                              profilePicUrl: AppAssets.images.person2Image,
                              imageUrl: AppAssets.images.yogaImage,
                              description:
                                  "This is an image description or review",
                              isVideo: false,
                              isOnlyDescription: false,
                              isimage: true,
                            )
                          : FeedCard(
                              isSavedPost: false,
                              cont: vm.c,
                              title: "Dr Lucas Henry",
                              subtitle: "Jan 11,2023",
                              description: AppStrings.description,
                              isVideo: false,
                              isOnlyDescription: true,
                              isimage: false,
                              profilePicUrl: AppAssets.images.person2Image,
                            );
                },
              ),
            ],
          ).paddingSymmetric(horizontal: 20.w, vertical: 20.h),
        ),
      ),
    );
  }
}
