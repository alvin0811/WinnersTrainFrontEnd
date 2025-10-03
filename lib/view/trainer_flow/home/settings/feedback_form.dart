import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
//import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart';
import 'package:winner_trains_app/view/widgets/image_cards_widget.dart';
import 'package:winner_trains_app/viewModel/user_view_models/help_and_feedback_view_model.dart';

class FeedbackForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HelpAndFeedbackViewModel>(context);
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: "Help & Feedback",
          iconColor: context.onPrimary,
          titleColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Subject Input Field
                CustomTextfield(
                  headerText: 'Subject',
                  customPadding: 12.w,
                  hintText: 'Add Subject',
                ),
                15.verticalSpace,

                // Message Input Field
                CustomTextfield(
                  customPadding: 12.w,
                  headerText: 'Description',
                  //  borderColor: Colors.grey.withOpacity(0.7),
                  hintText: 'Type here...',
                  height: 0.19.sh,
                  maxLines: 6,
                  radius: BorderRadius.circular(15.r),
                ),
                10.verticalSpace,

                Wrap(
                  spacing: 10.w,
                  runSpacing: 10.h,
                  children: [
                    for (File img in viewModel.images) imageCards(context, img),
                    InkWell(
                      onTap: () async {
                        if (viewModel.images.length >= 5) {
                          Utils.errorSnack(
                              context: context,
                              message: "You can't add more than 5 images.");
                          return;
                        }
                        await viewModel.pickImage();
                      },
                      child: DottedBorder(
                      strokeWidth: 0.3,
                      radius: Radius.circular(15.r),
                      borderType: BorderType.RRect,
                      
                        // padding: EdgeInsets.all(6),
                        strokeCap: StrokeCap.square,
                        child: Container(
                          height: 122.h,
                          width: 122.w,
                          // width: double.infinity,
                          // height: 170.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppAssets.icon.addMoreIcon,
                              
                                height: 30.h,
                                width: 30.w,
                              ),
                              Text(
                                "Add More",
                                style: context.bodyMedium.copyWith(
                               color: const Color(0xff4C5157),
                               fontWeight: FontWeight.w400
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomButton(
          height: 52.h,
          width: 400.w,
          text: "Submit",
        ).inkWell(onTap: () {
          Navigator.pushNamed(context, RoutesName.trainerfeedbacksubmitted);
        }).paddingSymmetric(horizontal: 20.w, vertical: 20.h),
      ),
    );
  }
}
