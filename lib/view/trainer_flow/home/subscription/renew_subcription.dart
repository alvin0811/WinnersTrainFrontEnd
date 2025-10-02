import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/custom_divider.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/utils/routes/global.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class RenewSubcription extends StatelessWidget {
  // final bool isfromLiveSession;
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);
  RenewSubcription({super.key});

  @override
  Widget build(BuildContext context) {
    final subscriptions = [
      {
        "title": "Monthly Package",
        "amount": 60,
        "description": "Lorem ipsum dolor sit amet, consecte\nadipiscing elit",
        "icon": AppAssets.icon.checkGreenIcon
      },
      {
        "title": "6-Month Package",
        "amount": 80,
        "description": "Lorem ipsum dolor sit amet, consecte\nadipiscing elit",
        "icon": AppAssets.icon.checkGreenIcon
      },
      {
        "title": "Yearly Package",
        "amount": 100,
        "description": "Lorem ipsum dolor sit amet, consecte\nadipiscing elit",
        "icon": AppAssets.icon.checkGreenIcon
      },
    ];
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Subscription',
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Already Subscribed Monthly Plan',
                    style: context.labelLarge
                        .copyWith(fontSize: 16.sp, color: Color(0xff3E2525))),
                10.h.verticalSpace,
                CustomDivider(),
                10.h.verticalSpace,
                Row(
                  children: [
                    Text('Date:',
                        style: context.titleMedium.copyWith(
                            color: Color(0xff3E2525),
                            fontWeight: FontWeight.w600)),
                    5.w.horizontalSpace,
                    Text('01-02-2024',
                        style: context.titleMedium
                            .copyWith(color: Color(0xff3E2525))),
                  ],
                ),
                10.h.verticalSpace,
                CustomDivider(),
                10.h.verticalSpace,
                Row(
                  children: [
                    Text('Time:',
                        style: context.titleMedium.copyWith(
                            color: Color(0xff3E2525),
                            fontWeight: FontWeight.w600)),
                    5.w.horizontalSpace,
                    Text('02:00 PM',
                        style: context.titleMedium.copyWith(
                          color: Color(0xff3E2525),
                        )),
                  ],
                ),
                20.h.verticalSpace,
                CarouselSlider.builder(
                  itemCount: subscriptions.length,
                  itemBuilder: (context, index, realIndex) {
                    final subscription = subscriptions[index];
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 495.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 15.h),
                          clipBehavior: Clip.none,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image: AssetImage(
                                    AppAssets.images.containerBackground,
                                  ),
                                  fit: BoxFit.fitWidth),
                              color: Color(0xffffffff),
                              boxShadow: CustomShadows.defaultShadow,
                              border: Border.all(
                                  color: Color(0xff1213141A), width: 1.0),
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Column(
                            children: [
                              Text(subscription["title"] as String,
                                  style: context.labelLarge
                                      .copyWith(color: context.primary)),
                              150.h.verticalSpace,
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 10.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                subscription['icon'] as String,
                                                width: 17.w,
                                                height: 17.h,
                                              ),
                                              10.w.horizontalSpace,
                                              Text(
                                                subscription['description']
                                                    as String,
                                                style: context.bodySmall
                                                    .copyWith(
                                                        color: context
                                                            .onPrimaryContainer
                                                            .withOpacity(0.5)),
                                              )
                                            ],
                                          ),
                                          10.h.verticalSpace,
                                          index < 4
                                              ? MySeparator(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                )
                                              : SizedBox.shrink()
                                        ],
                                      ),
                                    );
                                  })
                            ],
                          ),
                        ),
                        Positioned(
                            top: 60.h,
                            left: 90.w,
                            right: 90.w,
                            child: Container(
                              width: 50.w,
                              height: 100.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 15.h),
                              clipBehavior: Clip.none,
                              decoration: BoxDecoration(
                                  color: context.primary,
                                  boxShadow: CustomShadows.defaultShadow,
                                  border: Border.all(
                                      color: Color(0xff1213141A), width: 3.0),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 15.h),
                                  clipBehavior: Clip.none,
                                  decoration: BoxDecoration(
                                      color: context.primary,
                                      boxShadow: CustomShadows.defaultShadow,
                                      border: Border.all(
                                          color: Color(0xff1213141A),
                                          width: 1.0),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Text(
                                    "\$${subscription['amount']}.00",
                                    style: context.headlineLarge
                                        .copyWith(fontWeight: FontWeight.bold),
                                  )),
                            )),
                        index == 0
                            ? Positioned(
                                bottom: 28,
                                left: 25.w,
                                right: 25.w,
                                child: Row(
                                  children: [
                                    CustomButton(
                                      height: 48.h,
                                      width: 162.w,
                                      color: context.primary,
                                      border: Border.all(
                                          color: Color(0xff0AB2AE), width: 1.0),
                                      isGradient: false,
                                      text: 'Cancel Subscription',
                                      fontcolor: context.onPrimary,
                                      fontsize: 12.sp,
                                    ),
                                    16.w.horizontalSpace,
                                    CustomButton(
                                      height: 48.h,
                                      width: 159.w,
                                      text: "Renew Subscription",
                                      fontsize: 12.sp,
                                    ).inkWell(onTap: () {
                                      G().paymentConfirmation =
                                          PaymentConfirmation.fromsubscription;
                                      Navigator.pushNamed(
                                        context,
                                        RoutesName.paymentMethod,
                                      );
                                    }),
                                  ],
                                ),
                              )
                            : Positioned(
                                bottom: 28,
                                left: 25.w,
                                right: 25.w,
                                child: CustomButton(
                                  height: 48.h,
                                  text: "Upgrade Plan",
                                  fontsize: 14.sp,
                                ).inkWell(onTap: () {
                                      G().paymentConfirmation =
                                          PaymentConfirmation.fromsubscription;
                                  Navigator.pushNamed(
                                      context, RoutesName.paymentMethod,
                                    
                                  );
                                }),
                              )
                      ],
                    );
                  },
                  options: CarouselOptions(
                    height: 550.h,
                    viewportFraction: 0.9,
                    autoPlay: false,
                    autoPlayInterval: const Duration(seconds: 5),
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      _currentIndexNotifier.value = index;
                    },
                  ),
                ),
                ValueListenableBuilder<int>(
                  valueListenable: _currentIndexNotifier,
                  builder: (context, currentIndex, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: subscriptions.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: currentIndex == entry.key ? 12.0 : 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentIndex == entry.key
                                  ? context.onPrimary
                                  : Colors.grey.withOpacity(0.6),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ).paddingSymmetric(horizontal: 20.w, vertical: 20.h)));
  }
}

class MySeparator extends StatelessWidget {
  MySeparator({Key? key, this.height = 1, required this.color})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
