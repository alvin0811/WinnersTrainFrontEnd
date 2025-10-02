import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_date_picker.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart';

class AddNewCard extends StatelessWidget {
  const AddNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(
        title: 'Add New Card',
      ),
      body: Column(
        children: [
          CustomTextfield(
            headerText: 'Card Holder',
            headerTextColor: context.onPrimary,
            fontWeight: FontWeight.w500,
            height: 55.h,
            radius: BorderRadius.circular(28.r),
          ),
          18.h.verticalSpace,
          CustomTextfield(
            headerText: 'Card Number',
            headerTextColor: context.onPrimary,
            fontWeight: FontWeight.w500,
            height: 55.h,
            radius: BorderRadius.circular(28.r),
          ),
          18.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextfield(
                  width: 187.w,
                  height: 55.h,
                  headerText: 'Expiry Date',
                  radius: BorderRadius.circular(28.r),
                  headerTextColor: context.onPrimary,
                  fontWeight: FontWeight.w500,
                  suffixIcon: Icon(
                    Icons.calendar_month,
                    size: 24,
                    color: Colors.black.withOpacity(0.5),
                  ).inkWell(onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return CustomDatePicker(
                          initialDate: DateTime.now(),
                          onDateSelected: (date) {
                            print("Selected Date: $date");
                          },
                        );
                      },
                    );
                  })),
              16.w.horizontalSpace,
              CustomTextfield(
                width: 187.w,
                height: 55.h,
                headerText: 'CVV/CVC',
                radius: BorderRadius.circular(28.r),
                headerTextColor: context.onPrimary,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: 20.w, vertical: 20.h),
      bottomNavigationBar: CustomButton(
        text: 'Add Now',
      ).inkWell(onTap: () {
        Navigator.pushNamed(context, RoutesName.paymentMethod);
      }).paddingSymmetric(horizontal: 20.w, vertical: 20.h),
    ));
  }
}
