import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/past_appointments/appointment_details_card.dart';

import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class UpcomingAppointmentDetails extends StatelessWidget {
  const UpcomingAppointmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(title: 'Appointment Details'),
            body: Column(
              children: [
                AppointmentDetailsCard(
                  docName: 'Alexander Benjamin',
                  imageUrl: AppAssets.images.userProfile,
                  button: CustomButton(
                    text: "Upcoming",
                    isGradient: false,
                    color: Colors.blue.withOpacity(0.2),
                    fontcolor: Color(0xff0066FF),
                    width: 98.w,
                    fontsize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: 38.h,
                  ),
                  appointmentButton: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      39.h.verticalSpace,
                      CustomButton(
                        color: context.primary,
                        border:
                            Border.all(color: Color(0xff0AB2AE), width: 1.0),
                        isGradient: false,
                        text: 'Cancel Booking',
                        fontsize: 14.sp,
                        fontcolor: context.onPrimary,
                      ).inkWell(
                          onTap: () => Navigator.pushNamed(
                              context, RoutesName.cancelbookingreason)),
                      10.h.verticalSpace,
                    ],
                  ),
                )
              ],
            ).paddingSymmetric(horizontal: 20.w, vertical: 20.h)));
  }
}
