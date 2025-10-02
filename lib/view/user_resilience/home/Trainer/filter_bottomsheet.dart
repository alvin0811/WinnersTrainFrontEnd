import 'package:flutter_svg/svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_bottomsheet.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_checkbox.dart';
import 'package:winner_trains_app/view/widgets/custom_drop_down.dart';
// import 'package:winner_trains_app/view/widgets/custom_textfield.dart';

TextEditingController c1 = TextEditingController();
TextEditingController c2 = TextEditingController();
void filterSearchBottomSheet(BuildContext context, bool isFromHome) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CustomBottomSheet(
          heightFactor: 1.4.h,
          title: 'Search Filter',
          bodyContent: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
              //   child: Text(
              //     'Select Specialization',
              //     style: context.bodySmall.copyWith(
              //       color: context.onPrimary,
              //     ),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              // TextFormField(
              //   controller: c1,
              //      onTapOutside: (event) {
              //        FocusScope.of(context).unfocus();
              //   },
              //   //keyboardType: TextInputType.text,
              //   obscureText: false, // or true if needed
              //   decoration: InputDecoration(
              //     contentPadding:
              //         EdgeInsets.symmetric(vertical: 17.h, horizontal: 20.w),
              //     hintText: ' Specialization',
              //     hintStyle: TextStyle(
              //       fontSize: 14.sp,
              //       color: Color(0xff9BA8BB),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(30.r),
              //       borderSide: const BorderSide(
              //         color: Color(0xff12131405),
              //         width: 1.0,
              //       ),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(30.r),
              //       borderSide: const BorderSide(
              //         color: Color.fromARGB(18, 58, 58, 56),
              //         width: 1.0,
              //       ),
              //     ),
              //     filled: true,
              //     fillColor: Colors.white,
              //   ),
              //   style: TextStyle(
              //     fontSize: 14.sp,
              //     fontWeight: FontWeight.w500,
              //     color: Theme.of(context).colorScheme.onPrimary,
              //   ),
              // ),
              MyDropdownWidget(
                  options: [
                    'Stress Management',
                    'Mindfulness',
                    'Trauma Recovery',
                    'Leadership',
                    'Goal Setting',
                  ],
                  selectedValue: '',
                  onChanged: (String value) {
                    print(value);
                  },
                  text: ' Select Specialization',
                  Header: ' Specialization'),
              10.h.verticalSpace,
              Padding(
                padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
                child: Text(
                  'Experience',
                  style: context.bodySmall.copyWith(
                    color: context.onPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              TextFormField(
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                controller: c2,
                //keyboardType: TextInputType.text,
                obscureText: false, // or true if needed
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.h, horizontal: 20.w),
                  hintText: 'Enter Years of Experience',
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xff9BA8BB),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                    borderSide: const BorderSide(
                      color: Color(0xff12131405),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                    borderSide: const BorderSide(
                      color: Color(0xff12131405),
                      width: 1.0,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              15.h.verticalSpace,
              Text(
                'Select Rating',
                style:
                    context.titleMedium.copyWith(fontWeight: FontWeight.w600),
              ),
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  int rating = 5 - index;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCheckbox(
                        activeColor: context.primary,
                        CheckColor: context.onPrimaryContainer,
                        stateColor: context.primary,
                        uncheckColor: context.primary,
                      ),
                      Row(
                        children: List.generate(5, (starIndex) {
                          return Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: SvgPicture.asset(
                              starIndex < rating
                                  ? AppAssets.icon.yellowRatingStar
                                  : AppAssets.icon.greyRatingStar,
                              width: 24.w,
                              height: 24.h,
                            ),
                          );
                        }),
                      ),
                      Spacer(),
                      Text(rating.toStringAsFixed(1),
                          style: context.titleMedium),
                    ],
                  );
                },
              ),
              30.h.verticalSpace,
              const CustomButton(
                text: 'Apply',
              ).inkWell(onTap: () {
                if (isFromHome == true) {
                  Navigator.pushReplacementNamed(
                    context,
                    RoutesName.searchResilienceTrainer,
                  );
                } else {
                  Navigator.of(context).pop();
                }
              }
                  //   Navigator.pop(context);}
                  ),
            ],
          ),
        ).inkWell(onTap: () {});
      });
}
