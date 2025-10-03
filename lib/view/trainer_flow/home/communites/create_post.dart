import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:winner_trains_app/view/user_resilience/home/post/post_card.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomindex = Provider.of<TrainerMainHomeViewModel>(context);
    return CustomBackground(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
            title: 'Create Post',
          ),
          body: PostCard(onTap: () {
            Navigator.pushNamed(context, RoutesName.successPostShared);
          })),
    );
  }
}
