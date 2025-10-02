import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_profile_image.dart';

class UserProfileDetails extends StatelessWidget {
  const UserProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> contentPreferences = [
      "Stress-Related",
      "Depression",
      "Anxiety"
    ];
    return CustomBackground(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(title: 'Profile'),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  //height: 394.h,
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                  clipBehavior: Clip.none,
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      boxShadow: CustomShadows.defaultShadow,
                      border: Border.all(color: Color(0xff1213141A), width: 1.0),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Row(
                    children: [
                      ProfilePicture(
                        imageUrl: AppAssets.images.profilePicture,
                        width: 130.w,
                        height: 130.h,
                        borderColor: context.primary,
                      ),
                      10.w.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Alexandar Benjamin',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20.sp, color: context.onPrimary),
                          ),
                          5.h.verticalSpace,
                          Text(
                            'alexanderbenjamin@domain.com',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color:
                                    context.onPrimaryContainer.withOpacity(0.5)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                15.h.verticalSpace,
                Container(
                  width: double.infinity,
                  // height: 614.h,
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                  clipBehavior: Clip.none,
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      boxShadow: CustomShadows.defaultShadow,
                      border: Border.all(color: Color(0xff1213141A), width: 1.0),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Your info',
                              style: context.titleMedium.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 18.sp),
                            ),
                            SvgPicture.asset(AppAssets.icon.editProfileIcon)
                                .inkWell(onTap: () {
                              Navigator.pushNamed(context, RoutesName.editProfile);
                            })
                          ],
                        ),
                        20.h.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Age',
                              style: context.titleMedium
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text('26 Years',
                                style: context.titleMedium.copyWith(
                                    color: context.onPrimaryContainer
                                        .withOpacity(0.5))),
                          ],
                        ),
                        5.h.verticalSpace,
                        const Divider(
                          thickness: 1,
                          color: Color(0xffDDE2E8),
                        ),
                        5.h.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Gender',
                              style: context.titleMedium
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text('Male',
                                style: context.titleMedium
                                    .copyWith(color: Color(0xff0066FF))),
                          ],
                        ),
                        5.h.verticalSpace,
                        const Divider(
                          thickness: 1,
                          color: Color(0xffDDE2E8),
                        ),
                        8.h.verticalSpace,
                        Text(
                          'About',
                          style: context.titleMedium
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        5.h.verticalSpace,
                        Text(
                            textAlign: TextAlign.justify,
                            'Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae,.',
                            style: context.titleMedium.copyWith(
                                color:
                                    context.onPrimaryContainer.withOpacity(0.5))),
                        5.h.verticalSpace,
                        const Divider(
                          thickness: 1,
                          color: Color(0xffDDE2E8),
                        ),
                        8.h.verticalSpace,
                        Text(
                          'Content Preferences',
                          style: context.titleMedium.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 18.sp),
                        ),
                        20.h.verticalSpace,
                        Wrap(
                            spacing: 20.w,
                            runSpacing: 20.h,
                            children:
                                List.generate(contentPreferences.length, (index) {
                              String isSelected = contentPreferences[index];
            
                              return Container(
                                width: 143.w,
                                height: 44.h,
                                // padding: EdgeInsets.symmetric(
                                //     horizontal: 20.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.blue.withOpacity(0.2),
                                          blurRadius: 15.r,
                                          offset: Offset(0, 6))
                                    ],
                                    borderRadius: BorderRadius.circular(28.r),
                                    border: CustomBorder.dynamicBorder(
                                        width: 2, color: context.primary),
                                    gradient: AppColor.secondaryButton),
                                child: Center(
                                  child: Text(
                                    isSelected,
                                    style: context.titleMedium.copyWith(
                                        fontSize: 16.sp, color: context.primary),
                                  ),
                                ),
                              );
                            })),
                      ]),
                ),
              ],
            ).paddingSymmetric(horizontal: 20.w, vertical: 15.h),
          )),
    );
  }
}
