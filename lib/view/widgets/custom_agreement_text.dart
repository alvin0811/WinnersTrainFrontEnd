import 'package:winner_trains_app/resources/app_strings.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';

class CustomAgreementText extends StatelessWidget {
  const CustomAgreementText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
       padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(AppStrings.appAgreement, style: context.bodySmall)),
          5.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.termsAndConditions,
                style: context.bodyMedium.copyWith(
                    color: context.onPrimaryContainer,
                    decoration: TextDecoration.underline,
                    decorationColor: context.onPrimaryContainer),
              ).inkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  RoutesName.agreement,
                  arguments: {
                    "index": 1,
                  },
                ),
              ),
              5.w.horizontalSpace,
              Text(
                '|',
                style: context.bodyMedium.copyWith(
                  color: context.onPrimaryContainer,
                ),
              ),
              5.w.horizontalSpace,
              Text(
                AppStrings.privacyPolicy,
                style: context.bodyMedium.copyWith(
                    color: context.onPrimaryContainer,
                    decoration: TextDecoration.underline,
                    decorationColor: context.onPrimaryContainer),
              ).inkWell(onTap: () {
                Navigator.pushNamed(context, RoutesName.agreement, arguments: {
                  "index": 0,
                });
              }),
            ],
          )
        ],
      ),
    );
  }
}
