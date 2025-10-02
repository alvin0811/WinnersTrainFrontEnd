import 'package:winner_trains_app/utils/basic_exports.dart';

class ProfilePicture extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final double? borderWidth;
  final List<BoxShadow>? boxShadow;
  final Color? borderColor;
  final Widget? child; // This will be our camera icon

  const ProfilePicture({
    Key? key,
    this.imageUrl,
    this.height,
    this.width,
    this.borderColor,
    this.borderWidth,
    this.child,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior:
          Clip.none, // Allows the child to be placed outside bounds if needed
      children: [
        /// **Profile Picture**
        Container(
          width: width ?? 151.w,
          height: height ?? 151.h,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            boxShadow: boxShadow ??
                [
                  const BoxShadow(
                    color: Color(0xff00000033),
                    offset: Offset(0, 6),
                    blurRadius: 0.6,
                  )
                ],
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 0,
            ),
            image: DecorationImage(
              image: AssetImage(imageUrl ?? AppAssets.images.userProfile),
              fit: BoxFit.cover,
            ),
          ),
        ),

        /// **Positioned Camera Icon (Child)**
        if (child != null)
          Positioned(
            right: 3.w,
            // top: .h,
            bottom: -12.h,
            child: child!,
          ),
      ],
    );
  }
}
