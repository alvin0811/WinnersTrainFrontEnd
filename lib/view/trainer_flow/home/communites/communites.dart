import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/view/widgets/trainer/Communites_widgets_Cards/discover_card.dart';
import 'package:winner_trains_app/view/widgets/trainer/Communites_widgets_Cards/joined_card.dart';
import 'package:winner_trains_app/view/widgets/trainer/Communites_widgets_Cards/your_card.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/communites_card_view_model.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class Communites extends StatelessWidget {
  const Communites({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CommunitesCardViewModel>(context);
    Widget getSelectedScreen() {
      switch (controller.reportSelected) {
        case 0:
          return const DiscoverCard();
        case 1:
          return const JoinedCard();
        case 2:
          return YourCard();
        default:
          return const DiscoverCard();
      }
    }

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  20.verticalSpace,
                  Container(
                    width: 390.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(28.r,)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff2238500F),
                          offset: const Offset(0, 1),
                          blurRadius: 10.r,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          controller.reportFilters.length,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                controller.selectReportSelected(index);
                              },
                              child: Container(
                                width: 128.w,
                                height: 42.h,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: controller.reportSelected == index
                                        ? [
                                            const Color(0xFFE2CFCF),
                                            const Color(0xFF008B88),
                                          ]
                                        : [
                                            const Color(0xffFFFFFF),
                                            const Color(0xffFFFFFF),
                                          ],
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(26.r),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    controller.reportFilters[index],
                                    style: TextStyle(
                                      color: controller.reportSelected != index
                                          ? const Color(0XFF4C5157)
                                          : Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Expanded(child: getSelectedScreen()),
                  30.verticalSpace,
                ],
              ),
            ),
            if (controller.reportSelected == 2)
              Positioned(
                bottom: 100.h,
                right: 30.w,
                child: Opacity(
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
                        Navigator.pushNamed(
                            context, RoutesName.createcommunites);
                      },
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      child: Icon(Icons.add, color: Colors.white, size: 40.sp),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
