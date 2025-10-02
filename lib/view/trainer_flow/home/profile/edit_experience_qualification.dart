import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/file_picker_card.dart';
import 'package:winner_trains_app/view/widgets/trainer/custom_dailog_box.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class EditExperienceQualification extends StatelessWidget {
   EditExperienceQualification({super.key});
  
  final TextEditingController awardingInstituteController =
      TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController certificationTypesController =
      TextEditingController();
  final TextEditingController licenseNumberController = TextEditingController();
  final TextEditingController relativeTrainingController =
      TextEditingController();
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
          title: "Experience & Qualifications",
          onBackTap: () {
            showCustomDialog(
              context: context,
              title: "Experience & Qualifications!",
              description: "Are you sure you want to edit?",
              buttonText: "Yes",
              secondaryButtonText: "No",
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.homemain);
                bottomindex.updateIndex(3);
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
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                50.verticalSpace,
                SizedBox(
                  width: 390.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 218.w,
                        child: CustomInputWidget(
                          controller: awardingInstituteController,
                          Header: "Awarding Institute",
                          hint: "Awarding Institute",
                          label: "",
                        ),
                      ),
                       SizedBox(
                        width: 160.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Year",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xff121314),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            10.verticalSpace,
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(28),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xff2238500f),
                                    offset: const Offset(0, 1),
                                    blurRadius: 10.r,
                                  ),
                                ],
                              ),
                              child: DropdownButtonHideUnderline(
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    canvasColor: Colors.white,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                  ),
                                  child: DropdownDatePicker(
                                    menuHeight: 300.h,
                                    showYear: true,
                                    isDropdownHideUnderline: false,
                                    isFormValidator: true,
                                    width: 1,
                                    dayFlex: 1,
                                    monthFlex: 1,
                                    yearFlex: 1,
                                    isExpanded: true,
                                    selectedMonth: 10,
                                    startYear: 1900,
                                    endYear: DateTime.now().year,
                                    hintYear: 'Year',
                                    selectedYear:
                                        int.tryParse(yearController.text),
                                    onChangedYear: (String? year) {
                                      if (year != null) {
                                        yearController.text = year;
                                      }
                                    },
                                    showDay: false,
                                    showMonth: false,
                                    hintTextStyle: TextStyle(
                                      color: const Color(0xff121314),
                                      fontSize: 14.sp,
                                    ),
                                    textStyle: TextStyle(
                                      color: const Color(0xff121314),
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                20.verticalSpace,
                CustomInputWidget(
                  controller: certificationTypesController,
                  Header: "Certification Types",
                  hint: "Certification Types (e.g., LCSW, LMFT, LPC, etc.)",
                  label: "",
                ),
                20.verticalSpace,
                CustomInputWidget(
                  controller: licenseNumberController,
                  keyboardType: TextInputType.number,
                  Header: "License Number",
                  hint: "Enter your License Number",
                  label: "",
                ),
                20.verticalSpace,
                CustomInputWidget(
                  controller: relativeTrainingController,
                  Header: "Relative Training & Experience",
                  hint: "Enter your Relative Training & Experience",
                  label: "adada",
                ),
                20.verticalSpace,
                const FilePickerCard(Header: "Upload Degrees"),
                20.verticalSpace,
                const FilePickerCard(Header: "Upload Certificates"),
                20.verticalSpace,
                const FilePickerCard(Header: "Resume"),
                20.verticalSpace,
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
