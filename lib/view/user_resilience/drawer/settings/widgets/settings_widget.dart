 import 'package:flutter_svg/svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/custom_divider.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';

Widget sectionHeader(BuildContext context, String icon, String title) {
    return Row(
      children: [
        SvgPicture.asset(icon, width: 24.w, height: 24.h),
        16.w.horizontalSpace,
        Text(
          title,
          style: context.titleMedium.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget settingsCard(List<Widget> children, {double verticalPadding = 20.0}) {
    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.symmetric(horizontal: 15.w, vertical: verticalPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: CustomShadows.defaultShadow,
        border: Border.all(color: const Color(0xff1213141A), width: 1.0),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: children
            .expand((widget) => [
                  widget,
                  if (widget != children.last) ...[
                    15.h.verticalSpace,
                    CustomDivider(),
                    15.h.verticalSpace,
                  ],
                ])
            .toList(),
      ),
    );
  }


class SettingsWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final String? iconPath;
  final bool isToggleSwitch;
  final ValueNotifier<bool>? isSelected;

  const SettingsWidget({
    super.key,
    required this.imagePath,
    required this.text,
    this.iconPath,
    this.isToggleSwitch = false,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              imagePath,
              width: 24.w,
              height: 24.h,
            ),
            16.w.horizontalSpace,
            Text(
              text,
              style:
                  context.titleMedium.copyWith(color: const Color(0xff2C2C2C)),
            )
          ],
        ),
        Row(
          children: [
            if (isToggleSwitch && isSelected != null)
              ValueListenableBuilder<bool>(
                valueListenable: isSelected!,
                builder: (_, value, __) {
                  return Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: value,
                      onChanged: (newVal) => isSelected!.value = newVal,
                      activeTrackColor: Colors.green,
                      activeColor: Colors.white,
                      inactiveThumbColor: const Color(0xff48576E),
                      inactiveTrackColor: const Color(0xffE0E7F0),
                    ),
                  );
                },
              )
            else if (iconPath != null)
              SvgPicture.asset(
                iconPath!,
                width: 24.w,
                height: 24.h,
              ),
          ],
        ),
      ],
    );
  }
}
