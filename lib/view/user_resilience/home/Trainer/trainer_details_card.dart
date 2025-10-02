import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';

class TrainerDetailsCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String age;
  final String experience;
  final String gender;
  final double? width;
  final double? height;
  final String consultingFee;
  final String ratings;
  final double? bottomMargin;
  final double? rightMargin;
  final Widget? bookmarkIcon;
  final bool? isSaved;
  final Widget? viewProfile;
  const TrainerDetailsCard(
      {super.key,
      required this.imageUrl,
      this.width,
      required this.name,
      this.bottomMargin,
      this.viewProfile,
      this.height,
      this.rightMargin,
      required this.age,
      required this.experience,
      required this.gender,
      required this.consultingFee,
      required this.ratings,
      this.isSaved = false,
      this.bookmarkIcon});

  @override
  State<TrainerDetailsCard> createState() => _TrainerDetailsCardState();
}

class _TrainerDetailsCardState extends State<TrainerDetailsCard> {
  late final ValueNotifier<bool> _isSaved;

  @override
  void initState() {
    super.initState();
    _isSaved = ValueNotifier<bool>(widget.isSaved ?? false);
  }

  @override
  void dispose() {
    _isSaved.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 390.w,
      // height: widget.height ?? 121.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      margin: EdgeInsets.only(
          right: widget.rightMargin ?? 00.w, bottom: widget.bottomMargin ?? 0),
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
          color: Color(0xffffffff),
          boxShadow: CustomShadows.defaultShadow,
          border: Border.all(color: Color(0xff1213141A), width: 1.0),
          borderRadius: BorderRadius.circular(15.r)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 90.w,
            height: 121.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.images.doctor2Image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.black.withOpacity(0.2)),
            ),
          ),
          10.w.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: context.onPrimary),
                  ),
                  5.w.horizontalSpace,
                  Image.asset(
                    AppAssets.icon.starIcon,
                    width: 15.88.w,
                    height: 15.2.h,
                  ),
                  5.w.horizontalSpace,
                  Text(
                    widget.ratings,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: context.onPrimaryContainer.withOpacity(0.7)),
                  ),
                ],
              ),
              6.h.verticalSpace,
              Row(
                children: [
                  Text(
                    "${widget.age},",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: context.onPrimary),
                  ),
                  5.w.horizontalSpace,
                  Text(
                    widget.gender,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: context.onPrimary),
                  ),
                ],
              ),
              6.h.verticalSpace,
              Text(
                '${widget.experience} year experience',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: context.onPrimary),
              ),
              6.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Consulting fee:',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: context.onPrimary,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    widget.consultingFee,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0066FF),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  _isSaved.value = !_isSaved.value;
                },
                child: ValueListenableBuilder<bool>(
                  valueListenable: _isSaved,
                  builder: (context, value, _) {
                    if (widget.bookmarkIcon != null) {
                      return widget.bookmarkIcon!;
                    } else {
                      return value
                          ? SvgPicture.asset(
                              AppAssets.icon.bookmarkSave,
                              width: 70.w,
                              height: 70.h,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              AppAssets.icon.bookmarkUnsave,
                              width: 70.w,
                              height: 70.h,
                              fit: BoxFit.cover,
                            );
                    }
                  },
                ),
              ),
              if (widget.viewProfile != null) widget.viewProfile!,
            ],
          ),
        ],
      ),
    );
  }
}
