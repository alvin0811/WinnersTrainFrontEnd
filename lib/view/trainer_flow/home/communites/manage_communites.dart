import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class ManageCommunites extends StatelessWidget {
  ManageCommunites({super.key});

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
                leading: Icon(Icons.camera_alt),
                title: Text('Take Photo'),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? image = await picker.pickImage(source: ImageSource.camera);
                  if (image != null) selectedImage.value = File(image.path);
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Choose from Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
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
         appBar: MainHomeAppBar(title: "Manage Community",
         onBackTap: () {
               Navigator.pushNamed(context, RoutesName.homemain);
                            bottomindex.updateIndex(1); 
         },),
        
        body: SizedBox(width: double.infinity,
          child: Column(
            children: [
              20.verticalSpace,
              SizedBox(
                width: 390.w,
                height: 175.h,
                child: GestureDetector(
                  onTap: () => _pickFile(context),
                  child: DottedBorder(
                    strokeWidth: 1,
                    radius: Radius.circular(15.0),
                    dashPattern: const [6, 8],
                    borderType: BorderType.RRect,
                    color: const Color(0xFFD0D8E3),
                    child: Card(
                      elevation: 0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: ValueListenableBuilder<File?>(
                          valueListenable: selectedImage,
                          builder: (context, file, _) {
                            return file == null
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset("assets/svg/upload.svg"),
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
                                    ],
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(12.r),
                                    child: Image.file(
                                      file,
                                      width: double.infinity,
                                      height: 150.h,
                                      fit: BoxFit.cover,
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
                  child: CustomInputWidget(label: 
                  "", hint: "Category", Header: "Category")
                ),
                 20.verticalSpace,
              SizedBox(
                  width: 390.w,
                  child: CustomInputWidget(label: 
                  "", hint: "Enter your Community Name", Header: "Community Name")
                ),
                 20.verticalSpace,
              SizedBox(
                  width: 390.w,
                  child: CustomInputWidget(maxline: 5,
                    label: 
                  "", hint: "Type here..", Header: "About")
                ),20.verticalSpace,
                
            ],
          ),
        ),
        bottomNavigationBar:  Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20),
          child: CustomButton(onPressed: () {
                      Navigator.pushNamed(context, RoutesName.communitesyour);
          },
            buttonText: "Update"),
        ),
      ),
    );
  }
}
