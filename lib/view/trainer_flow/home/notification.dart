import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> notifications = [
      {
        "type": "post",
        "name": "Dr. Charlotte Lucas",
        "time": "33 min ago",
        "message": "just shared a post. Stress-related",
        "image": "assets/images/profileimg.png",
      },
      {
        "type": "post",
        "name": "Dr. Charlotte Lucas",
        "time": "33 min ago",
        "message": "just shared a post. Stress-related",
        "image": "assets/images/profileimg.png",
      },
      {
        "type": "text",
        "name": "Dr. Charlotte Lucas",
        "time": "3 days ago",
        "message":
            "Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim...",
      },
      {
        "type": "post",
        "name": "Dr. Charlotte Lucas",
        "time": "33 min ago",
        "message": "just shared a post. Stress-related",
        "image": "assets/images/profileimg.png",
      },
      {
        "type": "text",
        "name": "Dr. Charlotte Lucas",
        "time": "2 days ago",
        "message":
            "Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim...",
      },
      // Add more notifications here
    ];

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const MainHomeAppBar(
          title: "Notifications",
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(12.w),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Card(
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: notification['type'] == 'post'
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8.h),
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            leading: Image.asset(
                              notification['image'],
                              width: 67.w,
                              height: 67.h,
                              fit: BoxFit.cover,
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  notification['name'],
                                  style: AppTextStyle.button(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(notification['time'],
                                    style: AppTextStyle.small(
                                      color: const Color(0xff121314),
                                      fontWeight: FontWeight.w300,
                                    )),
                              ],
                            ),
                            subtitle: Text(
                              notification['message'],
                              style: AppTextStyle.body(
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                notification['name'],
                                style: AppTextStyle.button(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                notification['time'],
                                
                                style: AppTextStyle.small( color: const Color(0xff121314),
                                  fontWeight: FontWeight.w300,)
                                
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            notification['message'],
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                            style:
                                AppTextStyle.body(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
