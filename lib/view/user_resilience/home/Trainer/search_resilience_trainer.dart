import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/filter_bottomsheet.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/trainer_details_card.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart';

class SearchResilienceTrainer extends StatelessWidget {
  const SearchResilienceTrainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(
              title: 'Search Resilience Trainer',
              onBack: () {
                // Navigator.pop(context);
                Navigator.pop(context);
              },
              fontsize: 16.sp,
            ),
            body: SingleChildScrollView(
                child: Column(
              children: [
                CustomTextfield(
                    // readonly: true,
                    prefixIcon: SvgPicture.asset(
                      AppAssets.icon.searchIcon,
                      width: 24.w,
                      height: 24.h,
                    ),
                    hintText: 'Search...',
                    hintColor: Color(0xff9BA8BB),
                    hintTextSize: 14.sp,
                    suffixIcon: Image.asset(
                      AppAssets.icon.filterIcon,
                      color: context.onPrimaryContainer,
                    ).inkWell(onTap: () {
                      filterSearchBottomSheet(context,false);
                    })),
                25.h.verticalSpace,
                ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (c, i) => TrainerDetailsCard(
                          viewProfile: Text(
                            'View Profile',
                            style: context.titleMedium.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                decoration: TextDecoration.underline,
                                decorationColor: context.onPrimary),
                          ).inkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, RoutesName.trainerProfile)),
                          bottomMargin: 10.h,
                          imageUrl: AppAssets.images.trainerImage,
                          name: 'Dr.Lucas Henry',
                          ratings: '4.8',
                          age: '54',
                          gender: 'Male',
                          experience: '42',
                          consultingFee: '\$100.00',
                        )),
              ],
            ).paddingSymmetric(horizontal: 20.w, vertical: 20.h))));
  }
}
