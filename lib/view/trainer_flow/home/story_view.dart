
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';
import 'package:winner_trains_app/view/widgets/trainer/profiles_list_card.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/story_view_model.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class StoryViewScreen extends StatelessWidget {
  StoryViewScreen({super.key});

  final List<Map<String, String>> profileData = [
    {
      "name": "John Smith",
      "subtitle": "Sit amet consectetur adipiscing elit odio,",
      "imagePath": "assets/images/Ellipse 21.png",
    },
    {
      "name": "Hendry Roy",
      "subtitle": "Lorem ipsum dolor sit amet consectetur adipiscing",
      "imagePath": "assets/images/Ellipse 23.png",
    },
    {
      "name": "Alexander Benjamin",
      "subtitle": "Lorem ipsum dolor sit",
      "imagePath": "assets/images/cardprofileimg.png",
    },
    {
      "name": "Alexander Benjamin",
      "subtitle": "Lorem ipsum dolor sit",
      "imagePath": "assets/images/cardprofileimg.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<StoryViewModel>(context);

    return Scaffold(
      body: viewModel.isLoading
          ? Opacity(
             opacity: 0.9,
            child: Container(
               decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Group 15910.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                child: Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
          )
          : Opacity(
              opacity: 0.9,
              child: Container(
                width: double.infinity,
                height: 930.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Group 15910.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    25.verticalSpace,
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 30.h),
                      child: Row(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.bottomCenter,
                            children: [
                              GestureDetector(onTap: () {
                                Navigator.pushNamed(context, RoutesName.resilienceprofile);
                              },
                                child: Container(
                                  width: 60.w,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/cardprofileimg.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -5,
                                child: Image.asset(
                                  "assets/images/Group 15884.png",
                                  width: 43.w,
                                  height: 17.h,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Dr. Evelyn Charlie",
                                  style: GoogleFonts.roboto(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.75,
                                  child: Container(
                                    width: 73.w,
                                    height: 29.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24.r),
                                      color: Color(0xffE7ECF2),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/images/Mask Group 13156.png",
                                            width: 20.w,
                                            height: 20.h,
                                            fit: BoxFit.cover,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            "4271",
                                            style: GoogleFonts.roboto(
                                              fontSize: 12.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: SvgPicture.asset(
                                      "assets/svg/Icon ionic-ios-close.svg",
                                      width: 20.w,
                                      height: 20.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: profileData.length,
                        itemBuilder: (context, index) {
                          final item = profileData[index];
                          return ProfileListItem(
                            imagePath: item["imagePath"]!,
                            name: item["name"]!,
                            subtitle: item["subtitle"]!,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                      child: CustomInputWidget(
                        Header: "",
                        hint: "Write a comment...",
                        suffixIconPath: "assets/svg/Icon akar-paper-airplane (1).svg",
                        label: "",
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
