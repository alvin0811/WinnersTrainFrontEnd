import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/file_picker_card.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';

class ExperienceQualifications extends StatelessWidget {
  ExperienceQualifications({super.key});
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
    return Container(
      decoration: const BoxDecoration(
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
          title: Text("Experience & Qualifications",
              style: AppTextStyle.button(
                fontWeight: FontWeight.bold,
              )),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/images/back.png"),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                20.verticalSpace,
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
                              style: AppTextStyle.body(
                                  fontWeight: FontWeight.w600),
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
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  canvasColor: Colors.white,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  inputDecorationTheme:
                                      const InputDecorationTheme(
                                    border: InputBorder
                                        .none, // 👈 remove underline globally
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                                child: DropdownDatePicker(
                                  menuHeight: 300.h,
                                  showYear: true,
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
                                  hintTextStyle: AppTextStyle.body(),
                                  textStyle: AppTextStyle.body(),
                                  // 👇 override decoration here too
                                  inputDecoration: const InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            )
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
                  keyboardType: TextInputType.number,
                  controller: licenseNumberController,
                  Header: "License Number",
                  hint: "Enter your License Number",
                  label: "",
                ),
                20.verticalSpace,
                CustomInputWidget(
                  controller: relativeTrainingController,
                  Header: "Relative Training & Experience",
                  hint: "Enter your Relative Training & Experience",
                  label: "",
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
            loading: false,
            buttonText: "Continue",
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.ailability);
            },
          ),
        ),
      ),
    );
  }
}
