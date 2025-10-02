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

class UserCreateProfile extends StatefulWidget {
  const UserCreateProfile({super.key});

  @override
  State<UserCreateProfile> createState() => _UserCreateProfileState();
}

class _UserCreateProfileState extends State<UserCreateProfile> {
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
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBarProfile(
          height: 215.h,
          // icon: InkWell(
          //   onTap: () {
          //     Navigator.of(context).pop();
          //     // Navigator.of(context).pop();
          //   },
          //   child: Image.asset(
          //     "assets/images/back.png",
          //     width: 40.w,
          //     height: 40.h,
          //   ),
          // ),
          title: 'Create Profile',
          image: Positioned(
            //top: 145.h,
            bottom: -65.h,
            left: 0.w,
            right: 0.w,
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
                          ? Text("(Optional)", style: AppTextStyle.body())
                          : SizedBox.shrink();
                    })
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              90.h.verticalSpace,
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
                   ),     20.h.verticalSpace,
              CustomTextfield(
                  headerText: 'Email',
                  customPadding: 15.w,
                  hintText: 'alexander.benjamin@domain.com',
                  readonly: true,
                  suffixIcon:
                      const Icon(Icons.check_circle, color: Colors.green),
                  prefixIcon: Image.asset(
                    AppAssets.icon.loginEmailIcon,
                    width: 24.w,
                    height: 24.h,
                  )),
              20.h.verticalSpace,
              CustomTextfield(
                  headerText: 'About',
                  customPadding: 15.w,
                  hintText: 'Type here...',
                  radius: BorderRadius.circular(15.r),
                  maxLines: 5,
                  height: 0.15.sh),
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
        bottomNavigationBar: const CustomButton(
          text: 'Continue',
        ).paddingSymmetric(horizontal: 20.w, vertical: 20.h).inkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.contentPreferences),
            ),
      ),
    );
  }
}
