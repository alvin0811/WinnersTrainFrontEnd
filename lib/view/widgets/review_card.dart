import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/view/widgets/custom_profile_image.dart';

class ReviewCard extends StatelessWidget {
  final String userName;
  final String ratings;
  final String imageUrl;
  final String reviews;
  final String time;
  final double? bottomMargin;
  const ReviewCard(
      {super.key,
      required this.userName,
      required this.imageUrl,
      required this.ratings,
      this.bottomMargin,
      required this.reviews,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 170.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.only(bottom: bottomMargin ?? 0),
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
          color: context.primary,
          borderRadius: BorderRadius.circular(10.r),
          border: CustomBorder.thin(color: context.outline),
          boxShadow: CustomShadows.customShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ProfilePicture(
                imageUrl: imageUrl,
                width: 60.w,
                height: 60.h,
              ),
              15.w.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(userName,
                          style: context.titleMedium
                              .copyWith(fontWeight: FontWeight.w600)),
                      6.w.horizontalSpace,
                      Text(time,
                          style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.6)))
                    ],
                  ),
                  5.h.verticalSpace,
                  Row(
                    children: [
                      Text(ratings,
                          style: context.titleMedium.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.5),
                          )),
                      6.w.horizontalSpace,
                      SizedBox(
                          height: 25.h,
                          width: 130.w,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 6.w),
                                child: Icon(
                                  index == 4 ? Icons.star_half : Icons.star,
                                  color: Colors.amber, // yellow color
                                  size: 22.h,
                                ),
                              );
                            },
                          ))
                    ],
                  ),
                ],
              )
            ],
          ),
          10.h.verticalSpace,
          Text(
            reviews,
            style: context.titleMedium.copyWith(
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
