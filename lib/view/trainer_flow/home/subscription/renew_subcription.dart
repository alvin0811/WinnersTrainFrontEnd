import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/resources/app_assets.dart';
import 'package:winner_trains_app/resources/extensions/context_extension.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_checkbox.dart';
import 'package:winner_trains_app/view/widgets/custom_drop_down.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart'
    show CustomTextfield;
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/thank_you)dialog.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';
import 'package:winner_trains_app/utils/app_colors.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';
import 'package:dotted_line/dotted_line.dart';

class RenewSubcription extends StatelessWidget {
  RenewSubcription({super.key});

  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  final List<Map<String, dynamic>> subscriptions = [
    {
      "title": "Monthly Package",
      "amount": 60,
      "features": [
        "Lorem ipsum dolor sit amet consectetur adipiscing",
        "Lorem ipsum dolor sit amet consectetur adipiscing",
        "Lorem ipsum dolor sit amet consectetur adipiscing",
        "Lorem ipsum dolor sit amet consectetur adipiscing",
      ],
    },
    {
      "title": "6-Month Package",
      "amount": 80,
      "features": [
        "Lorem ipsum dolor sit amet consectetur adipiscing",
        "Lorem ipsum dolor sit amet consectetur adipiscing",
        "Lorem ipsum dolor sit amet consectetur adipiscing",
        "Lorem ipsum dolor sit amet consectetur adipiscing",
      ],
    },
    {
      "title": "Yearly Package",
      "amount": 100,
      "features": [
        "Lorem ipsum dolor sit amet consectetur adipiscing",
        "Lorem ipsum dolor sit amet consectetur adipiscing",
        "Lorem ipsum dolor sit amet consectetur adipiscing",
        "Lorem ipsum dolor sit amet consectetur adipiscing",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bottomindex = Provider.of<TrainerMainHomeViewModel>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MainHomeAppBar(
          title: "Subscription",
          onBackTap: () {
            Navigator.pushNamed(context, RoutesName.homemain);
            bottomindex.updateIndex(0);
          },
        ),
        body: Column(
          children: [
            10.verticalSpace,
            SizedBox(
              width: 390.w,
              child: Text("Already Subscribed Monthly Plan",
                  style: AppTextStyle.subHeading(
                    fontWeight: FontWeight.bold,
                  )),
            ),
            10.verticalSpace,
            Container(width: 390.w, height: 1.h, color: Colors.grey),
            10.verticalSpace,
            SizedBox(
              width: 390.w,
              child: Row(
                children: [
                  Text("Date: ",
                      style: AppTextStyle.subHeading(
                        fontWeight: FontWeight.bold,
                      )),
                  Text("01-02-2024",
                      style: AppTextStyle.body(
                        color: Color(0xff4C5157),
                      )),
                ],
              ),
            ),
            10.verticalSpace,
            Container(width: 390.w, height: 1.h, color: Colors.grey),
            10.verticalSpace,
            SizedBox(
              width: 390.w,
              child: Row(
                children: [
                  Text("Time: ",
                      style: AppTextStyle.subHeading(
                        fontWeight: FontWeight.bold,
                      )),
                  Text("02:00 PM",
                      style: AppTextStyle.body(
                        color: Color(0xff4C5157),
                      )),
                ],
              ),
            ),
            20.verticalSpace,
            CarouselSlider.builder(
              itemCount: subscriptions.length,
              itemBuilder: (context, index, realIndex) {
                final subscription = subscriptions[index];
                final features = subscription["features"] as List<String>;

                return Container(
                  width: 1.sw,
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 120.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20.r),
                                  ),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffFFCEB3),
                                      Color(0xff0AB2AE),
                                    ],
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(subscription["title"],
                                        style: AppTextStyle.heading(
                                            color: Colors.white)),
                                    10.verticalSpace,
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: -35,
                                child: Container(
                                  width: 170.w,
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 100.w,
                                      height: 70.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Center(
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                  text:
                                                      "\$${subscription['amount']}.",
                                                  style:
                                                      AppTextStyle.heading()),
                                              TextSpan(
                                                  text: "00",
                                                  style: AppTextStyle.body()),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          40.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 20.h,
                            ),
                            child: Column(
                              children: features.map((feature) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.h,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.check_circle_outline,
                                        size: 18,
                                        color: Colors.green,
                                      ),
                                      10.horizontalSpace,
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                                maxLines: 2,
                                                feature,
                                                style: AppTextStyle.body(
                                                  color: Color(0xff4C5157),
                                                )),
                                            10.verticalSpace,
                                            const DottedLine(
                                              direction: Axis.horizontal,
                                              lineLength: double.infinity,
                                              lineThickness: 2.0,
                                              dashLength: 8.0,
                                              dashColor: Colors.black,
                                              dashGapLength: 4.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: -15,
                        child: SizedBox(
                          width: 390.w,
                          child: Center(
                            child: index == 0
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 160.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            35.r,
                                          ),
                                          color: Colors.white,
                                          border: Border.all(
                                            color: const Color(0xff0AB2AE),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text("Cancel Subscription",
                                              style: AppTextStyle.body(
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      ),
                                      10.horizontalSpace,
                                      SizedBox(
                                        width: 160.w,
                                        height: 40.h,
                                        child: CustomButton(
                                          buttonText: "Renew Subscription",
                                          onPressed: () =>
                                              _showBottomSheet(context),
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    width: 320.w,
                                    height: 40.h,
                                    child: CustomButton(
                                      buttonText: "Upgrade Plan",
                                      onPressed: () =>
                                          _showBottomSheet(context),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                clipBehavior: Clip.none,
                height: 540.h,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                onPageChanged: (index, reason) {
                  _currentIndexNotifier.value = index;
                },
              ),
            ),
            60.verticalSpace,
            ValueListenableBuilder<int>(
              valueListenable: _currentIndexNotifier,
              builder: (context, currentIndex, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: subscriptions.asMap().entries.map((entry) {
                    return Container(
                      width: currentIndex == entry.key ? 12.0 : 8.0,
                      height: 8.0,
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == entry.key
                            ? Colors.black
                            : Colors.grey.withOpacity(0.4),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  List<String> icons = [
    AppAssets.icon.card1,
    AppAssets.icon.card2,
    AppAssets.icon.card3,
    AppAssets.icon.card4,
  ];
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      final bottomindex = Provider.of<TrainerMainHomeViewModel>(context);
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 30,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  10.verticalSpace,
                  Text(
                      textAlign: TextAlign.center,
                      "Add Card",
                      style: AppTextStyle.heading()),
                  Column(
                    children: [
                      CustomTextfield(
                        headerText: 'Card Information',
                        hintText: 'Card Number',
                        radius: BorderRadius.circular(10.r),
                        suffixIcon: SizedBox(
                          width: 160.w,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: icons.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: Image.asset(
                                    icons[index],
                                    width: 30.w,
                                    height: 20.h,
                                  ),
                                );
                              }),
                        ),
                      ),
                      Row(
                        children: [
                          CustomTextfield(
                            width: 192.w,
                            radius: BorderRadius.circular(10.r),
                            hintText: 'MM / YY',
                          ),
                          CustomTextfield(
                            width: 192.5.w,
                            radius: BorderRadius.circular(10.r),
                            hintText: 'CVC',
                          ),
                        ],
                      ),
                      15.h.verticalSpace,
                      MyDropdownWidget(
                        Header: 'Billing Address',
                        radius: 10.r,
                        selectedValue: 'United States',
                        options: const ['United States'],
                        text: 'Country or Region',
                        onChanged: (value) {
                          print(value);
                        },
                      ),
                      CustomTextfield(
                        radius: BorderRadius.circular(10.r),
                        hintText: 'ZIP',
                      ),
                      Row(
                        children: [
                          CustomCheckbox(
                            activeColor: context.primary,
                            CheckColor: context.onPrimaryContainer,
                            stateColor: context.primary,
                            uncheckColor: context.primary,
                          ),
                          10.w.horizontalSpace,
                          Text(
                            'Save this card for future payments',
                            style: context.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      buttonText: "Pay \$100.00",
                      onPressed: () {
                        Navigator.pop(context);

                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          barrierColor: AppColors.backgroundColor.withOpacity(
                            0.8,
                          ),
                          builder: (context) {
                            return ThankYouDialog(
                              buttontext: "Back to home",
                              title: "Thank You!",
                              description:
                                  "Your plan has been upgraded successfully!",
                              onContinue: () {
                                Navigator.pushNamed(
                                  context,
                                  RoutesName.homemain,
                                );
                                bottomindex.updateIndex(0);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10), // 👈 just a little breathing room
                ],
              ),
            ),
          ),

          // 🎯 SVG Positioned on Top
          Positioned(
            top: -35.h,
            left: MediaQuery.of(context).size.width * 0.23,
            right: MediaQuery.of(context).size.width * 0.23,
            child: SvgPicture.asset("assets/svg/Group 15364.svg"),
          ),
        ],
      );
    },
  );
}
