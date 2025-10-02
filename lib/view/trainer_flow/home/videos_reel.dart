import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/trainer/custom_socail_bottom_sheet.dart';
import 'package:winner_trains_app/utils/app_colors.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/vedeo_player_view_model.dart';

class VideosReel extends StatelessWidget {
  const VideosReel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> videoUrls = [
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Opacity(
        opacity: 0.9,
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: videoUrls.length,
          itemBuilder: (context, index) {
            return ChangeNotifierProvider(
              create: (context) {
                final provider = VideoPlayerProvider();
                provider.initialize(videoUrls[index]);
                return provider;
              },
              child: Stack(
                children: [
                  const VideoPlayerItem(),
                  _buildOverlay(context),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildOverlay(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset("assets/images/back.png"),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: AppColors.backgroundColor,
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          gradient: AppColors.bottomsheetGradient,
                        ),
                        child: FractionallySizedBox(
                          heightFactor: 0.25.h,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 30.h),
                                    Text("Options",
                                        style: AppTextStyle.heading()),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                            print('Save Post tapped');
                                          },
                                          child: ListTile(
                                            leading: SvgPicture.asset(
                                              "assets/svg/savepost.svg",
                                            ),
                                            title: Text(
                                              'Save Post',
                                              style: AppTextStyle.button(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 370.w,
                                          height: 1,
                                          color: const Color(0xffE0E7F0),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              RoutesName.trainerReportissue,
                                            );
                                          },
                                          child: ListTile(
                                            leading: SvgPicture.asset(
                                              "assets/svg/reportpost.svg",
                                            ),
                                            title: Text(
                                              'Report Post',
                                              style: AppTextStyle.button(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: -35.h,
                                left: MediaQuery.of(context).size.width * 0.23,
                                right: MediaQuery.of(context).size.width * 0.23,
                                child: SvgPicture.asset(
                                  "assets/svg/Group 15364.svg",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Image.asset("assets/images/88.png"),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 180.h,
          right: 10.w,
          child: Column(
            children: [
              Consumer<VideoPlayerProvider>(
                builder: (context, provider, _) {
                  return GestureDetector(
                    onTap: provider.toggleLikeIcon,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/Mask Group 131131.png",
                          color:
                              provider.isIconLike ? Colors.white : Colors.blue,
                          width: 24.w,
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          "236",
                          style: AppTextStyle.body(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.commentsscreen);
                },
                child: _iconWithText(
                  "assets/images/Mask Group 131132.png",
                  "36",
                ),
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: AppColors.backgroundColor,
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => const SocialMediaBottomSheet(),
                  );
                },
                child: _iconWithText(
                  "assets/images/Mask Group 131134.png",
                  "Share",
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 5.h,
          left: 10.w,
          right: 10.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 330.w,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 28.r,
                    backgroundImage: const AssetImage(
                      "assets/images/userprofile.png",
                    ),
                  ),
                  title: Text(
                    "Alexander Benjamin",
                    style: AppTextStyle.button(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "New York, USA",
                    style: AppTextStyle.body(color: Colors.white70),
                  ),
                  trailing: Consumer<VideoPlayerProvider>(
                    builder: (context, provider, child) {
                      return GestureDetector(
                        onTap: provider.toggleIconColor,
                        child: Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              shape: BoxShape.circle,
                              color: Colors.grey[300]),
                          child: Center(
                            child: provider.isIconTapped
                                ? SvgPicture.asset(
                                    "assets/svg/Icon ion-bookmark (1).svg",
                                    // color: provider.isIconTapped ? Color(0xff008B88) : Colors.grey,
                                  )
                                : SvgPicture.asset(
                                    "assets/svg/Icon ion-bookmark (2).svg",
                                    // color: provider.isIconTapped ? Color(0xff008B88) : Colors.grey,
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nisl imperdiet donec nascetur feugiat.",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.body(color: Colors.white70),
              ),
              SizedBox(height: 40.h),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Write a comment...",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(15),
                    child: SvgPicture.asset(
                      "assets/svg/Icon ionic-ios-send (2).svg",
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
            ],
          ),
        ),
      ],
    );
  }

  Widget _iconWithText(String assetPath, String label) {
    return Column(
      children: [
        Image.asset(assetPath, width: 24.w),
        SizedBox(height: 3.h),
        Text(
          label,
          style: AppTextStyle.body(color: Colors.white),
        ),
      ],
    );
  }
}

class VideoPlayerItem extends StatelessWidget {
  const VideoPlayerItem({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VideoPlayerProvider>(context);
    final controller = provider.controller;

    if (!provider.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return GestureDetector(
      onTap: provider.togglePlayPause,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: controller.value.size.width,
                height: controller.value.size.height,
                child: VideoPlayer(controller),
              ),
            ),
          ),
          if (!provider.isPlaying)
            Image.asset(
              "assets/images/play.png",
              width: 87.w,
              height: 87.h,
            ),
          Positioned(
            bottom: 90.h,
            left: 20.w,
            right: 20.w,
            child: VideoProgressIndicator(
              controller,
              allowScrubbing: true,
              colors: const VideoProgressColors(
                playedColor: Color(0xffC2EAB4),
                bufferedColor: Colors.grey,
                backgroundColor: Colors.white24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
