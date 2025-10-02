
import 'package:winner_trains_app/resources/app_strings.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/user_resilience/home/feed/feed_card.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

class UserSavedPost extends StatelessWidget {
  const UserSavedPost({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(title: "Saved Post",),
      body: Column(
        children: [
           ListView.builder(
         
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return index == 1
                      ? FeedCard(
                          title: "Alexandar Benjamin",
                          isSavedPost: true,
                          subtitle: "Jan 11,2023",
                          profilePicUrl: AppAssets.images.person2Image,
                          videoUrl: AppAssets.images.yogaImage,
                          description: "This is a video description or review",
                          isVideo: true,
                          isOnlyDescription: false,
                          isimage: false,
                        )
                      
                          : FeedCard(
                            isSavedPost: true,
                              title: "Dr Lucas Henry",
                              subtitle: "Jan 11,2023",
                              description: AppStrings.description,
                              isVideo: false,
                              isOnlyDescription: true,
                              isimage: false,
                              profilePicUrl: AppAssets.images.person2Image,
                            );
                },
              ),
        ],
      ).paddingSymmetric(horizontal: 20.w, vertical: 20.h)
    ));
  }
}