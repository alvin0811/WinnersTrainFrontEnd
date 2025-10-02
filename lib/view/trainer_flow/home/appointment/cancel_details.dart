import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class CancelDetails extends StatelessWidget {
  const CancelDetails({super.key});

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
        appBar: const MainHomeAppBar(
          title: "Appointment Details",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                10.verticalSpace,
                _buildAppointmentCard(context),
                15.verticalSpace,
                _buildCancelledDetailsCard(context),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Column(
          children: [
            _buildUserTile(
                context, "Cancelled", Color(0x30E70000), Color(0xffE70000)),
            20.verticalSpace,
            _buildDetailsRow("Date:", "March 27, 2024"),
            _buildDetailsRow("Time:", "03:00 PM  To  04:00 PM"),
            _buildFeeRow("\$100.00"),
            15.verticalSpace,
            _buildSectionTitle("Additional Note"),
            10.verticalSpace,
            _buildLongText(dummyText),
          ],
        ),
      ),
    );
  }

  Widget _buildCancelledDetailsCard(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Column(
          children: [
            _buildSectionTitle("Cancelled Details"),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "User",
                  style: AppTextStyle.button(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Alexander Benjamin",
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    color: const Color(0xff121314),
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            3.verticalSpace,
            Divider(color: const Color(0xFFDDE2E8), thickness: 1),
            _buildDetailsRow("Cancelled Date", "June 15, 2024"),
            _buildDetailsRow("Cancelled Charged", "\$ 32.20 (15%)"),
            15.verticalSpace,
            _buildSectionTitle("Cancelled Reason"),
            10.verticalSpace,
            _buildLongText(dummyText),
          ],
        ),
      ),
    );
  }

  Widget _buildUserTile(
      BuildContext context, String status, Color bgColor, Color textColor) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: GestureDetector(
        onTap: () => Navigator.pushNamed(context, RoutesName.userprofile),
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
          color: bgColor,
          border: Border.all(width: 1, color: Colors.black12),
        ),
        child: Center(
          child: Text(
            status,
            style: AppTextStyle.body(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeeRow(String amount) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _detailText("Consulting fee:"),
            Text(amount,
                style: AppTextStyle.subHeading(
                  color: const Color(0xff0066FF),
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
        3.verticalSpace,
        Divider(color: const Color(0xFFDDE2E8), thickness: 1),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: AppTextStyle.button(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLongText(String text) {
    return Opacity(
      opacity: 0.5,
      child: Text(
        maxLines: 4,
        text,
        style: AppTextStyle.button(
          color: const Color(0xff4C5157),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDetailsRow(String label, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _detailText(label),
            _detailValue(value),
          ],
        ),
        3.verticalSpace,
        Divider(color: const Color(0xFFDDE2E8), thickness: 1),
      ],
    );
  }

  Widget _detailText(String label) => Text(
        label,
        style: AppTextStyle.button(
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _detailValue(String value) => Opacity(
        opacity: 0.5,
        child: Text(
          value,
           style: AppTextStyle.button(
          color: const Color(0xff4C5157),
          fontWeight: FontWeight.bold,
        ),
         
        ),
      );
}

// Dummy paragraph for demo
const String dummyText = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mattis quam tortor taciti aenean luctus. Rhoncus praesent massa torquent malesuada. Egestas tortor blandit vestibulum tempus dignissim cras placerat. Mollis metus sodales ligula magnis condimentum et arcu nam.
''';
