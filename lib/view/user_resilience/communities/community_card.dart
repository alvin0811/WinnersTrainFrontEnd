import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';

class CommunityCard extends StatelessWidget {
  final Widget? joinButton;

  final String communityTitle;
  final String noOfMembers;
  final String imageName;

  const CommunityCard({
    super.key,
    required this.communityTitle,
    required this.noOfMembers,
    this.joinButton,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      //  height: 187.h,
      width: 187.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: context.primary,
          border: CustomBorder.thin(color: Color(0xff1213141A)),
          boxShadow: CustomShadows.defaultShadow),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.asset(
                  width: 185.w, height: 117.h, imageName, fit: BoxFit.none)),
          Padding(
            padding: EdgeInsets.only(top: 5.h, left: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                5.h.verticalSpace,
                Text(
                  communityTitle,
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: context.onPrimary,
                      fontWeight: FontWeight.w600),
                ),
                5.h.verticalSpace,
                Text(
                  noOfMembers,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: context.onPrimaryContainer.withOpacity(0.5),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          // 10.h.verticalSpace,
          if (joinButton != null) joinButton!
        ],
      ),
    );
  }
}
