import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/custom_divider.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(
              title: 'Payment History',
            ),
            body: ListView.builder(
              itemCount: 8,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Money transferred to ***6358 Chase Bank',
                          style: context.titleMedium.copyWith(
                              color: Color(0xff3E2525),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '\$32.00',
                          style: context.titleMedium.copyWith(
                              color: Color(0xff0066FF),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    10.h.verticalSpace,
                    Text(
                      'Aug 25, 2024 | 10:00 AM',
                      style: context.titleMedium.copyWith(
                          color: Color(0xff3E2525),
                          fontWeight: FontWeight.w400),
                    ),
                    10.h.verticalSpace,
                    CustomDivider(),
                    10.h.verticalSpace
                  ],
                ).paddingSymmetric(
                  horizontal: 20.w,
                );
              },
            )));
  }
}
