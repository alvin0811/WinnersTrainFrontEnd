import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/view/widgets/trainer/my_earning_card.dart';

class EarningTransaction {
  final String name;
  final String date;
  final String charge;
  final String earning;

  EarningTransaction({
    required this.name,
    required this.date,
    required this.charge,
    required this.earning,
  });
}

class MyEarning extends StatelessWidget {
  const MyEarning({super.key});

  @override
  Widget build(BuildContext context) {
    List<EarningTransaction> transactions = [
      EarningTransaction(
          name: "William Roy",
          date: "Sep 01, 2023",
          charge: "-\$15.00",
          earning: "-\$100.00"),
      EarningTransaction(
          name: "Sarah Smith",
          date: "Sep 05, 2023",
          charge: "-\$18.00",
          earning: "-\$80.00"),
      EarningTransaction(
          name: "John Doe",
          date: "Sep 10, 2023",
          charge: "-\$10.00",
          earning: "-\$70.00"),
      EarningTransaction(
          name: "Emily Jones",
          date: "Sep 15, 2023",
          charge: "-\$25.00",
          earning: "-\$150.00"),
      EarningTransaction(
          name: "Chris Evans",
          date: "Sep 20, 2023",
          charge: "-\$12.00",
          earning: "-\$90.00"),
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
          title: "My Earning",
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _earningCard("assets/svg/Icon metro-coins.svg",
                      "Total Earning", "\$15,658.36"),
                  _earningCard("assets/svg/Group 11236.svg", "Last 30 days",
                      "\$2,365.33"),
                ],
              ),
              20.verticalSpace,
              MonthlyEarningCard(
                  month: "September 2023", transactions: transactions),
              MonthlyEarningCard(
                  month: "August 2023", transactions: transactions),
            ],
          ),
        ),
      ),
    );
  }

  Widget _earningCard(String icon, String title, String amount) {
    return Opacity(
      opacity: 0.9,
      child: Container(
        width: 185.w,
        height: 93.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffE2CFCF), Color(0xff008B88)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SvgPicture.asset(icon, width: 22.w, height: 16.h),
                5.horizontalSpace,
                Text(
                  title,
                  style: AppTextStyle.button(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
            5.verticalSpace,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                amount,
                style: GoogleFonts.roboto(
                  fontSize: 28.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
