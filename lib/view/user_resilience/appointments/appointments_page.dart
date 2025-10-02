import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/appointment_card.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_tabbar.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  @override
  void initState() {
    final vm = Provider.of<AppointmentViewModel>(context, listen: false);
    vm.selectedItem.value = "Upcoming";

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Consumer<AppointmentViewModel>(
            builder: (context, viewModel, child) {
          return Column(
            children: [
              CustomTabbar(
                  items: viewModel.items,
                  height: 42.h,
                  width: 126.w,
                  val: viewModel.selectedItem),
              25.h.verticalSpace,
              ValueListenableBuilder(
                  valueListenable: viewModel.selectedItem,
                  builder: (c, v, _) {
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: viewModel.selectedItem.value == "Upcoming"
                            ? 1
                            : viewModel.selectedItem.value == "Ongonig"
                                ? 2
                                : 3,
                        itemBuilder: (BuildContext context, index) {
                          final selectedTab = viewModel.selectedItem.value;

                          if (selectedTab == "Upcoming") {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context,
                                    RoutesName.upcomingAppointments);
                              },
                              child: AppointmentCard(
                                buttonText: 'Upcoming',
                                isButton: true,
                                button: Padding(
                                  padding:
                                      EdgeInsets.only(top: 15.h, bottom: 5.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                          width: 134.w,
                                          height: 40.h,
                                          child: CustomButton(
                                            borderRadius:
                                                BorderRadius.circular(26.r),
                                            fontcolor: context.onPrimary,
                                            fontsize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            text: 'Cancel',
                                            color: context.primary,
                                            isGradient: false,
                                            border: Border.all(
                                              color: Color(0xff0AB2AE),
                                              width: 1.0,
                                            ),
                                          ).inkWell(
                                              onTap: () => Navigator.pushNamed(
                                                  context,
                                                  RoutesName
                                                      .cancelAppointmentReason))),
                                      10.w.horizontalSpace,
                                      SizedBox(
                                          width: 134.w,
                                          height: 40.h,
                                          child: CustomButton(
                                            fontsize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            text: 'Reschedule',
                                            gradient: LinearGradient(
                                              begin: Alignment(0.96, -1),
                                              end: Alignment(-0.96, 1),
                                              colors: [
                                                context.onPrimaryContainer,
                                                context.onPrimary
                                              ],
                                            ),
                                          ).inkWell(
                                              onTap: () => Navigator.pushNamed(
                                                  context,
                                                  RoutesName
                                                      .rescheduleBooking))),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else if (selectedTab == "Ongoing") {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context,
                                    RoutesName.ongoingAppointments);
                              },
                              child: AppointmentCard(
                                buttonText: 'Ongoing',
                                isButton: true,
                                button: Padding(
                                  padding:
                                      EdgeInsets.only(top: 15.h, bottom: 5.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                          width: 280.w,
                                          height: 40.h,
                                          child: CustomButton(
                                            text: 'Join Session',
                                            fontsize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ).inkWell(onTap: () {
                                            Navigator.pushNamed(context,
                                                RoutesName.userJoinLiveSession);
                                          })),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            String buttonText;
                            Color backgroundColor;
                            Color fontColor;
                            double width;
                            double height;

                            switch (index) {
                              case 0:
                                buttonText = "Cancelled";
                                backgroundColor = Colors.red.withOpacity(0.2);
                                fontColor = Color(0xffE70000);
                                width = 91.w;
                                height = 33.h;

                                break;
                              case 1:
                                buttonText = "Unattended";
                                backgroundColor = Color(0xffE7ECF2);
                                fontColor = Color(0xff7386A2);
                                width = 102.w;
                                height = 40.h;

                                break;
                              default:
                                buttonText = "Completed";
                                backgroundColor = Colors.green.withOpacity(0.2);
                                fontColor = Color(0xff3BAF2F);
                                width = 98.w;
                                height = 40.h;
                            }

                            return AppointmentCard(
                              isPast: true,
                              button: CustomButton(
                                width: width,
                                height: height,
                                color: backgroundColor,
                                isGradient: false,
                                text: buttonText,
                                fontcolor: fontColor,
                                fontWeight: FontWeight.w400,
                                fontsize: 14.sp,
                              ),
                            ).inkWell(
                              onTap: () {
                                index == 0
                                    ? Navigator.pushNamed(context,
                                        RoutesName.cancelledAppointment)
                                    : index == 1
                                        ? Navigator.pushNamed(context,
                                            RoutesName.unAttendedAppointment)
                                        : Navigator.pushNamed(context,
                                            RoutesName.completedAppointment);
                              },
                            );
                          }
                        });
                  }),
            ],
          ).paddingSymmetric(horizontal: 19.w, vertical: 20.h);
        }),
      ),
    );
  }
}
