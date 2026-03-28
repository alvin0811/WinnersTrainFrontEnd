import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/filter_bottomsheet.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final Color? iconColor;
  final Color? titleColor;
  final bool? isTransparent;
  final Widget? icon;
  final double? height;
  final FontWeight? fontWeight;
  final double? fontsize;
  final PreferredSizeWidget? bottom;

  const CustomAppBar(
      {super.key,
      this.title,
      this.fontWeight,
      this.onBack,
      this.actions,
      this.iconColor,
      this.isTransparent,
      this.titleColor,
      this.fontsize,
      this.height,
      this.icon,
      this.bottom});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        bottom: bottom,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: InkWell(
          onTap: onBack ?? () => Navigator.of(context).pop(),
          child: icon ??
              Image.asset(
                "assets/images/back.png",
                width: 40.w,
                height: 40.h,
              ),
        ),
        centerTitle: true,
        title: title != null
            ? Text(
                title!,
                style: context.titleMedium.copyWith(
                    color: titleColor ?? context.onPrimary,
                    fontWeight: fontWeight ?? FontWeight.bold),
              )
            : null,
        actions: actions ?? []);
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 60.0);
}

class CustomAppBarProfile extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? oncallBack;
  final List<Widget>? actionsHome;
  final Color? titleColor;
  final bool? isTransparent;
  final Widget? icon;
  final Widget? image;
  final double? height;
  final FontWeight? fontWeight;

  const CustomAppBarProfile(
      {super.key,
      this.title,
      this.oncallBack,
      this.actionsHome,
      this.isTransparent,
      this.titleColor,
      this.icon,
      this.fontWeight,
      this.height,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppAssets.images.appBarBackground),
                fit: BoxFit.fill),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: icon != null
                    ? InkWell(
                        onTap: oncallBack ?? () => Navigator.of(context).pop(),
                        child: icon,
                      )
                    : SizedBox.shrink(),
                centerTitle: true,
                title: title != null
                    ? Text(
                        title!,
                        style: context.titleMedium.copyWith(
                            color: titleColor ?? context.primary,
                            fontWeight: fontWeight ?? FontWeight.bold),
                      )
                    : null,
                actions: actionsHome),
          ),
        ),
        image ??
            Positioned(
              bottom: -15.h,
              left: 20.w,
              right: 20.w,
              child: CustomTextfield(
                  readonly: true,
                  prefixIcon: SvgPicture.asset(
                    AppAssets.icon.searchIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                  hintText: 'Search...',
                  hintColor: Color(0xff9BA8BB),
                  hintTextSize: 14.sp,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SvgPicture.asset(AppAssets.icon.filterIcon,
                            color: context.onPrimaryContainer)
                        .inkWell(onTap: () {
                      filterSearchBottomSheet(context, true);
                    }),
                  )),
            ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 136.h);
}

// class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final String? headline;
//   final String? subHeadline;
//   final bool? authType;
//   final bool? isBackIcon;
//   final double? height;
//   const AuthAppBar({
//     super.key,
//     required this.title,
//     this.headline,
//     this.authType,
//     this.isBackIcon,
//     this.subHeadline,
//     this.height,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//               AppAssets.images.appBarBackground,
//             ),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             AppBar(
//               backgroundColor: Colors.transparent,
//               elevation: 0.0,
//               centerTitle: true,
//               automaticallyImplyLeading: false,
//               leading: isBackIcon == true
//                   ? InkWell(
//                       onTap: () => Navigator.of(context).pop(),
//                       child: SvgPicture.asset(
//                         AppAssets.icon.arrowBackIcon,
//                         width: 40.w,
//                         height: 40.h,
//                       ),
//                     )
//                   : null,
//               title: Text(
//                 title,
//                 style: context.titleMedium.copyWith(
//                   color: context.primary,
//                 ),
//               ),
//             ),
//             26.h.verticalSpace,
//             Image.asset(
//               AppAssets.images.appLogo,
//               width: 203.w,
//               height: 165.h,
//             ),
//             25.h.verticalSpace,
//             if (authType == true)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     headline ?? "Welcome",
//                     style: context.headlineMedium.copyWith(
//                       color: context.primary,
//                     ),
//                   ),
//                   10.h.verticalSpace,
//                   Text(
//                     subHeadline ?? "Select user type!",
//                     style: context.titleMedium.copyWith(
//                         color: Colors.white.withOpacity(0.6),
//                         fontWeight: FontWeight.w100),
//                   ),
//                   15.h.verticalSpace,
//                   SvgPicture.asset(AppAssets.images.authDivider),
//                 ],
//               ),
//           ],
//         ));
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(height ?? 401.0.h);
// }
