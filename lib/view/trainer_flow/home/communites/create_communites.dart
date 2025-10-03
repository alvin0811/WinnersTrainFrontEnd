import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_drop_down.dart';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class CreateCommunites extends StatelessWidget {
  CreateCommunites({super.key});

  final ValueNotifier<File?> selectedImage = ValueNotifier<File?>(null);

  Future<void> _pickFile(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take Photo'),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.camera);
                  if (image != null) selectedImage.value = File(image.path);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Choose from Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (image != null) selectedImage.value = File(image.path);
                },
              ),
            ],
          ),
        );
      },
    );
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
        appBar: const MainHomeAppBar(
          title: "Create Community",
        ),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                20.verticalSpace,
                SizedBox(
                  width: 390.w,
                  // height: 175.h,
                  child: GestureDetector(
                    onTap: () => _pickFile(context),
                    child: DottedBorder(
                      strokeWidth: 1,
                      radius: const Radius.circular(15.0),
                      dashPattern: const [6, 8],
                      borderType: BorderType.RRect,
                      color: const Color(0xFFD0D8E3),
                      child: Container(
                          height: 175.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                           color: Colors.white,
                        ),
                       
                       
                      
                        child: Center(
                          child: ValueListenableBuilder<File?>(
                            valueListenable: selectedImage,
                            builder: (context, file, _) {
                              return file == null
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        10.verticalSpace,
                                        SvgPicture.asset(
                                            "assets/svg/upload.svg"),
                                        10.verticalSpace,
                                        Text(
                                          "Click to upload",
                                          textAlign: TextAlign.center,
                                          style: AppTextStyle.button(
                                            color: const Color(0xff4C5157),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        10.verticalSpace,
                                        Text(
                                          "Upload JPEG, PNG",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.normal,
                                            color: const Color(0xff4C5157),
                                          ),
                                        ),
                                        10.verticalSpace,
                                      ],
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        child: Image.file(
                                          file,
                                          // width: double.infinity,
                                          // height: 150.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                20.verticalSpace,
                SizedBox(
                  width: 390.w,
                  child: MyDropdownWidget(
                      options: [
                        'Select Category',
                        'Mental Wellness',
                        'Physical Health',
                        'Emotional Strength',
                        'Leadership & Growth',
                        'Coping Strategies',
                        'Peer Support',
                      ],
                      selectedValue: 'Select Category',
                      onChanged: (newValue) {
                        print('Selected: $newValue');
                      },
                      text: 'Select Category',
                      Header: 'Category'),
                ),
                20.verticalSpace,
                SizedBox(
                    width: 390.w,
                    child: CustomInputWidget(
                        label: "",
                        hint: "Enter your Community Name",
                        Header: "Community Name")),
                20.verticalSpace,
                SizedBox(
                    width: 390.w,
                    child: CustomInputWidget(
                        maxline: 5,
                        label: "",
                        hint: "Type here..",
                        Header: "About")),
                20.verticalSpace,
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20),
          child: CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.communitesyour);
              },
              buttonText: "Create"),
        ),
      ),
    );
  }
}
