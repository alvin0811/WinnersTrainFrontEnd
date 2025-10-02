import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/past_appointments/appointment_details_card.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/review_card.dart';

class CompletedAppointments extends StatelessWidget {
  final bool isReviewed;
  const CompletedAppointments({super.key, this.isReviewed = false});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Appointment Details',
            ),
            body: Column(
              children: [
                AppointmentDetailsCard(
                  button: CustomButton(
                    text: "Completed",
                    isGradient: false,
                    color: Colors.green.withOpacity(0.2),
                    fontcolor: const Color(0xff3BAF2F),
                    width: 108.w,
                    fontsize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: 33.h,
                  ),
                ),
                isReviewed
                    ? Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: ReviewCard(
                            userName: 'Alexander Benjamin',
                            imageUrl: AppAssets.images.person2Image,
                            ratings: '4.8',
                            reviews:
                                'Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus',
                            time: '1 day ago'),
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: 330.h),
                        child: CustomButton(
                                isGradient: false,
                                color: context.primary,
                                text: 'Ratings & Reviews',
                                fontcolor: context.onPrimary,
                                border: Border.all(
                                    color: const Color(0xff0AB2AE), width: 1))
                            .inkWell(
                          onTap: () => Navigator.pushReplacementNamed(
                              context, RoutesName.submitReview),
                        ),
                      )
              ],
            ).paddingSymmetric(horizontal: 20.w, vertical: 20.h)));
  }
}
