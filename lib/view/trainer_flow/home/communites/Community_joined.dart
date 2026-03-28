import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/resources/app_assets.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/trainer/custom_socail_bottom_sheet.dart';
import 'package:winner_trains_app/view/widgets/trainer/home_widgets/home_card_widget.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/communites_card_view_model.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/home_card_view_model.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';
import 'package:winner_trains_app/utils/app_colors.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class CommunitesJoined extends StatelessWidget {
  const CommunitesJoined({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomindex = Provider.of<TrainerMainHomeViewModel>(context);
    final vm = Provider.of<CommunitesCardViewModel>(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MainHomeAppBar(
          title: "Community",
          onBackTap: () {
            Navigator.pushNamed(context, RoutesName.homemain);
            bottomindex.updateIndex(1);
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                AppAssets.images.community,
                fit: BoxFit.cover,
                width: 430.w,
                height: 261.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesName.comyourrtressrelated);
                          },
                          child: Row(
                            children: [
                              Text("Stress-Related",
                                  style: AppTextStyle.heading()),
                              8.horizontalSpace,
                              SvgPicture.asset(
                                "assets/svg/Mask Group 13145.svg",
                                width: 24.w,
                                height: 24.h,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/Group 15634.png",
                              width: 23.w,
                              height: 19.h,
                            ),
                            5.horizontalSpace,
                            Text(
                              "Public",
                              style: AppTextStyle.button(
                                color: const Color(0xff4C5157),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    16.verticalSpace,
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/svg/Group 15637.svg",
                          width: 24.w,
                          height: 24.h,
                        ),
                        8.horizontalSpace,
                        Text(
                          "1.6M members",
                          style: AppTextStyle.button(
                            color: const Color(0xff4C5157),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    16.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.communitydetail,
                              );
                              vm.selectReportSelected("Discover");
                            },
                            child: Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.r),
                                color: Colors.white,
                                border:
                                    Border.all(color: const Color(0xff0AB2AE)),
                              ),
                              child: Center(
                                child: Text(
                                  "Leave",
                                  style: AppTextStyle.button(
                                    color: const Color(0xff4C5157),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: SizedBox(
                            height: 40.h,
                            child: CustomButton(
                              buttonText: "Invite",
                              onPressed: () {
                                showModalBottomSheet(
                                  backgroundColor: AppColors.backgroundColor,
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) =>
                                      const SocialMediaBottomSheet(
                                    showSuggestions: false,
                                    heightFactor: 0.18,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    Consumer<HomeCardViewModel>(
                      builder: (context, viewModel, child) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: viewModel.items.length,
                          itemBuilder: (context, index) {
                            final item = viewModel.items[index];
                            return HomeCard(item: item, index: index);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Opacity(
          opacity: 1.0,
          child: Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xff4C5157), Color(0xff121314)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              border: Border.all(color: Colors.white, width: 3.0),
            ),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.createpost);
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Icon(Icons.add, color: Colors.white, size: 40.sp),
            ),
          ),
        ),
      ),
    );
  }
}
