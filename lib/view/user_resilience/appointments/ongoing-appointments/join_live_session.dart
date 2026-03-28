import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';

class UserJoinLiveSession extends StatelessWidget {
  const UserJoinLiveSession({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // :small_blue_diamond: Column with both image sections
          Column(
            children: [
              Container(
                width: 430.w,
                height: 466.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(AppAssets.images.livePicture),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(children: []),
              ),
              Container(
                width: 430.w,
                height: 466.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(AppAssets.images.patient),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                        right: 35.w,
                        top: 30.h,
                        child: Icon(
                          Icons.camera_alt,
                          size: 30,
                        )),
                    Opacity(
                      opacity: 0.6,
                      child: Container(
                        width: 348.w,
                        height: 100.h,
                        margin: EdgeInsets.only(bottom: 20.h),
                        decoration: BoxDecoration(
                          color: const Color(0xffE7ECF2),
                          border: Border.all(color: const Color(0xffD0D8E3)),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              AppAssets.icon.muteIcon,
                              width: 60.w,
                              height: 60.h,
                            ),
                            SvgPicture.asset(
                              AppAssets.icon.callingIcon,
                              width: 60.w,
                              height: 60.h,
                            ),
                            SvgPicture.asset(
                              AppAssets.icon.volumeIcon,
                              width: 60.w,
                              height: 60.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ).inkWell(onTap: () {
                Navigator.pop(context);
              })
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                    "assets/images/back.png",
                  width: 40.w,
                  height: 40.h,
                ),
              ),
              title: Text(
                "Live Session",
                style: AppTextStyle.button(
                  color: const Color(0xffFFFFFF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
