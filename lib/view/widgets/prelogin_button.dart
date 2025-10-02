import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class PreloginButton extends StatelessWidget {
  final String? title;
  final String? icon;
  final LinearGradient? gradient;
  final List<BoxShadow>? dropShadow;
  const PreloginButton(
      {super.key, this.title, this.icon, this.gradient, this.dropShadow});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      boxShadow: dropShadow,
      gradient: gradient,
      width: double.infinity,
      height: 52.h,
      borderRadius: BorderRadius.circular(28.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon!,
            width: 24.w,
            height: 24.h,
          ),
          15.w.horizontalSpace,
          Text(
            title!,
            style: context.titleMedium.copyWith(color: context.primary),
          )
        ],
      ),
    );
  }
}
