import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/view/widgets/trainer/Communites_widgets_Cards/discover_card.dart';
import 'package:winner_trains_app/view/widgets/trainer/Communites_widgets_Cards/joined_card.dart';
import 'package:winner_trains_app/view/widgets/trainer/Communites_widgets_Cards/your_card.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/communites_card_view_model.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class Communites extends StatefulWidget {
  const Communites({super.key});

  @override
  State<Communites> createState() => _CommunitesState();
}

class _CommunitesState extends State<Communites> {
   @override


  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CommunitesCardViewModel>(context, listen: false);

    Widget getSelectedScreen(String selected) {
      switch (selected) {
        case "Discover":
          return DiscoverCard();
        case "Joined":
          return JoinedCard();
        case "Your":
          return YourCard();
        default:
          return DiscoverCard();
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
                  ValueListenableBuilder<String>(
                    valueListenable: controller.selectedItem,
                    builder: (context, selected, _) {
                      return Container(
                        width: 390.w,
                        height: 52.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(28.r)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff2238500F),
                              offset: const Offset(0, 1),
                              blurRadius: 10.r,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: controller.items.map((item) {
                            final isSelected = selected == item;
                            return GestureDetector(
                              onTap: () => controller.selectReportSelected(item),
                              child: Container(
                                width: 128.w,
                                height: 46.h,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: isSelected
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
                                    item,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : const Color(0XFF4C5157),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                  10.verticalSpace,
                  Expanded(
                    child: ValueListenableBuilder<String>(
                      valueListenable: controller.selectedItem,
                      builder: (context, selected, _) {
                        return getSelectedScreen(selected);
                      },
                    ),
                  ),
                  30.verticalSpace,
                ],
              ),
            ),
            // Floating button only for "Your" tab
            ValueListenableBuilder<String>(
              valueListenable: controller.selectedItem,
              builder: (context, selected, _) {
                if (selected == "Your") {
                  return Positioned(
                    bottom: 100.h,
                    right: 30.w,
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
                          Navigator.pushNamed(context, RoutesName.createcommunites);
                        },
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        child: Icon(Icons.add, color: Colors.white, size: 40.sp),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
