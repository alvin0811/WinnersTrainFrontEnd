import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/past_appointments/appointment_details_card.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';

class OngoingAppointmentDetails extends StatelessWidget {
  const OngoingAppointmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomindex = Provider.of<TrainerMainHomeViewModel>(context);

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
                      text: "Ongoing",
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
                                fontWeight: FontWeight.w400,
                                text: 'Join Session',
                                fontsize: 14.sp)
                            .inkWell(onTap: () {
                          Navigator.pushNamed(
                              context, RoutesName.userJoinLiveSession);
                        }),
                        20.h.verticalSpace,
                        CustomButton(
                          text: 'Report',
                          color: context.primary,
                          fontcolor: context.onPrimary,
                          fontsize: 14.sp,
                          border:
                              Border.all(color: Color(0xff0AB2AE), width: 1.0),
                          isGradient: false,
                          fontWeight: FontWeight.w400,
                        ).inkWell(
                          onTap: () {
                            Navigator.pushNamed(context,
                                RoutesName.trainerappointmentreportissue);
                            // arguments: {'color': Colors.red});
                          },
                        ),
                  
                      ],
                    )),
                    Spacer(),
                          CustomButton(
                          text: 'Mark as Completed',
                          color: context.primary,
                          fontcolor: context.onPrimary,
                          fontsize: 14.sp,
                          border:
                              Border.all(color: Color(0xff0AB2AE), width: 1.0),
                          isGradient: false,
                          fontWeight: FontWeight.w400,
                        ).inkWell(
                          onTap: () {
                          
                          },
                        ),
                        10.h.verticalSpace,
              ],
            ).paddingSymmetric(horizontal: 20.w, vertical: 20.h)));
  }
}
