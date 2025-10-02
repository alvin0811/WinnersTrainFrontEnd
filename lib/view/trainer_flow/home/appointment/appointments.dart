import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/view/widgets/trainer/Appointments_widgets/ongoing_card.dart';
import 'package:winner_trains_app/view/widgets/trainer/Appointments_widgets/past_card.dart';
import 'package:winner_trains_app/view/widgets/trainer/Appointments_widgets/upcoming_card.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/appointment_card_view_model.dart';

class Appointments extends StatelessWidget {
  const Appointments({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AppointmentCardViewModel>(context);
    Widget _getSelectedScreen() {
      switch (controller.reportSelected) {
        case 0:
          return UpcomingCardListView();
        case 1:
          return OngoingCardListView();
        case 2:
          return PastCardListView();

        default:
          return Container(color: Colors.red);
      }
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:
        SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  20.verticalSpace,
                  Container(
                    width: 390.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(28.r)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff2238500F),
                          offset: Offset(0, 1),
                          blurRadius: 10.r,
                        ),
                      ],
                    ),
                    child: Padding(
                       padding: const EdgeInsets.only(left: 3.0),
                      child: Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          controller.reportFilters.length,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                // Update the selected tab
                                controller.selectReportSelected(index);
                              },
                              child: Container(
                                width: 128.w,
                                height: 46.h,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors:
                                        controller.reportSelected == index
                                            ? [
                                              const Color(0xFFE2CFCF),
                                              const Color(0xFF008B88),
                                            ]
                                            : [
                                              const Color(0xffFFFFFF),
                                              const Color(0xffFFFFFF),
                                            ],
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(26.r),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    controller.reportFilters[index],
                                    style: TextStyle(
                                      color:
                                          controller.reportSelected != index
                                              ? const Color(0XFF4C5157)
                                              : Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Expanded(child: SizedBox(width: 390.w,
                    child: _getSelectedScreen())),
                ],
              ),
            ),
      ),
    );
  }
}
