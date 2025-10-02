import 'package:flutter_svg/svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/custom_divider.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/review_card.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(
              title: 'Rating & Reviews',
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    clipBehavior: Clip.none,
                    decoration: BoxDecoration(
                        color: context.primary,
                        borderRadius: BorderRadius.circular(10.r),
                        border: CustomBorder.thin(color: context.outline),
                        boxShadow: CustomShadows.customShadow),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '4.8',
                          style: context.labelLarge.copyWith(
                              color: Color(0xff181818), fontSize: 50.sp),
                        ),
                        5.h.verticalSpace,
                        Text(
                          'Overall Rating',
                          style: context.labelLarge.copyWith(
                            color: Color(0xff181818),
                          ),
                        ),
                        16.h.verticalSpace,
                        SizedBox(
                          height: 25.74.h,
                          width: 200.w,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (c, i) => i == 4
                                  ? SvgPicture.asset(
                                      AppAssets.icon.halfIosStar,
                                      width: 25.74.w,
                                      height: 25.74.h,
                                    )
                                  : Container(
                                      margin: EdgeInsets.only(right: 10.w),
                                      child: SvgPicture.asset(
                                        AppAssets.icon.iosStar,
                                        width: 25.74.w,
                                        height: 25.74.h,
                                      ),
                                    )),
                        ),
                        10.h.verticalSpace
                      ],
                    ),
                  ),
                  10.h.verticalSpace,
                  Text(
                    'Reviews (23)',
                    style: context.titleMedium
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 18.sp),
                  ),
                  10.h.verticalSpace,
                  CustomDivider(),
                  10.h.verticalSpace,
                  SizedBox(
                    width: 390.w,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 23,
                        itemBuilder: (c, i) => ReviewCard(
                            bottomMargin: 10.h,
                            userName: 'John Smith',
                            imageUrl: AppAssets.images.person2Image,
                            ratings: '4.8',
                            reviews:
                                'Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus',
                            time: '1 day ago')),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20.w, vertical: 20.h),
            )));
  }
}
