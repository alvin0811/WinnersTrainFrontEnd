
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/custom_divider.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/view/user_resilience/home/feed/delete_edit_dropdown.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

class UserCommentsScreen extends StatelessWidget {
  const UserCommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(
              title: 'Comments',
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.icon.blueLike,
                        width: 24.w,
                        height: 24.h,
                      ),
                      10.w.horizontalSpace,
                      Text(
                        '236 Likes',
                        style: context.titleMedium,
                      ),
                      20.w.horizontalSpace,
                      Image.asset(
                        AppAssets.icon.greyComment,
                        width: 24.w,
                        height: 24.h,
                      ),
                      10.w.horizontalSpace,
                      Text(
                        '200 Comments',
                        style: context.titleMedium,
                      ),
                    ],
                  ),
                  10.h.verticalSpace,
                  CustomDivider(),
                  10.h.verticalSpace,
                  ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return index == 0
                            ? Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(bottom: 10.h),
                                clipBehavior: Clip.none,
                                decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    boxShadow: CustomShadows.defaultShadow,
                                    border: Border.all(
                                        color: Color(0xff1213141A), width: 1.0),
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: Column(
                                  children: [
                                    ListTile(
                                        leading: Image.asset(
                                          AppAssets.images.user1,
                                          width: 50.w,
                                          height: 50.h,
                                        ),
                                        title: Text('Alexandar Benjamin',
                                            style: context.titleMedium.copyWith(
                                                fontWeight: FontWeight.w600)),
                                        subtitle: Text('Today | 02:35 pm',
                                            style: context.titleMedium.copyWith(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400)),
                                        trailing: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 30.h),
                                            child: EditDeleteDropdown())),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15.w,
                                      ),
                                      child: Text(
                                          'Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti.',
                                          style: context.titleMedium.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 28.w, vertical: 10.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text('Reply',
                                              style: context.titleMedium
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: context
                                                          .onPrimaryContainer,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      decorationColor: context
                                                          .onPrimaryContainer,
                                                      decorationThickness: 1.5,
                                                      fontSize: 14.sp)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CustomDivider(),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30.w),
                                      child: Column(
                                        children: [
                                          ListTile(
                                              leading: Image.asset(
                                                AppAssets.images.user1,
                                                width: 50.w,
                                                height: 50.h,
                                              ),
                                              title: Text('Alexandar Benjamin',
                                                  style: context.titleMedium
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                              subtitle: Text('Today | 02:35 pm',
                                                  style: context.titleMedium
                                                      .copyWith(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                              trailing: Padding(
                                                  padding: EdgeInsets.only(
                                                    bottom: 30.h,
                                                  ),
                                                  child: EditDeleteDropdown())),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 15.w,
                                            ),
                                            child: Text(
                                                'Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti.',
                                                style: context.titleMedium
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14.sp)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 28.w,
                                                vertical: 10.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text('Reply',
                                                    style: context.titleMedium.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: context
                                                            .onPrimaryContainer,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        decorationColor: context
                                                            .onPrimaryContainer,
                                                        decorationThickness:
                                                            1.5,
                                                        fontSize: 14.sp)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(bottom: 10.h),
                                //height: 394.h,

                                clipBehavior: Clip.none,
                                decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    boxShadow: CustomShadows.defaultShadow,
                                    border: Border.all(
                                        color: Color(0xff1213141A), width: 1.0),
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: Column(
                                  children: [
                                    ListTile(
                                        leading: Image.asset(
                                          AppAssets.images.user1,
                                          width: 50.w,
                                          height: 50.h,
                                        ),
                                        title: Text('Alexandar Benjamin',
                                            style: context.titleMedium.copyWith(
                                                fontWeight: FontWeight.w600)),
                                        subtitle: Text('Today | 02:35 pm',
                                            style: context.titleMedium.copyWith(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400)),
                                        trailing: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 30.h),
                                            child: EditDeleteDropdown())),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15.w,
                                      ),
                                      child: Text(
                                          'Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti.',
                                          style: context.titleMedium.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 28.w, vertical: 10.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text('Reply',
                                              style: context.titleMedium
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: context
                                                          .onPrimaryContainer,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      decorationColor: context
                                                          .onPrimaryContainer,
                                                      decorationThickness: 1.5,
                                                      fontSize: 14.sp)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                      })
                ],
              ).paddingSymmetric(horizontal: 20.w, vertical: 20.h),
            ),
            bottomNavigationBar: TextFormField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Write a comment...",
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      28.r,
                    ),
                    borderSide: BorderSide(color: Colors.transparent)),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Icon(
                    Icons.send,
                    color: Colors.black.withOpacity(0.5),
                    size: 20,
                  ),
                ),
              ),
            ).paddingSymmetric(horizontal: 20.w, vertical: 20.h)));
  }
}
