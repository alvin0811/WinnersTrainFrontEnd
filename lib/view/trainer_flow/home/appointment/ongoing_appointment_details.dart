import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';

class OngoingAppointmentDetails extends StatelessWidget {
  const OngoingAppointmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomindex = Provider.of<TrainerMainHomeViewModel>(context);

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
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.homemain);
              bottomindex.updateIndex(2);
            },
            child: Image.asset(
              "assets/images/back.png",
              width: 40.w,
              height: 40.h,
            ),
          ),
          title: Text("Appointment Details",
              style: AppTextStyle.button(fontWeight: FontWeight.w700)),
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      children: [
                        10.verticalSpace,
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.userprofile,
                              );
                            },
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/userprofile.png",
                                fit: BoxFit.cover,
                                width: 58.w,
                                height: 58.h,
                              ),
                            ),
                          ),
                          title: Text(
                            "Alexander Benjamin",
                            style: AppTextStyle.button(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "New York, USA",
                            style: AppTextStyle.body(
                              color: const Color(0xff4C5157),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Container(
                            width: 93.w,
                            height: 33.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: const Color(
                                0x310066FF,
                              ), // Blue color for "Upcoming"
                              border: Border.all(
                                width: 1,
                                color: Colors.black12,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Ongoing",
                                style: AppTextStyle.body(
                                  color: const Color(0xff0066FF),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        30.verticalSpace,
                        appointmentupcomingdetailsrow(
                          "Date:",
                          "March 27, 2024",
                        ),
                        10.verticalSpace,
                        appointmentupcomingdetailsrow(
                          "Time:",
                          "03:00 PM  To  04:00 PM",
                        ),
                        10.verticalSpace,
                        SizedBox(
                          width: 360.w,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Consulting fee:",
                                    style: AppTextStyle.button(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text("\$100.00",
                                      style: AppTextStyle.subHeading(
                                        color: const Color(0xff0066FF),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                              10.verticalSpace,
                              Container(
                                width: 370.w,
                                height: 1.h,
                                color: const Color(0XFFDDE2E8),
                              ),
                            ],
                          ),
                        ),
                        15.verticalSpace,
                        SizedBox(
                          width: 360.w,
                          child: Text(
                            "Additional Note",
                            style: AppTextStyle.button(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        15.verticalSpace,
                        SizedBox(
                          width: 360.w,
                          child: Text(
                            maxLines: 5,
                            "Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. Nisl imperdiet donec nascetur feugiat massa vehicula elementum nullam purus morbi, sagittis et penatibus taciti vitae lobortis facilisis maecenas gravida, venenatis sed pellentesque suspendisse sociis magna class nibh volutpat. Sodales leo arcu ornare eget torquent dictumst, id morbi fringilla ultricies suscipit, nulla sapien a aliquet tempor. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. Nisl imperdiet donec nascetur feugiat massa vehicula elementum nullam purus morbi, sagittis et penatibus taciti vitae lobortis facilisis maecenas gravida, venenatis sed pellentesque suspendisse sociis magna class nibh volutpat. Sodales leo arcu ornare eget torquent dictumst, id morbi fringilla ultricies suscipit, nulla sapien a aliquet tempor. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam.",
                            style: AppTextStyle.button(
                              color: const Color(0xff4C5157),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        39.verticalSpace,
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RoutesName.livesessionscreen,
                            );
                          },
                          child: Container(
                            width: 360.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              gradient: const LinearGradient(
                                colors: [Color(0xff4C5157), Color(0xff121314)],
                              ),
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                              ), // Border color
                            ),
                            child: const Center(
                              child: Text(
                                "Join Session", // Button text
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context,
                                RoutesName.trainerappointmentreportissue);
                          },
                          child: Container(
                            width: 360.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.r),
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xff0AB2AE),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Report", // Button text remains fixed
                                style: AppTextStyle.body(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        20.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 360.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.r),
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xff0AB2AE),
                ),
              ),
              child: Center(
                child: Text(
                  "Mark as Completed", // Button text remains fixed
                  style: AppTextStyle.body(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget appointmentupcomingdetailsrow(String firstText, String secondText) {
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
