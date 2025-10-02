import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class OngoingCard extends StatelessWidget {
  final String statusText;
  final String imagePath;
  final String title;
  final String subtitle;

  // Constructor to pass data to the widget
  const OngoingCard({
    super.key,
    required this.statusText,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    // Determine color and text based on statusText
    Color statusColor;
    String statusLabel;

    switch (statusText) {
      case 'Ongoing':
        statusColor = Colors.blue;
        statusLabel = 'Ongoing';
        break;
      case 'Ongoing':
        statusColor = Colors.blue;
        statusLabel = 'Ongoing';
        break;
      default:
        statusColor = Colors.blue;
        statusLabel = 'Unknown';
        break;
    }

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
                  color: const Color(0xff121314),
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                subtitle,
                style: AppTextStyle.body(
                  color: const Color(0xff4C5157),
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, RoutesName.ongoingappointemntdetails);
                },
                child: Container(
                  width: 82.w,
                  height: 33.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: const Color(0x310066FF), // Blue color for "Upcoming"
                    border: Border.all(width: 1, color: Colors.black12),
                  ),
                  child: Center(
                    child: Text(
                      "Ongoing", // Status text remains fixed as "Upcoming"
                      style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        color: const Color(0xff0066FF),
                        fontWeight: FontWeight.bold,
                      ), // White text on blue background
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h), // Adding some spacing
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment:
                        Alignment.bottomRight, // Align the buttons to the right
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.end, // Align buttons at the end
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RoutesName.livesessionscreen,
                            );
                          },
                          child: Container(
                            width: 280.w,
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

class OngoingCardListView extends StatelessWidget {
  const OngoingCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data for 3 ongoing cards
    List<Map<String, String>> cardData = [
      {
        'status': 'Ongoing',
        'image': 'assets/images/cardprofileimg.png',
        'title': 'Alexander Benjamin',
        'subtitle': 'Today, 07:00 PM',
      },
      {
        'status': 'Ongoing',
        'image': 'assets/images/cardprofileimg.png',
        'title': 'Session 1',
        'subtitle': 'Today, 07:00 PM',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: cardData.length, // The number of items to display
        itemBuilder: (context, index) {
          // Get data for each card
          var card = cardData[index];
          return OngoingCard(
            statusText: card['status']!,
            imagePath: card['image']!,
            title: card['title']!,
            subtitle: card['subtitle']!,
          );
        },
      ),
    );
  }
}
