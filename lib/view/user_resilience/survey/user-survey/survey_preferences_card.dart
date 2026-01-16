import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';
import 'package:winner_trains_app/utils/extensions/custom_border_radius.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/view/widgets/preference_widget.dart';

class SurveyPreferencesCard extends StatefulWidget {
  const SurveyPreferencesCard({
    super.key,
  });

  @override
  _SurveyQuestionState createState() => _SurveyQuestionState();
}

class _SurveyQuestionState extends State<SurveyPreferencesCard> {
  final List<String> surveyOptions = [
    "Very Much Like Me",
    "Like Me",
    "Neutral",
    "Very much UnLike Me",
    "UnLike Me"
  ];
  final List<String> surveyQuestions = [
    'I experience deep emotions when I see beautiful things.',
    'I experience deep emotions when I see beautiful things.',
    'I always speak up in protest when I hear someone say mean things.',
    'I am always coming up with new ways to do things.',
    'I have many interests.',
    'I always treat people fairly whether I like them or not.',
    'I do not want to see anyone suffer, even my worst enemy.',
    'I always keep my promises.',
    'I can always find the positive in what seems negative to others .',
    'I try to add some humor to whatever I do.',
  ];
  final ValueNotifier<int?> selectedIndex = ValueNotifier<int?>(null);

  @override
  void dispose() {
    selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            width: double.infinity,
            height: 113.h,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(-0.23, 0.97),
                  end: Alignment(0.23, -0.97),
                  colors: [
                    Color(0xffFFFFFF),
                    Color(0xffDDEAF3)
                  ], // Example colors
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xff0000000F),
                      offset: Offset(0, 0),
                      blurRadius: 15.r)
                ],
                borderRadius: CustomBorderRadius.medium,
                border: CustomBorder.dynamicBorder(
                    color: context.primary, width: 1.5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Survey Progress',
                  style: context.titleMedium.copyWith(
                      color: const Color(
                        0xff181818,
                      ),
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          10.h.verticalSpace,
          ListView.builder(
              itemCount: surveyQuestions.length,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
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
                        surveyQuestions[index],
                        style: context.titleMedium
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      15.h.verticalSpace,
                      PreferenceCard(
                        preferencesOptions: surveyOptions,
                        runSpacing: 14.h,
                        spacing: 13.w,
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
