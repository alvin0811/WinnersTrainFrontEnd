import 'package:flutter_svg/svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/custom_divider.dart';
import 'package:winner_trains_app/view/user_resilience/home/feed/delete_dialog_post.dart';
import 'package:winner_trains_app/view/widgets/custom_bottomsheet.dart';

void deleteEditPostBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CustomBottomSheet(
            title: 'Options',
            bodyContent: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      // Navigator.pop(context);
                      deleteDialog(context);
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(
                        AppAssets.icon.deleteIcon,
                        width: 24.w,
                        height: 24.h,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      title: Text('Delete Post',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: context.onPrimary,
                              fontWeight: FontWeight.bold)),
                    )),
                const CustomDivider(),
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesName.userEditPost,
                      );
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(
                        AppAssets.icon.editIcon,
                        width: 24.w,
                        height: 24.h,
                      ),
                      title: Text('Edit Post',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: context.onPrimary,
                              fontWeight: FontWeight.bold)),
                    )),
              ],
            ));
      });
}
