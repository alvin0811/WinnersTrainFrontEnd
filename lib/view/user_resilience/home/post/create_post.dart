import 'package:flutter/material.dart';

import 'package:winner_trains_app/view/user_resilience/home/post/post_card.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

import '../../../../utils/routes/route_name.dart';

class UserCreatePost extends StatelessWidget {
  const UserCreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
            title: 'Create Post',
          ),
          body: PostCard(
            onTap: () =>
                Navigator.pushNamed(context, RoutesName.successPostShared),
          )),
    );
  }
}
