import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Notifications',
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return index == 0 || index == 3
                            ? UserNotifications(
                                image: Image.asset(
                                  AppAssets.images.user,
                                  fit: BoxFit.cover,
                                ),
                                title: 'THE WINNER TRAINS',
                                desc:
                                    'Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim',
                                time: '51 min')
                            : index == 2 || index == 6
                                ? UserNotifications(
                                    title: 'John Smith',
                                    desc:
                                        'Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim',
                                    time: 'Yesterday')
                                : UserNotifications(
                                    image: Image.asset(
                                      AppAssets.images.user,
                                      fit: BoxFit.cover,
                                    ),
                                    title: 'John Smith',
                                    desc: 'just shared a post. Stress-related',
                                    time: '2 week ago');
                      }).paddingSymmetric(horizontal: 20.w, vertical: 20.h),
                ],
              ),
            )));
  }
}

Widget UserNotifications({
  Widget? image,
  required String title,
  required String desc,
  required String time,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: 12.h),
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: CustomShadows.defaultShadow,
      border: Border.all(color: Color(0xff1213141A), width: 1.0),
      borderRadius: BorderRadius.circular(15.r),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (image != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: SizedBox(
              width: 60.w,
              height: 60.h,
              child: image,
            ),
          ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColor.lightScheme.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColor.lightScheme.onPrimary.withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 14.sp,
                  color:
                      AppColor.lightScheme.onPrimaryContainer.withOpacity(0.5),
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
