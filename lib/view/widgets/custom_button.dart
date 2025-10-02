import 'package:winner_trains_app/utils/basic_exports.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? fontcolor;
  final Color? color;
  final double? fontsize;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final Border? border;
  final EdgeInsetsGeometry? padding;
  final FontWeight? fontWeight;
  final Widget? child;
  final LinearGradient? gradient;
  final List<BoxShadow>? boxShadow;
  final bool isGradient;
  //final VoidCallback onTap;
  //final  VoidCallback? onTap;
  const CustomButton(
      { //this.onTap,
      super.key,
      this.isGradient = true,
      this.text,
      this.fontcolor = Colors.white,
      this.color,
      this.fontsize = 16,
      this.height = 50,
      this.width = 390,
      this.padding,
      this.fontWeight = FontWeight.w400,
      this.boxShadow,
      this.child,
      this.borderRadius,
      this.border,
      this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (height ?? 50).h,
      width: (width ?? 390).w,
      decoration: BoxDecoration(
        color: (color != null && isGradient == false) ? color : null,
        gradient: (color == null || isGradient == true)
            ? gradient ?? AppColor.primaryButton
            : null,
        boxShadow: boxShadow ??
            [
              const BoxShadow(
                  blurRadius: 30,
                  offset: Offset(0, 16),
                  color: Color(0xff0000171F)),
            ],
        borderRadius: borderRadius ?? BorderRadius.circular(35.r),
        border: border,
      ),
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
      child: child ??
          Center(
              child: text != null
                  ? Text(
                      text!,
                      style: TextStyle(
                        fontSize: fontsize ?? 16.sp,
                        color: fontcolor,
                        fontWeight: fontWeight,
                      ),
                    )
                  : const SizedBox.shrink()),
    );
  }
}
