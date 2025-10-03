import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/resources/extensions/context_extension.dart';
import 'package:winner_trains_app/resources/theme/color_scheme.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_drop_down.dart';
import 'dart:io';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';
import 'package:winner_trains_app/view/widgets/trainer/age_input_filed.dart';
import 'package:winner_trains_app/view/widgets/trainer/custom_dailog_box.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/profile_view_model.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class EditProfile extends StatelessWidget {
 EditProfile({super.key});



  TextEditingController genderController = TextEditingController();

  final TextEditingController dateControlleredit = TextEditingController();
  final List<String> preferences = [
      "Stress-Related",
      "Depression",
      "Fear",
      "Anxiety",
      "Motivation",
      "Irritation",
      "Anger",
      "Sadness",
      "Worry",
      "Envy"
    ];
    final List<String> whiteBordered = [
      "Stress-Related",
      "Depression",
      "Anxiety"
    ];
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
        appBar: MainHomeAppBar(
          title: "Edit Profile",
          onBackTap: () {
            showCustomDialog(
              context: context,
              title: "Edit Profile!",
              description: "Are you sure you want to edit?",
              buttonText: "No",
              secondaryButtonText: "Yes",
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                print("Post Yes");
              },
              onPressed1: () {
                Navigator.pop(context);
                print("No");
              },
            );
          },
        ),
        body: SingleChildScrollView(
          child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 80.r,
                  backgroundColor: Colors.transparent,
                  backgroundImage: 
                 
                       const AssetImage('assets/images/profileimg.png'),
                       
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Image.asset(
                        "assets/images/camera.png",
                        width: 54.w,
                        height: 54.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "(Optional)",
                  style: TextStyle(
                    color: const Color(0xff1201314),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
               20.h.verticalSpace,
              CustomInputWidget(
                Header: "Full Name",
                prefixIconPath: "assets/svg/person.svg",
                hint: "Enter your Full Name",
                label: "",
              ),
              20.verticalSpace,
              MyDropdownWidget(
                  customPadding: 15.w,
                  options: ['Male', 'Female'],
                  selectedValue: 'Female',
                  onChanged: (newValue) {
                    print('Selected: $newValue');
                  },
                  text: 'Select Gender',
                  Header: 'Gender'),
              20.verticalSpace,
              AgeInputField(controller: dateControlleredit, ),
              20.verticalSpace,
              CustomInputWidget(
                Header: "Email Address",
                isReadOnly: true,
                suffix: const Icon(Icons.check_circle, color: Colors.green),
                prefixIconPath: "assets/svg/email.svg",
                hint: "alexander.benjamin@domain.com",
                label: "adada",
              ),
              20.verticalSpace,
              CustomInputWidget(
                Header: "Consulting fee",
                hint: "Enter you consulting fee",
                label: "",
              ),
              20.verticalSpace,
              CustomInputWidget(
                Header: "Bio & Specialization",
                maxline: 4,
                radius: 20,
                hint: "Type here...",
                label: "",
              ),
              20.verticalSpace,
              SizedBox(
                width: 390.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("What mental health issues do you\n specialize in?",
                        style: AppTextStyle.heading()),
                    SizedBox(height: 20.h),
        
                    /// Input for custom options
                    CustomInputWidget(
                      Header: "",
                      hint: "Other (Type Here)",
                      label: "",
                      onComplete: (newOption) {
                        if (newOption.isNotEmpty) {
                          Provider.of<ProfileViewModel>(
                            context,
                            listen: false,
                          ).addCustomOption(newOption);
                        }
                      },
                    ),
                    20.verticalSpace,
        
                    Wrap(
              spacing: 10.w,
              runSpacing: 12.h,
              children: preferences.map((pref) {
                final bool isWhite = whiteBordered.contains(pref);

                return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: isWhite ? null : context.primary,
                    gradient: isWhite ? AppColor.secondaryButton : null,
                    border: Border.all(
                        color: isWhite ? context.primary : Color(0xffB3BDCC),
                        width: isWhite ? 2 : 1),
                    borderRadius: BorderRadius.circular(isWhite ? 28.r : 22.r),
                  ),
                  child: Text(
                    pref,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: isWhite ? context.primary : context.onSecondary,
                    ),
                  ),
                );
              }).toList(),
            ),
                  ],
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 20.w)
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
