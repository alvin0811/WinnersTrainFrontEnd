import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/utils/extensions/custom_log.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_date_picker.dart';
import 'package:winner_trains_app/view/widgets/custom_drop_down.dart';
import 'package:winner_trains_app/view/widgets/custom_profile_image.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart';
import 'package:winner_trains_app/view/widgets/trainer/custom_dailog_box.dart';

class UserEditProfile extends StatefulWidget {
  const UserEditProfile({super.key});

  @override
  State<UserEditProfile> createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {
  final ScrollController _scrollController = ScrollController();

  ValueNotifier<bool> isScrolling = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    setScrollController();
  }

  void setScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.offset > 10 && !isScrolling.value) {
        isScrolling.value = true;
        "isScrolling.value === >  ${isScrolling.value}".print();
      } else if (_scrollController.offset <= 10 && isScrolling.value) {
        isScrolling.value = false;
        "isScrolling.value === >  ${isScrolling.value}".print();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
    return CustomBackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(
        icon: InkWell(
          onTap: () {
            showCustomDialog(
              context: context,
              title: "Edit Profile!",
              description: "Are you sure you want to edit?",
              buttonText: "Yes",
              secondaryButtonText: "No",
              onPressed: () {
                Navigator.pop(context);

                print("Post Yes");
              },
              onPressed1: () {
                Navigator.pop(context);
                Navigator.pop(context);
                print("No");
              },
            );
          },
          child: Image.asset(
            "assets/images/back.png",
            width: 40.w,
            height: 40.h,
          ),
        ),
        // height: 215.h,
        title: 'Edit Profile',
        // image: Positioned(
        //   top: 140.h,
        //   left: 130.w,
        //   right: 130.w,
        //   child: Column(
        //     children: [
        //       ProfilePicture(
        //         borderWidth: 8.5,
        //         imageUrl: AppAssets.images.userProfile,
        //         child: SvgPicture.asset(AppAssets.icon.cameraIcon,
        //             width: 70.w, height: 70.h),
        //       ),
        //       ValueListenableBuilder(
        //           valueListenable: isScrolling,
        //           builder: (c, v, _) {
        //             return v != true
        //                 ? Text("(Optional)", style: AppTextStyle.body())
        //                 : SizedBox.shrink();
        //           }),
        //     ],
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  ProfilePicture(
                    borderWidth: 8.5,
                    imageUrl: AppAssets.images.userProfile,
                    child: SvgPicture.asset(AppAssets.icon.cameraIcon,
                        width: 70.w, height: 70.h),
                  ),
                  ValueListenableBuilder(
                      valueListenable: isScrolling,
                      builder: (c, v, _) {
                        return v != true
                            ? Center(
                                child: Text("(Optional)",
                                    style: AppTextStyle.body()))
                            : SizedBox.shrink();
                      }),
                ],
              ),
            ),
            // 73.h.verticalSpace,

            CustomTextfield(
                headerText: 'Full Name',
                customPadding: 15.w,
                hintText: 'Enter your full Name',
                prefixIcon: Image.asset(
                  AppAssets.icon.personIcon,
                  width: 24.w,
                  height: 24.h,
                )),
            20.h.verticalSpace,
            MyDropdownWidget(
                customPadding: 15.w,
                options: ['Male', 'Female'],
                selectedValue: 'Female',
                onChanged: (newValue) {
                  print('Selected: $newValue');
                },
                text: 'Select Gender',
                Header: 'Gender'),
            20.h.verticalSpace,
            CustomTextfield(
              customPadding: 15.w,
              headerText: 'Age',
              hintText: 'Enter your Age',
              // suffixIcon: Icon(
              //   Icons.calendar_month,
              //   size: 24,
              //   color: Colors.black.withOpacity(0.6),
              // ).inkWell(onTap: () {
              //   showDialog(
              //     context: context,
              //     builder: (_) {
              //       return CustomDatePicker(
              //         initialDate: DateTime.now(),
              //         onDateSelected: (date) {
              //           print("Selected Date: $date");
              //         },
              //       );
              //     },
              //   );
              // })),
            ),
            20.h.verticalSpace,
            CustomTextfield(
                headerText: 'Email',
                customPadding: 15.w,
                hintText: 'alexander.benjamin@domain.com',
                readonly: true,
                suffixIcon: const Icon(Icons.check_circle, color: Colors.green),
                prefixIcon: Image.asset(
                  AppAssets.icon.loginEmailIcon,
                  width: 24.w,
                  height: 24.h,
                )),
            20.h.verticalSpace,
            CustomTextfield(
              headerText: 'About',
              headerTextColor: context.onPrimary,
              customPadding: 20.w,
              radius: BorderRadius.circular(15.r),
              hintText: 'Type here....',
              hintColor: Colors.black.withOpacity(0.4),
              maxLines: 5,
              height: 0.15.sh,
              fontWeight: FontWeight.w500,
              hintTextSize: 14.sp,
            ),
            20.h.verticalSpace,
            Text(
              'Content Preferences',
              style: context.titleMedium
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 16.sp),
            ),
            20.h.verticalSpace,
            CustomTextfield(
              hintText: 'Other (Type Here)',
              enabledborderColor: Color(0xffE4EBF5),
              focusedborderColor: Color(0xffE4EBF5),
            ),
            20.h.verticalSpace,
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
            20.h.verticalSpace,
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
      bottomNavigationBar: const CustomButton(
        text: 'Update',
      ).paddingSymmetric(horizontal: 20.w, vertical: 20.h).inkWell(
            onTap: () => Navigator.pop(context),
          ),
    ));
  }
}
