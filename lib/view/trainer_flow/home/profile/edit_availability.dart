import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/time_salection_row.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/profile_view_model.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart'; // Import the correct TimeSelection here

class EditAvailability extends StatelessWidget {
  const EditAvailability({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomindex = Provider.of<TrainerMainHomeViewModel>(context);

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
          title: "Availability",
        ),
        body: Consumer<ProfileViewModel>(
          builder: (context, provider, _) {
            List<String> sortedDays = provider.dayCards.keys.toList()
              ..sort((a, b) {
                bool aSwitchState = provider.daySwitchState[a] ?? false;
                bool bSwitchState = provider.daySwitchState[b] ?? false;
                return (bSwitchState ? 1 : 0).compareTo(aSwitchState ? 1 : 0);
              });

            return SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    50.verticalSpace,
                    ...sortedDays.map((day) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 390.w,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              elevation: 10,
                              clipBehavior: Clip.none,
                              color: Colors.white,
                              shadowColor: const Color(0xff2238500F),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(day,
                                            style: AppTextStyle.subHeading(
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Transform.scale(
                                          scale: 0.7,
                                          child: Switch(
                                            activeTrackColor: Colors.green,
                                            value:
                                                provider.daySwitchState[day]! ??
                                                    false,
                                            onChanged: (value) {
                                              provider.toggleDaySwitch(day);
                                              if (value &&
                                                  provider
                                                      .dayCards[day]!.isEmpty) {
                                                provider.addNewCard(day,context);
                                              }
                                            },
                                            activeColor: Colors.white,
                                            inactiveThumbColor: const Color(
                                              0xff48576E,
                                            ),
                                            inactiveTrackColor: const Color(
                                              0xffE0E7F0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Show cards only if the switch is on and cards exist
                                    if (provider.daySwitchState[day]! &&
                                        provider.dayCards[day] != null)
                                      ...provider.dayCards[day]!.map((card) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 10.0,
                                          ),
                                          child: TimeSelectionRow(
                                            day: day,
                                            timeSelection: card,
                                            onRemove: provider
                                                        .dayCards[day]!.length >
                                                    1
                                                ? () {
                                                    provider.removeCard(
                                                      day,
                                                      provider.dayCards[day]!
                                                          .indexOf(card),
                                                    );
                                                  }
                                                : null,
                                          ),
                                        );
                                      }).toList(),
                                    if (provider.daySwitchState[day]! &&
                                        provider.dayCards[day]!.isNotEmpty)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              provider.addNewCard(day,context);
                                            },
                                            child: SvgPicture.asset(
                                              "assets/svg/add.svg",
                                            ),
                                          ),
                                          10.horizontalSpace,
                                          Text(
                                            "Add New Card",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: const Color(0XFF48576E),
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: CustomButton(
            buttonText: "Save Changes",
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.homemain);
              bottomindex.updateIndex(3);
            },
          ),
        ),
      ),
    );
  }
}
