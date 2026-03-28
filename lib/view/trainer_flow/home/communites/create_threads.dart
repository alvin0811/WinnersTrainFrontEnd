import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/thank_you)dialog.dart'
    show ThankYouDialog;
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/utils/app_colors.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class CreateThreads extends StatefulWidget {
  const CreateThreads({super.key});

  @override
  State<CreateThreads> createState() => _CreateThreadsState();
}

class _CreateThreadsState extends State<CreateThreads> {
  final ValueNotifier<File?> selectedFile = ValueNotifier(null);
  final ValueNotifier<String?> fileName = ValueNotifier(null);
  final ValueNotifier<String?> fileExtension = ValueNotifier(null);

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      selectedFile.value = File(result.files.single.path!);
      fileName.value = result.files.single.name;
      fileExtension.value = result.files.single.extension;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final bottomindex = Provider.of<TrainerMainHomeViewModel>(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const MainHomeAppBar(title: "Create Threads "),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 390.w,
                  child: CustomInputWidget(
                    label: "",
                    hint: "Add Title",
                    Header: "Title",
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: 390.w,
                  child: CustomInputWidget(
                    radius: 15.r,
                    maxline: 5,
                    label: "",
                    hint: "Type here...",
                    Header: "Description",
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: 390.w,
                  child: GestureDetector(
                    onTap: _pickFile,
                    child: DottedBorder(
                      strokeWidth: 1,
                      radius: const Radius.circular(15.0),
                      dashPattern: [6, 8],
                      borderType: BorderType.RRect,
                      color: const Color(0xFFD0D8E3),
                      child: Container(
                        height: 175.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: ValueListenableBuilder<String?>(
                            valueListenable: fileName,
                            builder: (context, name, _) {
                              return ValueListenableBuilder<String?>(
                                valueListenable: fileExtension,
                                builder: (context, extension, _) {
                                  return ValueListenableBuilder<File?>(
                                    valueListenable: selectedFile,
                                    builder: (context, file, _) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              "assets/svg/upload.svg"),
                                          SizedBox(height: 10.h),
                                          Text(
                                            name ?? "Add More",
                                            textAlign: TextAlign.center,
                                            style: AppTextStyle.button(
                                              color: const Color(0xff4C5157),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10.h),
                                          if (extension == 'jpg' ||
                                              extension == 'jpeg' ||
                                              extension == 'png')
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.file(
                                                file!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          if (extension == 'pdf')
                                            const Text(
                                              "PDF File Selected, display in PDF viewer.",
                                            ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                SizedBox(
                  width: 390.w,
                  child: CustomButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        barrierColor:
                            AppColors.backgroundColor.withOpacity(0.8),
                        builder: (context) {
                          return ThankYouDialog(
                            buttontext: "Go Back",
                            title: "Thank You!",
                            description: "Your Post has been Shared!",
                            onContinue: () {
                              Navigator.pushNamed(
                                  context, RoutesName.communitesyour);
                            },
                          );
                        },
                      );
                    },
                    buttonText: "Post",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
