import 'package:flutter_svg/svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/custom_divider.dart';
import 'package:winner_trains_app/view/widgets/custom_bottomsheet.dart';

void reportSavePostBottomSheet(BuildContext context, {required bool isSaved}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return CustomBottomSheet(
        heightFactor: isSaved ? 0.35 : 0.45,
        title: 'Options',
        bodyContent: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                // Add save/unsave logic here based on `isSaved`
              },
              child: ListTile(
                leading: Image.asset(
                  isSaved
                      ? AppAssets.icon.savePostIcon
                      : AppAssets.icon.drawerBookmarkIcon,
                  width: 24.w,
                  height: 24.h,
                  color: Colors.black.withOpacity(0.7),
                ),
                title: Text(
                  isSaved ? 'Unsave Post' : 'Save Post',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: context.onPrimary,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            isSaved ? SizedBox.shrink() : CustomDivider(),
            isSaved
                ? SizedBox.shrink()
                : GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesName.userReportIssue,
                        arguments: {'color': AppColor.lightScheme.secondary},
                      );
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(
                        AppAssets.icon.reportPostIcon,
                        width: 24.w,
                        height: 24.h,
                      ),
                      title: Text(
                        'Report Post',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: context.onPrimary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
          ],
        ),
      );
    },
  );
}
