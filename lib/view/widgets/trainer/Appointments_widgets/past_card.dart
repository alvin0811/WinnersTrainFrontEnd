import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class PastCard extends StatelessWidget {
  final String statusText;
  final String imagePath;
  final String title;
  final String subtitle;

  const PastCard({
    super.key,
    required this.statusText,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  void _navigateBasedOnStatus(BuildContext context) {
    if (statusText == 'Cancelled') {
      Navigator.pushNamed(context, RoutesName.canceldetails);
    } else if (statusText == 'Completed') {
      Navigator.pushNamed(context, RoutesName.completedetails);
    } else if (statusText == 'Unattended') {
      Navigator.pushNamed(context, RoutesName.unattendeddetails);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color statusBgColor;
    Color labelTextColor;

    switch (statusText) {
      case 'Cancelled':
        statusBgColor = const Color(0x30E70000);
        labelTextColor = const Color(0xFFE70000);
        break;
      case 'Completed':
        statusBgColor = const Color(0x303BAF2F);
        labelTextColor = const Color(0xFF3BAF2F);
        break;
      case 'Unattended':
        statusBgColor = const Color(0x307386A2);
        labelTextColor = const Color(0xFF7386A2);
        break;
      default:
        statusBgColor = Colors.grey.shade200;
        labelTextColor = Colors.black;
    }

    return SizedBox(
      width: 390.w,
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(10),
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
                  _navigateBasedOnStatus(context);
                },
                child: Container(
                  width: 100.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: statusBgColor,
                    border: Border.all(width: 1, color: Colors.black12),
                  ),
                  child: Center(
                    child: Text(
                      statusText,
                      style: AppTextStyle.small(
                        color: labelTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PastCardListView extends StatelessWidget {
  const PastCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> cardData = [
      {
        'status': 'Cancelled',
        'image': 'assets/images/cardprofileimg.png',
        'title': 'Alexander Benjamin',
        'subtitle': 'Today, 07:00 PM',
      },
      {
        'status': 'Completed',
        'image': 'assets/images/cardprofileimg.png',
        'title': 'Alexander Benjamin',
        'subtitle': 'Today, 07:00 PM',
      },
      {
        'status': 'Unattended',
        'image': 'assets/images/cardprofileimg.png',
        'title': 'Alexander Benjamin',
        'subtitle': 'Today, 07:00 PM',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: 390.w,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: cardData.length,
          itemBuilder: (context, index) {
            var card = cardData[index];
            return PastCard(
              statusText: card['status']!,
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
