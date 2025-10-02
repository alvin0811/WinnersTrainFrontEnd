import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/subcription_view_model.dart';

class SetFilterScreen extends StatelessWidget {
  const SetFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubscriptionViewModel>(
      create: (_) => SubscriptionViewModel(),
      child: Scaffold(
        body: SafeArea(
          child: Consumer<SubscriptionViewModel>(
            builder: (context, viewModel, _) {
              return Stack(
                children: [
                
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/123.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        25.verticalSpace,
                        const Spacer(),
                        Opacity(
                          opacity: 0.8,
                          child: Container(
                            width: 370.w,
                            height: 96.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              color: const Color(0xffD0D8E3),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x1F000000),
                                  blurRadius: 12,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _icon(),
                                  _icon(),
                                  GestureDetector(
                                    onTap: () {
                                      print("Image tapped");
                                      viewModel.startLoading(context);
                                    },
                                    child: _imageToShow(),
                                  ),
                                  _icon(),
                                  _icon(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        20.verticalSpace,
                      ],
                    ),
                  ),

                  // ✅ Loader logic shown here using state
                  if (viewModel.value.isLoading || viewModel.value.liveText.isNotEmpty)
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.9),
                        child: Center(
                          child: viewModel.value.liveText.isNotEmpty
                              ? Text(
                                  viewModel.value.liveText,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  '${viewModel.value.counter}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 48.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),

                  // AppBar
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AppBar(
                      centerTitle: true,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(
                          "assets/images/back.png",
                          width: 40.w,
                          height: 40.h,
                        ),
                      ),
                      actions: [
                        Image.asset("assets/images/Group 16098.png"),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _icon() {
    return Image.asset(
      "assets/images/Ellipse 653.png",
      width: 42.w,
      height: 42.h,
      fit: BoxFit.cover,
    );
  }

  Widget _imageToShow() {
    return Image.asset(
      "assets/images/Group 138281.png",
      width: 72.w,
      height: 72.h,
      fit: BoxFit.cover,
    );
  }
}


class GoLiveOverlay extends StatelessWidget {
  const GoLiveOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SubscriptionViewModel>(context);

    return ValueListenableBuilder<SubscriptionState>(
      valueListenable: viewModel,
      builder: (context, state, _) {
        if (state.isLoading || state.liveText.isNotEmpty) {
          return Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.9),
              child: Center(
                child:
                    state.liveText.isNotEmpty
                        ? Text(
                          state.liveText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                        : Text(
                          "${state.counter}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
