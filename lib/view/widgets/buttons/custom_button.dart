import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/button_view_model.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String buttonText;
  final VoidCallback? onPressed;
  final double? radius;
  final Color? color;
  final LinearGradient? gradient;
  final bool loading;
  final Duration delay;
  final VoidCallback? navigateAfterDelay;

  const CustomButton({
    Key? key,
    required this.buttonText,
    this.onPressed,
    this.radius,
    this.color,
    this.gradient,
    this.loading = false,
    this.delay = const Duration(seconds: 2),
    this.navigateAfterDelay, this.width, this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ButtonViewModel>(
      create: (_) => ButtonViewModel(),
      builder: (context, child) {
        final model = Provider.of<ButtonViewModel>(context);

        return GestureDetector(
          onTap: () async {
            if (loading) {
              model.startLoading();
              await Future.delayed(delay);
              model.stopLoading();
              if (navigateAfterDelay != null) navigateAfterDelay!();
            } else {
              if (onPressed != null) onPressed!();
            }
          },
          child: Container(
            width: width?? 390.w,
            height: height?? 55.h,
            decoration: BoxDecoration(
              gradient: gradient ??
                  const LinearGradient(
                    colors: [Color(0xff4C5157), Color(0xff121314)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
              color: color ?? const Color(0xff121314),
              borderRadius: BorderRadius.circular(radius ?? 35.r),
            ),
            child: Center(
              child: model.isLoading
                  ? LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.white,
                      size: 28,
                    )
                  : Text(
                      buttonText,
                      style: AppTextStyle.button(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
            ),
          ),
        );
      },
    );
  }
}
