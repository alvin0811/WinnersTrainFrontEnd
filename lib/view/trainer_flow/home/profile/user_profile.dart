import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/trainer/custom_dailog_box.dart';
import 'package:winner_trains_app/utils/app_colors.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              "assets/images/back.png",
              width: 40.w,
              height: 40.h,
            ),
          ),
          title: Text(
            "Profile",
            style: AppTextStyle.button(
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: AppColors.backgroundColor,
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.r),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.r),
                        ),
                        gradient: AppColors.bottomsheetGradient,
                      ),
                      child: FractionallySizedBox(
                        heightFactor:
                            0.3, // Use 0.25 or 0.3, not .h (no media query here)
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 40.h),
                                  Text("Options",
                                      style: AppTextStyle.heading()),
                                  SizedBox(height: 10.h),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          print('Edit Post tapped');
                                          showCustomDialog(
                                            iconPath:
                                                "assets/svg/Group 15615 (3).svg",
                                            context: context,
                                            title: "Block User!",
                                            description:
                                                "Are you sure you want to block \nthis user?",
                                            buttonText: "No",
                                            secondaryButtonText: "Yes, Block",
                                            onPressed: () {
                                              Navigator.pop(context);
                                              print("Post Deleted");
                                            },
                                            onPressed1: () {
                                              Navigator.pushNamed(
                                                context,
                                                RoutesName.userprofile,
                                              );
                                            },
                                          );
                                        },
                                        child: ListTile(
                                          leading: SvgPicture.asset(
                                            "assets/svg/Mask Group 19.svg",
                                          ),
                                          title: Text(
                                            'Block User',
                                            style: AppTextStyle.button(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        color: const Color(0xffE0E7F0),
                                        thickness: 1,
                                        indent: 15.w,
                                        endIndent: 15.w,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            RoutesName.trainerReportissue,
                                          );
                                        },
                                        child: ListTile(
                                          leading: SvgPicture.asset(
                                            "assets/svg/Mask Group 13115 (3).svg",
                                          ),
                                          title: Text(
                                            'Report User',
                                            style: AppTextStyle.button(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Positioned Top Icon
                            Positioned(
                              top: -35.h,
                              left: MediaQuery.of(context).size.width * 0.23,
                              right: MediaQuery.of(context).size.width * 0.23,
                              child: SvgPicture.asset(
                                "assets/svg/Group 15364.svg",
                                height: 50.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: SvgPicture.asset("assets/svg/Group 16205.svg"),
            ),
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                width: 390.w,
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  child: ListTile(
                    leading: Image.asset(
                      "assets/images/userprofile.png",
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.contain,
                    ),
                    title: Text("Alexander Benjamin",
                        style: AppTextStyle.subHeading(
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: Text(
                      "alexander.benjamin@domain.com",
                      style: AppTextStyle.body(
                        color: const Color(0xff4C5157),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              12.verticalSpace,
              SizedBox(
                width: 390.w,
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Column(
                    children: [
                      30.verticalSpace,
                      SizedBox(
                        width: 360.w,
                        child: Text("Your Info",
                            style: AppTextStyle.subHeading(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      29.verticalSpace,
                      userProfileInfoRow("Age:", "26 Years"),
                      10.verticalSpace,
                      userProfileInfoRow("Gender:", "Male"),
                      10.verticalSpace,
                      SizedBox(
                        width: 360.w,
                        child: Text(
                          "About",
                          style: AppTextStyle.button(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      10.verticalSpace,
                      SizedBox(
                        width: 360.w,
                        child: Text(
                          maxLines: 4,
                          "Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. Nisl imperdiet donec nascetur feugiat massa vehicula elementum nullam purus morbi, sagittis et penatibus taciti vitae lobortis facilisis maecenas gravida, venenatis sed pellentesque suspendisse sociis magna class nibh volutpat. Sodales leo arcu ornare eget torquent dictumst, id morbi fringilla ultricies suscipit, nulla sapien a aliquet tempor. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. Nisl imperdiet donec nascetur feugiat massa vehicula elementum nullam purus morbi, sagittis et penatibus taciti vitae lobortis facilisis maecenas gravida, venenatis sed pellentesque suspendisse sociis magna class nibh volutpat. Sodales leo arcu ornare eget torquent dictumst, id morbi fringilla ultricies suscipit, nulla sapien a aliquet tempor. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam.",
                          style: AppTextStyle.button(
                            color: const Color(0xff4C5157),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      10.verticalSpace,
                      Container(
                        width: 370.w,
                        height: 1.h,
                        color: const Color(0XFFDDE2E8),
                      ),
                      15.verticalSpace,
                      SizedBox(
                        width: 360.w,
                        child: Text(
                          "Content Preferences",
                          style: AppTextStyle.button(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      25.verticalSpace,
                      const TagChipsWrap(
                        tags: [
                          "Stress-Related",
                          "Depression",
                          "Anxiety",
                          "Irritation",
                        ],
                      ),
                      20.verticalSpace,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget userProfileInfoRow(String firstText, String secondText) {
  return SizedBox(
    width: 360.w,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              firstText,
              style: AppTextStyle.button(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              secondText,
              style: AppTextStyle.button(
                color: const Color(0xff4C5157),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        10.verticalSpace,
        Container(width: 370.w, height: 1.h, color: const Color(0XFFDDE2E8)),
      ],
    ),
  );
}

class TagChipsWrap extends StatelessWidget {
  final List<String> tags;

  const TagChipsWrap({Key? key, required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      child: Wrap(
        spacing: 10.w,
        runSpacing: 10.h,
        children: tags.map((tag) {
          return Opacity(
            opacity: 0.9,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.r),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffE2CFCF), Color(0xff008B88)],
                ),
              ),
              child: Text(
                tag,
                style: AppTextStyle.body(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
