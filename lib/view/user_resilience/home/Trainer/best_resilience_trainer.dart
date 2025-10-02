import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/trainer_details_card.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/viewModel/user_view_models/home_view_model.dart';

enum TrainerRoute { fromsurvey, fromhome }

class BestResilienceTrainer extends StatelessWidget {
  final TrainerRoute trainerRoute;
  const BestResilienceTrainer({super.key, required this.trainerRoute});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UserHomeViewModel>(context);

    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(
              title: 'Best Resilience Trainer',
              fontsize: 16.sp,
              onBack: () {
                if (trainerRoute == TrainerRoute.fromhome) {
                  Navigator.pop(context);
                } else {
                  Navigator.popUntil(context, (r) => r.isFirst);
                  vm.index = 0;
                }
              },
            ),
            body: SingleChildScrollView(
                child: Column(
              children: [
                ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (c, i) => TrainerDetailsCard(
                          viewProfile: Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: Text(
                              'View Profile',
                              style: context.titleMedium.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  decoration: TextDecoration.underline,
                                  decorationColor: context.onPrimary),
                            ).inkWell(
                                onTap: () => Navigator.pushNamed(
                                    context, RoutesName.trainerProfile)),
                          ),
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
