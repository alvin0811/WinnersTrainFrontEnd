import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';
// import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/thank_you)dialog.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/auth_view_model.dart';
// import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';
// import 'package:winner_trains_app/utils/app_colors.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class YouSpecializeIn extends StatelessWidget {
  const YouSpecializeIn({super.key});

  @override
  Widget build(BuildContext context) {
    // final bottomindex = Provider.of<TrainerMainHomeViewModel>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/images/back.png"),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
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
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What mental health issues do you\n specialize in?",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: const Color(0xff121314),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        CustomInputWidget(
                          Header: "",
                          hint: "Other (Type Here)",
                          label: "",
                          onComplete: (newOption) {
                            if (newOption.isNotEmpty) {
                              Provider.of<AuthViewModel>(
                                context,
                                listen: false,
                              ).addCustomOption(newOption);
                            }
                          },
                        ),
                        20.verticalSpace,
                        Consumer<AuthViewModel>(
                          builder: (context, provider, _) {
                            return Wrap(
                              spacing: 35.w,
                              runSpacing: 20.h,
                              children: [
                                ...provider.defaultOptions.map((option) {
                                  bool isSelected =
                                      provider.selectedOptions.contains(option);
                                  return GestureDetector(
                                    onTap: () {
                                      isSelected
                                          ? provider.deselectOption(option)
                                          : provider.selectOption(option);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 10.h,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xffB3BDCC),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          28.r,
                                        ),
                                        gradient: isSelected
                                            ? const LinearGradient(
                                                colors: [
                                                  Color(0xFFE2CFCF),
                                                  Color(0xFF008B88),
                                                ],
                                                stops: [0.0, 0.6],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              )
                                            : null,
                                        color: isSelected ? null : Colors.white,
                                      ),
                                      child: Text(
                                        option,
                                        style: TextStyle(
                                          color: isSelected
                                              ? const Color(0xffFFFFFF)
                                              : const Color(0xff48576E),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                                ...provider.options.map((option) {
                                  bool isSelected =
                                      provider.selectedOptions.contains(option);
                                  bool isCustom =
                                      !provider.defaultOptions.contains(option);

                                  return GestureDetector(
                                    onTap: () {
                                      isSelected
                                          ? provider.deselectOption(option)
                                          : provider.selectOption(option);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 10.h,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xffB3BDCC),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          28.r,
                                        ),
                                        gradient: isSelected
                                            ? const LinearGradient(
                                                colors: [
                                                  Color(0xFFE2CFCF),
                                                  Color(0xFF008B88),
                                                ],
                                                stops: [0.0, 0.6],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              )
                                            : null,
                                        color: isSelected ? null : Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            option,
                                            style: TextStyle(
                                              color: isSelected
                                                  ? const Color(0xffFFFFFF)
                                                  : const Color(0xff48576E),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          if (isCustom)
                                            GestureDetector(
                                              onTap: () {
                                                Provider.of<AuthViewModel>(
                                                  context,
                                                  listen: false,
                                                ).removeCustomOption(option);
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: 6.w,
                                                ),
                                                child: Icon(
                                                  Icons.close,
                                                  size: 18.sp,
                                                  color: const Color(
                                                    0xffFF4D4D,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: CustomButton(
            loading: false,
            buttonText: "Continue",
            onPressed: () {
              Navigator.pushNamed(
                  context, RoutesName.trainerprofileverification);
            },
          ),
        ),
      ),
    );
  }
}
