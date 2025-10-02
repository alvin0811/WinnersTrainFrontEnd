import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/communities/community_card.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_tabbar.dart';
import 'package:winner_trains_app/viewModel/user_view_models/community_viewmodel.dart';

class CommunitiesPage extends StatelessWidget {
  const CommunitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> joinedCommunities = [
      {
        "name": "Stress-Related",
        "icon": AppAssets.images.stressRelatedCommunity,
      },
      {
        "name": "Anxiety-Related",
        "icon": AppAssets.images.anxietyRelatedCommunity
      },
      {
        "name": "DepressionRelated",
        "icon": AppAssets.images.depressionRelatedCommunity
      },
    ];
    List<Map<String, String>> discoverCommunities = [
      {
        "name": "Stress-Related",
        "icon": AppAssets.images.anxietyRelatedCommunity
      },
      {"name": "Anxiety-Related", "icon": AppAssets.images.anxiety2Community},
      {"name": "Anxiety-Related", "icon": AppAssets.images.anxiety3Community},
      {
        "name": "Depression-Related",
        "icon": AppAssets.images.depressionRelatedCommunity
      },
      {
        "name": "Stress-Related",
        "icon": AppAssets.images.stressRelated2Community
      },
      {
        "name": "Stress-Related",
        "icon": AppAssets.images.stressRelated3Community
      },
    ];
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body:
                Consumer<CommunityViewModel>(builder: (context, value, child) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTabbar(
                        items: value.items,
                        height: 42.h,
                        width: 188.w,
                        val: value.selectedItem),
                    20.h.verticalSpace,
                    ValueListenableBuilder<String>(
                      valueListenable: value.selectedItem,
                      builder: (c, selectedTab, _) {
                        final isJoined = selectedTab == "Joined";
                        final itemCount = isJoined
                            ? joinedCommunities.length
                            : discoverCommunities.length;

                        return GridView.builder(
                          itemCount: itemCount,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.w,
                            childAspectRatio: isJoined ? 0.9 : 0.8,
                            mainAxisSpacing: 10.h,
                          ),
                          itemBuilder: (context, index) {
                            if (isJoined) {
                              final c = joinedCommunities[index];
                              return CommunityCard(
                                communityTitle: c['name']!,
                                noOfMembers: 'Public 1.6 members',
                                imageName: c['icon']!,
                              ).inkWell(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  RoutesName.discoverCommunity,
                                ),
                              );
                            } else {
                              final c = discoverCommunities[index];
                              return CommunityCard(
                                communityTitle: c['name']!,
                                noOfMembers: 'Public 1.6 members',
                                imageName: c['icon']!,
                                joinButton: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  child: Center(
                                    child: CustomButton(
                                      text: 'Join',
                                      //width: 169.w,
                                      height: 40.h,
                                      fontsize: 14.sp,
                                    ).inkWell(
                                      onTap: () {
                                        value.selectedItem.value = "Joined";
                                        Navigator.pushNamed(
                                          context,
                                          RoutesName.discoverCommunity,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ).inkWell(
                                onTap: () {
                                  value.selectedItem.value = "Discover";
                                  Navigator.pushNamed(
                                    context,
                                    RoutesName.discoverCommunity,
                                  );
                                },
                              );
                            }
                          },
                        );
                      },
                    ),
                  ],
                ).paddingSymmetric(horizontal: 20.w, vertical: 20.h),
              );
            })));
  }
}
