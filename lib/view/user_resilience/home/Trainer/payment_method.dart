
import 'package:flutter_svg/svg.dart';

import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';

import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int?> selectedBankNotifier = ValueNotifier<int?>(null);
    List<Map<String, String>> paymentMethods = [
      {"name": "Google Pay", "icon": AppAssets.icon.googlePayIcon},
      {"name": "Apple Pay", "icon": AppAssets.icon.smallAppleIcon},
      {"name": "PayPal", "icon": AppAssets.icon.paypalIcon},
      {"name": "**** **** **** 6592", "icon": AppAssets.icon.masterCardIcon},
    ];
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: "Select Payment Method",
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ValueListenableBuilder<int?>(
                valueListenable: selectedBankNotifier,
                builder: (context, selectedBank, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: paymentMethods.length,
                    itemBuilder: (context, index) {
                      final bank = paymentMethods[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Container(
                          width: double.infinity,
                          height: 60.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 15.h),
                          clipBehavior: Clip.none,
                          decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              boxShadow: CustomShadows.defaultShadow,
                              border: Border.all(
                                  color: Color(0xff1213141A), width: 1.0),
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Row(
                            children: [
                              10.horizontalSpace,
                              Radio<int>(
                                activeColor: context.secondary,
                                // fillColor:
                                //     WidgetStatePropertyAll(context.onPrimary),
                                value: index,
                                groupValue: selectedBank,
                                onChanged: (value) {
                                  selectedBankNotifier.value = value;
                                },
                              ),
                              10.horizontalSpace,
                              Text(
                                bank["name"]!,
                                textAlign: TextAlign.center,
                                style: context.titleMedium.copyWith(
                                  color: Color(0xff1D1D1D),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              SvgPicture.asset(
                                bank["icon"]!,
                                height: 30.h,
                                width: 30.h,
                              ),
                              10.horizontalSpace,
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.add_circle,
                    color: context.onPrimaryContainer,
                    size: 20.sp,
                  ),
                  5.horizontalSpace,
                  InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, RoutesName.newCard),
                    child: Text(
                      "Add Card",
                      textAlign: TextAlign.center,
                      style: context.titleMedium.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: context.onPrimary,
                        color: context.onPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            //   showDialog(
            //     context: context,
            //  //   builder: (context) => const PaymentMethodUpgradeDialogue(),
            //   );
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomButton(
              text: "Pay Now",
            ).inkWell(onTap: ()=> Navigator.pushNamed(context, RoutesName.successBookingSchedule))
          ),
        ),
      ),
    );
  }
}
