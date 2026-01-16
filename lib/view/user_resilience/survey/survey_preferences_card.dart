
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';
import 'package:winner_trains_app/utils/extensions/custom_border_radius.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/view/widgets/preference_widget.dart';

class SurveyPreferencesCard extends StatelessWidget {
  final List<String> questions;
  final String sections;
  final String sectionDetail;
  final Widget surveyProgressWidget;
  final String sectionCount;
  SurveyPreferencesCard({
    super.key,
    required this.questions,
    required this.sections,
    required this.sectionDetail,
    required this.sectionCount, required this.surveyProgressWidget,
  });

  final List<String> surveyOptions = [
    "Strongly Disagree",
    "Disagree",
    "Neutral",
    "Agree",
    "Strongly Agree"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Survey Progress',
                style: context.titleMedium.copyWith(
                  color: const Color(0xff181818),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                sectionCount,
                style: context.titleMedium.copyWith(
                  color: const Color(0xff181818),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          10.h.verticalSpace,
          surveyProgressWidget,
          50.h.verticalSpace,
          Text(
             sections,
            style: context.titleMedium.copyWith(
                color: const Color(0xff181818),
                fontWeight: FontWeight.w600,
                fontSize: 16.sp),
          ),
          5.h.verticalSpace,
          Text(
            sectionDetail,
            style: context.titleMedium.copyWith(
                color: const Color(0xff181818),
                fontWeight: FontWeight.w300,
                fontSize: 14.sp),
          ),
          10.h.verticalSpace,
          ListView.builder(
              itemCount: surveyOptions.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
                  margin: EdgeInsets.only(bottom: 12.h),
                  decoration: BoxDecoration(
                      color: context.primary,
                      boxShadow: CustomShadows.defaultShadow,
                      borderRadius: CustomBorderRadius.medium,
                      border: CustomBorder.thin(color: Color(0xff1213141A))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        questions[index],
                        style: context.titleMedium
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      15.h.verticalSpace,
                      PreferenceCard(
                        preferencesOptions: surveyOptions,
                        runSpacing: 10.h,
                        spacing: 5.w,
                        gradient: AppColor.secondaryButton,
                        fontSize: 14.sp,
                      )
                    ],
                  ),
                );
              }),
        ],
      ).paddingSymmetric(horizontal: 20.w),
    );
  }
}

// final ValueNotifier<int?> selectedIndex = ValueNotifier<int?>(null);

  // @override
  // void dispose() {
  //   selectedIndex.dispose();
  //   super.dispose();
  // }