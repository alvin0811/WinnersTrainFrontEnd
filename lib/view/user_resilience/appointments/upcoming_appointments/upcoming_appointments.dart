import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/past_appointments/appointment_details_card.dart';

import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class UpcomingAppointments extends StatelessWidget {
  const UpcomingAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(title: 'Appointment Details'),
            body: Column(
              children: [
                AppointmentDetailsCard(
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppAssets.icon.calendarYellowIcon,
                                width: 19.5.w,
                                height: 19.5.h,
                                fit: BoxFit.cover,
                              ),
                              10.w.horizontalSpace,
                              Text(
                                'Booking Reschedule',
                                style:
                                    context.bodySmall.copyWith(fontSize: 14.sp),
                              ),
                            ],
                          ).inkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, RoutesName.rescheduleBooking))),
                      20.h.verticalSpace,
                      CustomButton(
                        text: 'Cancel',
                      ).inkWell(
                          onTap: () => Navigator.pushNamed(
                              context, RoutesName.cancelAppointmentReason)),
                      10.h.verticalSpace,
                    ],
                  ),
                )
              ],
            ).paddingSymmetric(horizontal: 20.w, vertical: 20.h)));
  }
}
