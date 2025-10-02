import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';

class LiveSessionScreen extends StatelessWidget {
  const LiveSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: 430.w,
                height: 466.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("assets/images/Group 161141.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Stack(children: []),
              ),
              Container(
                width: 430.w,
                height: 466.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("assets/images/123.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                      right: 35.w,
                      top: 30.h,
                      child: Image.asset(
                        "assets/images/Mask Group 14113.png",
                        width: 30.w,
                        height: 30.h,
                      ),
                    ),
                    Opacity(
                      opacity: 0.6,
                      child: Container(
                        width: 348.w,
                        height: 100.h,
                        margin: EdgeInsets.only(
                          bottom: 20.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffE7ECF2),
                          border: Border.all(
                            color: const Color(0xffD0D8E3),
                          ),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/Group 14733.png",
                              width: 60.w,
                              height: 60.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                "assets/images/Group 13828.png",
                                width: 60.w,
                                height: 60.h,
                              ),
                            ),
                            Image.asset(
                              "assets/images/Group 14734.png",
                              width: 60.w,
                              height: 60.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
