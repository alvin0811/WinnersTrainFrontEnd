import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_drop_down.dart';
import 'package:winner_trains_app/view/widgets/trainer/age_input_filed.dart';
import 'dart:io';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';
// import 'package:winner_trains_app/view/widgets/trainer/age_input_filed.dart';

import 'package:winner_trains_app/utils/routes/route_name.dart';

class TrainerCreateProfile extends StatefulWidget {
  const TrainerCreateProfile({super.key});

  @override
  _TrainerCreateProfileState createState() => _TrainerCreateProfileState();
}

class _TrainerCreateProfileState extends State<TrainerCreateProfile> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController consultingFeeController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController dateController = TextEditingController();
  bool isScrolling = false;
  File? _image;
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 10 && !isScrolling) {
        setState(() {
          isScrolling = true;
        });
      } else if (_scrollController.offset <= 10 && isScrolling) {
        setState(() {
          isScrolling = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(215.h),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/authbg.png"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.r),
                  bottomRight: Radius.circular(50.r),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    bottom: -50.h,
                    left: 0,
                    right: 0,
                    child: Center(
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
                  ),
                  Positioned(
                    bottom: -60,
                    child: isScrolling
                        ? const SizedBox()
                        : Text("(Optional)", style: AppTextStyle.body()),
                  ),
                ],
              ),
            ),
            // leading: GestureDetector(
            //   onTap: () {
            //     // Navigator.pop(context);
            //     Navigator.pushNamed(context, RoutesName.trainerPreLogin);
            //   },
            //   child: Image.asset("assets/images/back.png"),
            // ),
            title: Text(
              "Create Profile",
               style: AppTextStyle.button(
                  color: const Color(0xffffffff),
                fontWeight: FontWeight.bold,
              )
              
            ),
            centerTitle: true,
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                80.verticalSpace,
                CustomInputWidget(
                  controller: fullNameController,
                  Header: "Full Name",
                  prefixIconPath: "assets/svg/person.svg",
                  hint: "Enter your Full Name",
                  label: "",
                ),
                20.verticalSpace,
                SizedBox(
                  width: 390.w,
                  child: MyDropdownWidget(
                      // customPadding: 15.w,
                      options: ['Male', 'Female'],
                      selectedValue: 'Female',
                      onChanged: (newValue) {
                        print('Selected: $newValue');
                      },
                      text: 'Select Gender',
                      Header: 'Gender'),
                ),
                20.verticalSpace,
                AgeInputField(controller: dateController),
                20.verticalSpace,
                CustomInputWidget(
                  isReadOnly: true,
                  controller: emailController,
                  Header: "Email Address",
                  prefixIconPath: "assets/svg/email.svg",
                  suffix: const Icon(Icons.check_circle, color: Colors.green),
                  hint: "alexander.benjamin@domain.com",
                  label: "adada",
                ),
                20.verticalSpace,
                CustomInputWidget(
                  controller: consultingFeeController,
                  Header: "Consulting fee",
                  hint: "Enter your consulting fee",
                  label: "",
                ),
                20.verticalSpace,
                CustomInputWidget(
                  controller: bioController,
                  Header: "Bio & Specialization",
                  maxline: 4,
                  radius: 20,
                  hint: "type here...",
                  label: "",
                ),20.verticalSpace,
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: CustomButton(
                    loading: false,

            buttonText: "Continue",
            onPressed: () {
                Navigator.pushNamed(context, RoutesName.experiencequalifications);
            },
          ),
        ),
      ),
    );
  }
}
