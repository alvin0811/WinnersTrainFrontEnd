import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'basic_exports.dart';

class AppConfig {
  static const String assetImagePath = "assets/images/";
  static const String assetIconPath = "assets/icons/";
}

class Utils {
  static SpinKitThreeBounce spinkit = SpinKitThreeBounce(
    color: AppColor.lightScheme.secondary,
  );
  static SpinKitThreeBounce spinkitCircle({double? size}) => SpinKitThreeBounce(
        color: AppColor.lightScheme.primary,
        size: size ?? 50.0,
      );

  static Future<dynamic> loader(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => PopScope(
        canPop: false,
        child: spinkit,
      ),
    );
  }

  static Flushbar<dynamic> successBar(
      {required BuildContext context, required String message}) {
    return Flushbar(
      margin: EdgeInsets.symmetric(horizontal: 0.048.sw, vertical: 0.021.sh),
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 2),
      borderRadius: BorderRadius.circular(15.r),
      message: message,
      messageColor: AppColor.lightScheme.onSecondary,
      backgroundColor: AppColor.lightScheme.secondary,
      icon: Icon(
        Icons.check_circle,
        // color: AppColor.white,
      ),
    )..show(context);
  }

  static Flushbar<dynamic> warningBar(
      {required BuildContext context, required String message}) {
    return Flushbar(
      margin: EdgeInsets.symmetric(horizontal: 0.048.sw, vertical: 0.021.sh),
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 2),
      borderRadius: BorderRadius.circular(15.r),
      message: message,
      messageColor: AppColor.lightScheme.onSecondary,
      backgroundColor: AppColor.lightScheme.secondary,
      icon: Icon(
        Icons.check_circle,
        color: AppColor.lightScheme.onPrimary,
      ),
    )..show(context);
  }

  static dynamic errorSnack(
      {required BuildContext context, required String message}) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        backgroundColor: context.error.withOpacity(0.8),
        content: Text(
          message,
          style: context.bodySmall.copyWith(
            color: Colors.white,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }

  static dynamic warningSnack(
      {required BuildContext context, required String message}) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        backgroundColor: context.secondary,
        content: Text(
          message,
          style: context.bodySmall.copyWith(
            color: context.onPrimary,
          ),
        ),
      ),
    );
  }
}
