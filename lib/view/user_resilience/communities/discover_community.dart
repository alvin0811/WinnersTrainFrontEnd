import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/resources/app_strings.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/custom_divider.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/communities/invite_bottomsheet.dart';
import 'package:winner_trains_app/view/user_resilience/home/feed/feed_card.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/viewModel/user_view_models/community_viewmodel.dart';

class DiscoverCommunity extends StatefulWidget {
  const DiscoverCommunity({
    super.key,
  });

  @override
  State<DiscoverCommunity> createState() => _DiscoverCommunityState();
}

class _DiscoverCommunityState extends State<DiscoverCommunity> {
  late CommunityViewModel vm;

  @override
  void initState() {
    vm = Provider.of<CommunityViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.about = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommunityViewModel>(
      builder: (context, value, child) {
        return CustomBackground(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: const CustomAppBar(
                  title: 'Community',
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
                      value.selectedItem.value == "Joined"
                          ? joinedView(context, value)
                          : discoverView(context, value)
                    ],
                  ),
                ),
                floatingActionButton: value.selectedItem.value == "Joined" &&
                        value.about != true
                    ? Opacity(
                        opacity: 1.0,
                        child: Container(
                          width: 56.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff4C5157),
                                Color(0xff121314),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            border: Border.all(color: Colors.white, width: 3.0),
                          ),
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RoutesName.userCreatePost);
                            },
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            child: Icon(Icons.add,
                                color: Colors.white, size: 40.sp),
                          ),
                        ),
                      )
                    : null));
      },
    );
  }

  Widget discoverView(BuildContext context, value) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Text(
                      'Stress-Related',
                      style: context.labelLarge,
                    ),
                    10.w.horizontalSpace,
                  ]),
                  Spacer(),
                  SvgPicture.asset(
                    AppAssets.icon.communityIcon,
                    width: 23.22.w,
                    height: 19.h,
                  ),
                  10.w.horizontalSpace,
                  Text('Public',
                      style: context.titleMedium
                          .copyWith(color: context.onPrimaryContainer)),
                ],
              ),
              10.h.verticalSpace,
              Text('(Stress)',
                  style: context.titleMedium.copyWith(
                      color: context.onPrimary, fontWeight: FontWeight.w600)),
              10.h.verticalSpace,
              CustomDivider(
                color: const Color(0xffDDE2E8).withOpacity(0.4),
              ),
              10.h.verticalSpace,
              Text('About',
                  style: context.titleMedium.copyWith(
                      color: context.onPrimary, fontWeight: FontWeight.w600)),
              10.h.verticalSpace,
              Text(
                  'Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam sem, vel purus proin eleifend nisi dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. ',
                  style: context.titleMedium.copyWith(
                      color: context.onPrimaryContainer,
                      fontWeight: FontWeight.w400)),
              15.h.verticalSpace,
              Text('Info',
                  style: context.titleMedium.copyWith(
                      color: context.onPrimary, fontWeight: FontWeight.w600)),
              10.h.verticalSpace,
              Text('Community Activity',
                  style: context.titleMedium.copyWith(
                      color: context.onPrimary, fontWeight: FontWeight.w500)),
              10.h.verticalSpace,
              Row(
                children: [
                  Image.asset(
                    AppAssets.icon.post,
                    width: 21.44.w,
                    height: 19.h,
                  ),
                  10.w.horizontalSpace,
                  Text(
                    '132 new posts today',
                    style: context.titleMedium.copyWith(
                        color: context.onPrimary, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              10.h.verticalSpace,
              Row(
                children: [
                  Image.asset(
                    AppAssets.icon.member,
                    width: 21.44.w,
                    height: 19.h,
                  ),
                  10.w.horizontalSpace,
                  Text(
                    '1.6M members',
                    style: context.titleMedium.copyWith(
                        color: context.onPrimary, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              70.h.verticalSpace,
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: const CustomButton(
                    text: 'Join Community',
                  ).inkWell(onTap: () {
                    value.selectedItem.value = "Joined";
                    Navigator.pushReplacementNamed(
                      context,
                      RoutesName.discoverCommunity,
                    );
                  }),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget joinedView(BuildContext context, CommunityViewModel value) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Text(
                      'Stress-Related',
                      style: context.labelLarge,
                    ),
                    10.w.horizontalSpace,
                    Icon(
                      value.about
                          ? Icons.keyboard_arrow_down_outlined
                          : Icons.arrow_forward_ios,
                      size: value.about ? 30 : 20,
                      color: context.onPrimaryContainer,
                    ).inkWell(onTap: () {
                      value.toggleAbout();
                    })
                  ]),
                  Spacer(),
                  SvgPicture.asset(
                    AppAssets.icon.communityIcon,
                    width: 23.22.w,
                    height: 19.h,
                  ),
                  10.w.horizontalSpace,
                  Text('Public',
                      style: context.titleMedium
                          .copyWith(color: context.onPrimaryContainer)),
                ],
              ),
              10.h.verticalSpace,
              if (value.about != true)
                Row(
                  children: [
                    Image.asset(
                      AppAssets.icon.member,
                      width: 21.44.w,
                      height: 19.h,
                    ),
                    10.w.horizontalSpace,
                    Text(
                      '1.6M members',
                      style: context.titleMedium.copyWith(
                          color: context.onPrimary,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              if (value.about != true) 20.h.verticalSpace,
              if (value.about != true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      width: 190.w,
                      height: 48.h,
                      border: CustomBorder.thin(
                        color: const Color(0xff0AB2AE),
                      ),
                      isGradient: false,
                      text: 'Leave',
                      fontsize: 14.sp,
                      fontcolor: context.onPrimary,
                      color: context.primary,
                      fontWeight: FontWeight.w500,
                    ).inkWell(onTap: () {
                      value.selectedItem.value = "Discover";
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesName.discoverCommunity,
                      );
                    }),
                    16.w.horizontalSpace,
                    CustomButton(
                      width: 190.w,
                      height: 48.h,
                      fontsize: 14.sp,
                      text: 'Invite',
                    ).inkWell(onTap: () {
                      showModalBottomSheet(
                        backgroundColor: context.background,
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => const InviteBottomsheet(),
                      );
                    })
                  ],
                ),
              if (value.about != true) 10.h.verticalSpace,
              CustomDivider(
                color: const Color(0xffDDE2E8).withOpacity(0.4),
              ),
              if (value.about != true) 10.h.verticalSpace,
              if (value.about != true)
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return index == 1
                        ? FeedCard(
                            title: "Alexandar Benjamin",
                            subtitle: "Jan 11,2023",
                            isSavedPost: false,
                            profilePicUrl: AppAssets.images.person2Image,
                            videoUrl: AppAssets.images.yogaImage,
                            description:
                                "This is a video description or review",
                            isVideo: true,
                            isOnlyDescription: false,
                            isimage: false,
                          )
                        : index == 2
                            ? FeedCard(
                                isSavedPost: false,
                                title: "Dr Lucas Henry",
                                subtitle: "Jan 11,2023",
                                profilePicUrl: AppAssets.images.person2Image,
                                imageUrl: AppAssets.images.yogaImage,
                                description:
                                    "This is an image description or review",
                                isVideo: false,
                                isOnlyDescription: false,
                                isimage: true,
                              )
                            : FeedCard(
                                isSavedPost: false,
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
              if (value.about == true) aboutCommunity(context, value)
            ],
          ),
        )
      ],
    );
  }

  Widget aboutCommunity(BuildContext context, value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('(Stress)',
            style: context.titleMedium.copyWith(
                color: context.onPrimary, fontWeight: FontWeight.w600)),
        10.h.verticalSpace,
        CustomDivider(
          color: const Color(0xffDDE2E8).withOpacity(0.4),
        ),
        10.h.verticalSpace,
        Text('About',
            style: context.titleMedium.copyWith(
                color: context.onPrimary, fontWeight: FontWeight.w600)),
        Text(
            'Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam sem, vel purus proin eleifend nisi dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. ',
            style: context.titleMedium.copyWith(
                color: context.onPrimaryContainer,
                fontWeight: FontWeight.w400)),
        15.h.verticalSpace,
        Text('Info',
            style: context.titleMedium.copyWith(
                color: context.onPrimary, fontWeight: FontWeight.w600)),
        10.h.verticalSpace,
        Text('Community Activity',
            style: context.titleMedium.copyWith(
                color: context.onPrimary, fontWeight: FontWeight.w500)),
        10.h.verticalSpace,
        Row(
          children: [
            Image.asset(
              AppAssets.icon.post,
              width: 21.44.w,
              height: 19.h,
            ),
            10.w.horizontalSpace,
            Text(
              '132 new posts today',
              style: context.titleMedium.copyWith(
                  color: context.onPrimary, fontWeight: FontWeight.w500),
            )
          ],
        ),
        10.h.verticalSpace,
        Row(
          children: [
            Image.asset(
              AppAssets.icon.member,
              width: 21.44.w,
              height: 19.h,
            ),
            10.w.horizontalSpace,
            Text(
              '1.6M members',
              style: context.titleMedium.copyWith(
                  color: context.onPrimary, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
