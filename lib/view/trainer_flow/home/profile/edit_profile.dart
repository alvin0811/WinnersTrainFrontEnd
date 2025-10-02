import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
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

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<EditProfile> {
  File? _image;
  TextEditingController genderController = TextEditingController();

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  final TextEditingController dateControlleredit = TextEditingController();

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
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 80.r,
                      backgroundColor: Colors.transparent,
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : const AssetImage('assets/images/profileimg.png')
                              as ImageProvider,
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
                ),
                Text(
                  "(Optional)",
                  style: TextStyle(
                    color: const Color(0xff1201314),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                CustomInputWidget(
                  Header: "Full Name",
                  prefixIconPath: "assets/svg/person.svg",
                  hint: "Enter your Full Name",
                  label: "",
                ),
                20.verticalSpace,
                SizedBox(
                  width: 390.w,
                  child: MyDropdownWidget(
                      customPadding: 15.w,
                      options: ['Male', 'Female'],
                      selectedValue: 'Female',
                      onChanged: (newValue) {
                        print('Selected: $newValue');
                      },
                      text: 'Select Gender',
                      Header: 'Gender'),
                ),
                20.verticalSpace,
                AgeInputField(controller: dateControlleredit),
                20.verticalSpace,
                CustomInputWidget(
                  Header: "Email Address",
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
                  hint: "type here...",
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

                      /// Option chips
                      Consumer<ProfileViewModel>(
                        builder: (context, provider, _) {
                          return Wrap(
                            spacing: 20.w,
                            runSpacing: 20.h,
                            children: [
                              /// Default options
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
                                      borderRadius: BorderRadius.circular(28.r),
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

                              /// Custom options with close icon
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
                                      borderRadius: BorderRadius.circular(28.r),
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
                                              Provider.of<ProfileViewModel>(
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
                                                color: const Color(0xffFF4D4D),
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
              ],
            ),
          ),
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
