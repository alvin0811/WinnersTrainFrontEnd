import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/user_resilience/home/feed/report_post_bottom_sheet.dart';
import 'package:winner_trains_app/view/user_resilience/home/feed/share_content_bottomsheet.dart';
import 'package:winner_trains_app/viewModel/user_view_models/video_player_view_model.dart';

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
      body: PageView.builder(
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
              child: SvgPicture.asset(AppAssets.icon.arrowBackIcon),
            ),
            actions: [
              GestureDetector(
                  onTap: () {
                    reportSavePostBottomSheet(context, isSaved: false);
                  },
                  child: SvgPicture.asset(AppAssets.icon.optionsIcon)),
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
                        SvgPicture.asset(
                          AppAssets.icon.whitelike,
                          color:
                              provider.isIconLike ? Colors.white : Colors.blue,
                          width: 24.w,
                        ),
                        SizedBox(height: 3.h),
                        Text("236",
                            style: AppTextStyle.body(
                              color: Colors.white,
                            )),
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
                  child: _iconWithText(AppAssets.icon.whiteComment, "36")),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    // backgroundColor: AppColors.backgroundColor,
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => const SocialMediaBottomSheet(),
                  );
                },
                child: _iconWithText(
                  AppAssets.icon.whiteShare,
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
                    backgroundImage: AssetImage(AppAssets.images.person2Image),
                  ),
                  title: Text(
                    "Alexander Benjamin",
                    style: AppTextStyle.button(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text("New York, USA",
                      style: AppTextStyle.body(
                        color: Colors.white70,
                      )),
                  trailing: Consumer<VideoPlayerProvider>(
                    builder: (context, provider, child) {
                      return GestureDetector(
                        onTap: provider.toggleIconColor,
                        child: SvgPicture.asset(
                          AppAssets.icon.whitebookmark,
                          color: provider.isIconTapped ? Colors.red : null,
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
                  style: AppTextStyle.body(
                    color: Colors.white70,
                  )),
              SizedBox(height: 40.h),
              TextFormField(
                style: TextStyle(color: Colors.black),
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
                    child: Icon(
                      Icons.send,
                      color: Colors.black.withOpacity(0.5),
                      size: 20,
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
        Text(label,
            style: AppTextStyle.body(
              color: Colors.white,
            )),
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
            SvgPicture.asset(AppAssets.icon.whitePlay,
                width: 87.w, height: 87.h),
          Positioned(
            bottom: 90.h,
            left: 20.w,
            right: 20.w,
            child: VideoProgressIndicator(
              controller,
              allowScrubbing: true,
              colors: VideoProgressColors(
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
