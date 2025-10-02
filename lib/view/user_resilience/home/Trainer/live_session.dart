import 'package:flutter_svg/svg.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/custom_divider.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/dialog_end_live_session.dart';

import 'package:winner_trains_app/view/widgets/custom_textfield.dart';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';

class LiveSession extends StatelessWidget {
  const LiveSession({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> profileData = [
      {
        "name": "John Smith",
        "subtitle": "Sit amet consectetur adipiscing elit odio,",
        "imagePath": AppAssets.images.user1
      },
      {
        "name": "Hendry Roy",
        "subtitle": "Lorem ipsum dolor sit amet consectetur adipiscing",
        "imagePath": AppAssets.images.user2
      },
      {
        "name": "Alexander Benjamin",
        "subtitle": "Lorem ipsum dolor sit",
        "imagePath": AppAssets.images.user3,
      },
      {
        "name": "Alexander Benjamin",
        "subtitle": "Lorem ipsum dolor sit",
        "imagePath": AppAssets.images.user4,
      },
    ];
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Opacity(
        opacity: 0.9,
        child: Container(
          width: double.infinity,
          height: 930.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.images.livePicture),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              25.verticalSpace,
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 30.h),
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, RoutesName.homemain);
                            //   bottomindex.updateIndex(3);
                          },
                          child: Container(
                            width: 60.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    AssetImage(AppAssets.images.person2Image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5.w,
                          top: 50.h,
                          child: Container(
                              width: 43.w,
                              height: 17.h,
                              decoration: BoxDecoration(
                                  color: Color(0xffE70000),
                                  borderRadius: BorderRadius.circular(24.r)),
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
                                    color: context.primary,
                                  ),
                                ),
                                5.w.horizontalSpace,
                              ])),
                        )
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dr. Evelyn Charlie",
                            style: GoogleFonts.roboto(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Opacity(
                            opacity: 0.75,
                            child: Container(
                              width: 73.w,
                              height: 29.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.r),
                                color: Color(0xffE7ECF2),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.icon.eyeIcon,
                                      width: 20.w,
                                      height: 20.h,
                                      fit: BoxFit.cover,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "4271",
                                      style: GoogleFonts.roboto(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              leaveLiveSessionDialog(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: SvgPicture.asset(
                                AppAssets.icon.crossIcon,
                                width: 20.w,
                                height: 20.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: ListView.builder(
                    itemCount: profileData.length,
                    itemBuilder: (context, index) {
                      final item = profileData[index];
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 330.w,
                                child: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: CircleAvatar(
                                      radius: 28.r,
                                      backgroundImage:
                                          AssetImage(item['imagePath']!),
                                    ),
                                    title: Text(
                                      item['name']!,
                                      style: AppTextStyle.button(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(item['subtitle']!,
                                        style: AppTextStyle.body(
                                          color: Colors.white70,
                                        )))),
                            CustomDivider(
                              color: context.primary.withOpacity(0.3),
                            )
                          ]);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: CustomInputWidget(
                  Header: "",
                  hint: "Write a comment...",
                  suffixIconPath: "assets/svg/Icon akar-paper-airplane (1).svg",
                  label: "",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget ProfileListItem(
    BuildContext context, String title, String subtitle, String leading) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    SizedBox(
        width: 330.w,
        child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 28.r,
              backgroundImage: AssetImage(leading),
            ),
            title: Text(title,
                style: AppTextStyle.button(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text(subtitle,
                style: AppTextStyle.body(
                  color: Colors.white70,
                ))))
  ]);
}
