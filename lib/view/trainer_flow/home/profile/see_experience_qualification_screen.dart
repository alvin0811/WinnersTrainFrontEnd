import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class SeeExperienceQualificationScreen extends StatelessWidget {
  const SeeExperienceQualificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MainHomeAppBar(
          title: "Experience & Qualifications",
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.editexperiencequalification,
                );
              },
              child: Image.asset("assets/images/edit.png"),
            ),
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                20.verticalSpace,
                SizedBox(
                  width: 390.w,
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    child: Column(
                      children: [
                        10.verticalSpace,
                        _buildDetailsRow(
                          "Awarding Institute:",
                          "Lorem ipsum dolor",
                        ),
                        10.verticalSpace,
                        _buildDetailsRow("Year:", "2016"),
                        10.verticalSpace,
                        _buildDetailsRow(
                          "Certification Type:",
                          "Lorem ipsum dolor",
                        ),
                        10.verticalSpace,
                        _buildDetailsRow("License Number:", "124547876976"),
                        10.verticalSpace,
                        _buildDetailsRow(
                          "Relative Training & Experience:",
                          "5 Years",
                        ),
                        10.verticalSpace,
                        SizedBox(
                          width: 360.w,
                          child: Text(
                            "Degree(s)",
                            style: AppTextStyle.button(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        SizedBox(
                          width: 360.w,
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/Rectangle 710.png",
                                width: 169.w,
                                height: 131.h,
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                "assets/images/Rectangle 7101.png",
                                width: 169.w,
                                height: 131.h,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        10.verticalSpace,
                        SizedBox(
                          width: 360.w,
                          child: Text(
                            "Certificate(s)",
                            style: AppTextStyle.button(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        SizedBox(
                          width: 360.w,
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/Rectangle 4471.png",
                                width: 169.w,
                                height: 131.h,
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                "assets/images/Rectangle 4472.png",
                                width: 169.w,
                                height: 131.h,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 360.w,
                          child: Text(
                            "Resume",
                            style: AppTextStyle.button(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Opacity(
                          opacity: 0.5,
                          child: Container(
                            width: 360.w,
                            height: 200.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(15.r),
                              image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/Rectangle 4472.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 180.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.file_download_outlined,
                                          color: Colors.white,
                                          size: 20.sp,
                                        ),
                                        8.horizontalSpace,
                                        Text(
                                          "Download Resume",
                                          style: GoogleFonts.roboto(
                                            fontSize: 14.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Consumer<ProfileViewModel>(
                                //   builder: (context, viewModel, _) {
                                //     return GestureDetector(
                                //       onTap: () {
                                //         if (!viewModel.isLoading) {
                                //           viewModel.downloadResume(context);
                                //         }
                                //       },
                                //       child: Container(
                                //         width: 180.w,
                                //         height: 40.h,
                                //         decoration: BoxDecoration(
                                //           border: Border.all(
                                //             color: Colors.white,
                                //           ),
                                //           color: Colors.black,
                                //           borderRadius: BorderRadius.circular(
                                //             50.r,
                                //           ),
                                //         ),
                                //         child: Center(
                                //           child:
                                //               viewModel.isLoading
                                //                   ? SizedBox(
                                //                     width: 20.sp,
                                //                     height: 20.sp,
                                //                     child:
                                //                         const CircularProgressIndicator(
                                //                           strokeWidth: 2,
                                //                           color: Colors.white,
                                //                         ),
                                //                   )
                                //                   : Row(
                                //                     mainAxisSize:
                                //                         MainAxisSize.min,
                                //                     children: [
                                //                       Icon(
                                //                         Icons
                                //                             .file_download_outlined,
                                //                         color: Colors.white,
                                //                         size: 20.sp,
                                //                       ),
                                //                       8.horizontalSpace,
                                //                       Text(
                                //                         "Download Resume",
                                //                         style:
                                //                             GoogleFonts.roboto(
                                //                               fontSize: 14.sp,
                                //                               color:
                                //                                   Colors.white,
                                //                               fontWeight:
                                //                                   FontWeight
                                //                                       .w600,
                                //                             ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //         ),
                                //       ),
                                //     );
                                //   },
                                // ),
                              ],
                            ),
                          ),
                        ),
                        20.verticalSpace,
                      ],
                    ),
                  ),
                ),
                50.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildDetailsRow(String label, String value) {
  return SizedBox(
    width: 360.w,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_detailText(label), _detailValue(value)],
        ),
        3.verticalSpace,
        Divider(color: const Color(0xFFDDE2E8), thickness: 1),
      ],
    ),
  );
}

Widget _detailText(String label) => Text(
      label,
      style: AppTextStyle.button(
        fontWeight: FontWeight.bold,
      ),
    );

Widget _detailValue(String value) => Opacity(
      opacity: 0.5,
      child: Text(
        value,
        style: AppTextStyle.button(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
