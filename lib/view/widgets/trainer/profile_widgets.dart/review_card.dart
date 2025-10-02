import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390.w,
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(
                "assets/images/Ellipse 61.png",
                width: 60.w,
                height: 60.h,
                fit: BoxFit.contain,
              ),
              title: Row(
                children: [
                  Text(
                    "John Smith",
                    style: AppTextStyle.button(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  10.horizontalSpace,
                  Text(
                    "1 day ago",
                    style: AppTextStyle.body(),
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  Text(
                    "4.8",
                    style: AppTextStyle.body(),
                  ),
                  10.horizontalSpace,
                  Image.asset(
                    "assets/images/star.png",
                    width: 16.w,
                    height: 16.h,
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    "assets/images/star.png",
                    width: 16.w,
                    height: 16.h,
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    "assets/images/star.png",
                    width: 16.w,
                    height: 16.h,
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    "assets/images/star.png",
                    width: 16.w,
                    height: 16.h,
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    "assets/images/star.png",
                    width: 16.w,
                    height: 16.h,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 350.w,
              child: Text(
                maxLines: 4,
                "Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. Nisl imperdiet donec nascetur feugiat massa vehicula elementum nullam purus morbi, sagittis et penatibus taciti vitae lobortis facilisis maecenas gravida, venenatis sed pellentesque suspendisse sociis magna class nibh volutpat. Sodales leo arcu ornare eget torquent dictumst, id morbi fringilla ultricies suscipit, nulla sapien a aliquet tempor. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. Nisl imperdiet donec nascetur feugiat massa vehicula elementum nullam purus morbi, sagittis et penatibus taciti vitae lobortis facilisis maecenas gravida, venenatis sed pellentesque suspendisse sociis magna class nibh volutpat. Sodales leo arcu ornare eget torquent dictumst, id morbi fringilla ultricies suscipit, nulla sapien a aliquet tempor. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam.",
                style: AppTextStyle.body(),
              ),
            ),
            15.verticalSpace,
          ],
        ),
      ),
    );
  }
}
