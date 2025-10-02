import 'package:flutter_svg/svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart';

class SubmitReview extends StatelessWidget {
  const SubmitReview({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Ratings & Reviews',
            ),
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 127.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                  clipBehavior: Clip.none,
                  decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      boxShadow: CustomShadows.defaultShadow,
                      border: Border.all(
                          color: const Color(0xff1213141A), width: 1.0),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Give a Rate',
                        style: context.labelLarge
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      21.h.verticalSpace,
                      SizedBox(
                        height: 25.74.h,
                        width: 175.w,
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (c, i) => i == 3 || i == 4
                                ? Container(
                                    margin: EdgeInsets.only(right: 10.w),
                                    child: SvgPicture.asset(
                                      AppAssets.icon.whiteStarIcon,
                                      width: 25.07.w,
                                      height: 24.h,
                                    ),
                                  )
                                : Container(
                                    margin: EdgeInsets.only(right: 10.w),
                                    child: SvgPicture.asset(
                                      AppAssets.icon.reviewYellowIcon,
                                      width: 25.07.w,
                                      height: 24.h,
                                    ),
                                  )),
                      ),
                    ],
                  ),
                ),
                20.h.verticalSpace,
                CustomTextfield(
                  maxLines: 6,
                  height: 183.h,
                  radius: BorderRadius.circular(15.r),
                  hintText: 'Write a Review',
                ),
                const Spacer(),
                const CustomButton(
                  text: 'Submit Review',
                ).inkWell(
                    onTap: () => Navigator.pushReplacementNamed(
                        context, RoutesName.successReview))
              ],
            ).paddingSymmetric(horizontal: 20.w, vertical: 20.h)));
  }
}
