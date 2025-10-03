import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/help_feedback_view_model.dart';

class HelpAndFeedbackAddimageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FeedbackProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          width: 390.w,
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 10.w,
            runSpacing: 10.h,
            children: List.generate(
              provider.images.length < 5 ? provider.images.length + 1 : 5,
              (index) {
                if (index == provider.images.length &&
                    provider.images.length < 5) {
                  // Add More Button
                  return GestureDetector(
                    onTap: () => provider.pickImages(),
                    child: DottedBorder(
                      strokeWidth: 0.3,
                      radius: Radius.circular(15.r),
                      borderType: BorderType.RRect,
                      child: Container(
                        width: 122.w,
                        height: 121.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x0F223850),
                              blurRadius: 6,
                              spreadRadius: 1,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/svg/Icon akar-cloud-upload (1).svg",
                                width: 26.w,
                                height: 23.h,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                "Add More",
                                style: AppTextStyle.button(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff4C5157),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topRight,
                    children: [
                      Opacity(
                        opacity: 0.7,
                        child: Container(
                          width: 122.w,
                          height: 121.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: const Color(0xffFFE9B8)),
                            image: DecorationImage(
                              image: FileImage(provider.images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5.h,
                        right: 5.w,
                        child: GestureDetector(
                          onTap: () => provider.removeImage(index),
                          child: SvgPicture.asset(
                            "assets/svg/Group 12885.svg",
                            width: 33.w,
                            height: 33.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
