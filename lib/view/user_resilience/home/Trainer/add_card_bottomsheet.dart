import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_bottomsheet.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_checkbox.dart';
import 'package:winner_trains_app/view/widgets/custom_drop_down.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart';

void addCardBottomSheet(
  BuildContext context,
  bool isFromDrawer,
) {
  List<String> icons = [
    AppAssets.icon.card1,
    AppAssets.icon.card2,
    AppAssets.icon.card3,
    AppAssets.icon.card4,
  ];
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return CustomBottomSheet(
        // height: 523.h,
        heightFactor: 0.92,
        title: 'Add Card',
        bodyContent: Column(
          children: [
            10.h.verticalSpace,
            CustomTextfield(
              headerText: 'Card Information',
              hintText: 'Card Number',
              radius: BorderRadius.circular(10.r),
              suffixIcon: SizedBox(
                width: 160.w,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: icons.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: Image.asset(
                          icons[index],
                          width: 30.w,
                          height: 20.h,
                        ),
                      );
                    }),
              ),
            ),
            Row(
              children: [
                CustomTextfield(
                  width: 192.w,
                  radius: BorderRadius.circular(10.r),
                  hintText: 'MM / YY',
                ),
                CustomTextfield(
                  width: 192.5.w,
                  radius: BorderRadius.circular(10.r),
                  hintText: 'CVC',
                ),
              ],
            ),
            15.h.verticalSpace,
            MyDropdownWidget(
              Header: 'Billing Address',
              radius: 10.r,
              selectedValue: 'United States',
              options: ['United States'],
              text: 'Country or Region',
              onChanged: (value) {
                print(value);
              },
            ),
            CustomTextfield(
              radius: BorderRadius.circular(10.r),
              hintText: 'ZIP',
            ),
            Row(
              children: [
                CustomCheckbox(
                  activeColor: context.primary,
                  CheckColor: context.onPrimaryContainer,
                  stateColor: context.primary,
                  uncheckColor: context.primary,
                ),
                10.w.horizontalSpace,
                Text(
                  'Save this card for future payments',
                  style: context.bodySmall,
                ),
              ],
            ),
          ],
        ),
        footerContent: Padding(
          padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
          child: CustomButton(
            text: 'Pay \$100.00',
          ).inkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                RoutesName.successPlanUpgrade,
                arguments: {
                  "isFromDrawer": isFromDrawer,
                },
              );
            },
          ),
        ),
      );
    },
  );
}
