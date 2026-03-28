import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';

class CustomTabbar extends StatelessWidget {
  final double height;
  final double width;
  final List<String> items;
  final ValueNotifier<String> val;

  CustomTabbar({
    super.key,
    required this.items,
    required this.height,
    required this.width,
    required this.val,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52.h,
     // padding: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        color: context.primary,
        border: Border.all(color: Color(0xff12131405)),
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: CustomShadows.defaultShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 3.0),
        child: Row(
             //   mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(items.length, (index) {
            return ValueListenableBuilder<String>(
                valueListenable: val,
                builder: (c, v, _) {
                  return Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        boxShadow: v == items[index]
                            ? [
                                BoxShadow(
                                    color: Colors.blue.withOpacity(0.2),
                                    blurRadius: 15.r,
                                    offset: Offset(0, 6))
                              ]
                            : null,
                        borderRadius: BorderRadiusDirectional.circular(28.r),
                        gradient:
                            v == items[index] ? AppColor.secondaryButton : null),
                    child: Center(
                      child: Text(
                        items[index],
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: v == items[index]
                                ? context.primary
                                : context.onPrimaryContainer),
                      ),
                    ),
                  ).inkWell(onTap: () {
                    val.value = items[index];
                  });
                });
          }),
        ),
      ),
    );
  }
}
