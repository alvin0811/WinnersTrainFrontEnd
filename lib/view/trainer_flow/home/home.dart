import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/view/widgets/trainer/home_widgets/home_card_widget.dart';
import 'package:winner_trains_app/view/widgets/trainer/home_widgets/story_Card.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/home_card_view_model.dart';
import 'package:winner_trains_app/utils/app_colors.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class Home extends StatelessWidget {
  final List<String> storyCards = [
    'story1',
    'story2',
    'story3',
  ]; // Example list of
  //  story cards
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Consumer<HomeCardViewModel>(
                builder: (context, viewModel, child) {
                  return Column(
                    children: [
                      40.verticalSpace,
                      SizedBox(
                        width: 390.w,
                        height: 140.h,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: storyCards.length + 1,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(width: 3.w),
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              return Opacity(
                                opacity: 0.90,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutesName.subscriptionplan);
                                  },
                                  child: Container(
                                    width: 119.w,
                                    height: 140.h,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/Rectangle 1141.png",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        Positioned(
                                          bottom: 8,
                                          right: 5,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  RoutesName.subscriptionplan);
                                            },
                                            child: Image.asset(
                                              "assets/images/Group 16085.png",
                                              width: 30.w,
                                              height: 30.h,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                            return GestureDetector(
                              onTap: () {},
                              child: StoryCardWidget(
                                story: storyCards[index - 1],
                                imageIndex: 1,
                              ),
                            );
                          },
                        ),
                      ),
                      0.verticalSpace,
                      SizedBox(
                        width: 390.w,
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: Text("Feed",
                              style: AppTextStyle.heading(
                                fontSize: 18.sp,
                              )),
                          title: SizedBox(
                            width: 331.w,
                            child: const Divider(
                              thickness: 0.2,
                              color: Color(0xffBAC4D4),
                            ),
                          ),
                        ),
                      ),
                      0.verticalSpace,
                      SizedBox(
                        width: 390.w,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: viewModel.items.length,
                          itemBuilder: (context, index) {
                            final item = viewModel.items[index];
                            return HomeCard(item: item, index: index);
                          },
                        ),
                      ),
                      30.verticalSpace,
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
