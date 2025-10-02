
import 'package:flutter_svg/svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/trainer_details_card.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';


class BookMarkedResilienceTrainer extends StatelessWidget {
  const BookMarkedResilienceTrainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(
              title: 'Best Resilience Trainer',
              fontsize: 16.sp,
            ),
            body: SingleChildScrollView(
                child: Column(
              children: [
              
                ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 7,
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
                          bookmarkIcon: SvgPicture.asset(
                                          AppAssets.icon.bookmarkSave,
                                          width: 75.w,
                                          height: 75.h,
                                          fit: BoxFit.cover,
                                        ),
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