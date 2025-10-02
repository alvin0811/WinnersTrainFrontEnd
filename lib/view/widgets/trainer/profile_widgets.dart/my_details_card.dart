import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';

class MyDetailsCard extends StatelessWidget {
  const MyDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Column(
        children: [
          10.verticalSpace,
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 108.w,
                  height: 123.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/images/Rectangle 1141.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text("Dr. Charlotte Lucas",
                                style: AppTextStyle.button(
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/star.png",
                                  width: 16.w,
                                  height: 16.h,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "4.8",
                                  style: AppTextStyle.body(
                                    color: const Color(0xff4C5157),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Text(
                        "36, Male",
                        style: AppTextStyle.body(),
                      ),
                      10.verticalSpace,
                      Text(
                        "Psychologists",
                        style: AppTextStyle.body(),
                      ),
                      10.verticalSpace,
                      Row(
                        children: [
                          Text(
                            "Consulting fee:",
                            style: AppTextStyle.body(),
                          ),
                          3.horizontalSpace,
                          Text("\$100.00",
                              style: AppTextStyle.button(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff0066FF),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                16.verticalSpace,
              ],
            ),
          ),
          Container(
            width: 370.w,
            height: 77.h,
            decoration: BoxDecoration(
              color: const Color(0xffE7ECF2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    profilerowwidget("23", "Reviews"),
                    SizedBox(
                      height: 33.h, // Set the height here
                      child: VerticalDivider(
                        color: const Color(0xff4C5157),
                        thickness: 1,
                        width: 20.w,
                      ),
                    ),
                    profilerowwidget("70+", "Patients"),
                    SizedBox(
                      height: 33.h,
                      child: VerticalDivider(
                        color: const Color(0xff4C5157),
                        thickness: 1,
                        width: 20.w,
                      ),
                    ),
                    profilerowwidget("12+", "Years exp."),
                  ],
                ),
              ),
            ),
          ),
          16.verticalSpace,
          SizedBox(
            width: 370.w,
            child: Text(
              "Bio & Specialization",
              style: AppTextStyle.button(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          16.verticalSpace,
          SizedBox(
            width: 370.w,
            child: Text(
              maxLines: 4,
              "Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. Nisl imperdiet donec nascetur feugiat massa vehicula elementum nullam purus morbi, sagittis et penatibus taciti vitae lobortis facilisis maecenas gravida, venenatis sed pellentesque suspendisse sociis magna class nibh volutpat. Sodales leo arcu ornare eget torquent dictumst, id morbi fringilla ultricies suscipit, nulla sapien a aliquet tempor. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. Nisl imperdiet donec nascetur feugiat massa vehicula elementum nullam purus morbi, sagittis et penatibus taciti vitae lobortis facilisis maecenas gravida, venenatis sed pellentesque suspendisse sociis magna class nibh volutpat. Sodales leo arcu ornare eget torquent dictumst, id morbi fringilla ultricies suscipit, nulla sapien a aliquet tempor. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam.",
              style: AppTextStyle.body(fontWeight: FontWeight.w500),
            ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}

profilerowwidget(final String firsttext, final String secounfterxt) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firsttext,
            style: AppTextStyle.heading(
              color: const Color(0xff008B88),
            )),
        4.verticalSpace,
        Text(
          secounfterxt,
          style: AppTextStyle.button(
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    ),
  );
}
