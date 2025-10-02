
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/user_resilience/home/post/post_card.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

class UserEditPost extends StatelessWidget {
  const UserEditPost({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: 'Edit Post',
        ),
        body: PostCard(
            buttonText: 'Save',
            optionalText: 'upload Image',
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                AppAssets.icon.uploadIcon,
                fit: BoxFit.cover,
                width: 19.5.w,
                height: 19.5.h,
              ),
            ),
            onTap: () =>
                Navigator.pushNamed(context, RoutesName.successPostShared)),
      ),
    );
  }
}
