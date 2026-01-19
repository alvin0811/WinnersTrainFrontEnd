import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/auth_view_model.dart';

class ContentPreference extends StatefulWidget {
  final String? preferencesOptions;
  ContentPreference({super.key, this.preferencesOptions});

  @override
  State<ContentPreference> createState() => _ContentPreferenceState();
}

class _ContentPreferenceState extends State<ContentPreference> {
  final List<String> preferences = [
    'Stress-Related',
    'Depression',
    'Fear',
    'Anxiety',
    'Motivation',
    'Irritation',
    'Anger',
    'Sadness',
    'Worry',
    'Envy'
  ];

  final ValueNotifier<int?> selectedIndex = ValueNotifier<int?>(null);

  @override
  void dispose() {
    selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: 'Content Preferences',
          fontsize: 16.sp,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                width: 390.w,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 10,
                  clipBehavior: Clip.none,
                  color: Colors.white,
                  shadowColor: const Color(0xff2238500F),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What mental health issues do you\n specialize in?",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: const Color(0xff121314),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        CustomInputWidget(
                          Header: "",
                          hint: "Other (Type Here)",
                          label: "",
                          onComplete: (newOption) {
                            if (newOption.isNotEmpty) {
                              Provider.of<AuthViewModel>(
                                context,
                                listen: false,
                              ).addCustomOption(newOption);
                            }
                          },
                        ),
                        20.verticalSpace,
                        Consumer<AuthViewModel>(
                          builder: (context, provider, _) {
                            return Wrap(
                              spacing: 35.w,
                              runSpacing: 20.h,
                              children: [
                                ...provider.defaultOptions.map((option) {
                                  bool isSelected =
                                      provider.selectedOptions.contains(option);
                                  return GestureDetector(
                                    onTap: () {
                                      isSelected
                                          ? provider.deselectOption(option)
                                          : provider.selectOption(option);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 10.h,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xffB3BDCC),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          28.r,
                                        ),
                                        gradient: isSelected
                                            ? const LinearGradient(
                                                colors: [
                                                  Color(0xFFE2CFCF),
                                                  Color(0xFF008B88),
                                                ],
                                                stops: [0.0, 0.6],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              )
                                            : null,
                                        color: isSelected ? null : Colors.white,
                                      ),
                                      child: Text(
                                        option,
                                        style: TextStyle(
                                          color: isSelected
                                              ? const Color(0xffFFFFFF)
                                              : const Color(0xff48576E),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                                ...provider.options.map((option) {
                                  bool isSelected =
                                      provider.selectedOptions.contains(option);
                                  bool isCustom =
                                      !provider.defaultOptions.contains(option);

                                  return GestureDetector(
                                    onTap: () {
                                      isSelected
                                          ? provider.deselectOption(option)
                                          : provider.selectOption(option);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 10.h,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xffB3BDCC),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          28.r,
                                        ),
                                        gradient: isSelected
                                            ? const LinearGradient(
                                                colors: [
                                                  Color(0xFFE2CFCF),
                                                  Color(0xFF008B88),
                                                ],
                                                stops: [0.0, 0.6],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              )
                                            : null,
                                        color: isSelected ? null : Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            option,
                                            style: TextStyle(
                                              color: isSelected
                                                  ? const Color(0xffFFFFFF)
                                                  : const Color(0xff48576E),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          if (isCustom)
                                            GestureDetector(
                                              onTap: () {
                                                Provider.of<AuthViewModel>(
                                                  context,
                                                  listen: false,
                                                ).removeCustomOption(option);
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: 6.w,
                                                ),
                                                child: Icon(
                                                  Icons.close,
                                                  size: 18.sp,
                                                  color: const Color(
                                                    0xffFF4D4D,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.onboardingSurvey);
                },
                child: Text(
                  'Skip',
                  style: context.titleMedium.copyWith(color: Color(0xffE70000)),
                )),
            30.h.verticalSpace,
            CustomButton(text: 'Continue').inkWell(
                onTap: () =>
                    Navigator.pushNamed(context, RoutesName.onboardingSurvey)),
          ],
        ).paddingSymmetric(horizontal: 20.w, vertical: 20.h),
      ),
    );
  }
}
