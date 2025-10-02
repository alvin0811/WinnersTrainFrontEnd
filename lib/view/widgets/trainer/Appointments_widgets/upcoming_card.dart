import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class UpcomingCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const UpcomingCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390.w,
      child: Card(
        clipBehavior: Clip.none,
        elevation: 5,
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.userprofile);
                },
                child: ClipOval(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: 58.w,
                    height: 58.h,
                  ),
                ),
              ),
              title: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.roboto(
                  fontSize: 15.sp,
                  color: Color(0xff121314),
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                subtitle,
                style: AppTextStyle.body(
                  color: Color(0xff4C5157),
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.upcomingappointmentdetails,
                  );
                },
                child: Container(
                  width: 93.w,
                  height: 33.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: Color(0x310066FF),
                    border: Border.all(width: 1, color: Colors.black12),
                  ),
                  child: Center(
                    child: Text(
                      "Upcoming",
                      style: AppTextStyle.body(
                        color: Color(0xff0066FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RoutesName.cancelbookingreason,
                            );
                          },
                          child: Container(
                            width: 285.w,
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
                                "Cancel Booking",
                                style: AppTextStyle.body(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            15.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class UpcomingCardListView extends StatelessWidget {
  const UpcomingCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data for the Upcoming cards
    List<Map<String, String>> cardData = [
      {
        'image': 'assets/images/cardprofileimg.png', // Image path
        'title': 'Alexander Benjamin',
        'subtitle': 'Today, 07:00 PM',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: 390.w,
        child: ListView.builder(
          itemCount: cardData.length, // The number of items to display
          itemBuilder: (context, index) {
            var card = cardData[index]; // Get data for each card
            return UpcomingCard(
              imagePath: card['image']!,
              title: card['title']!,
              subtitle: card['subtitle']!,
            );
          },
        ),
      ),
    );
  }
}
