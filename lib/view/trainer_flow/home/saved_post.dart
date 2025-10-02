import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/view/widgets/trainer/saved_card_widget.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/saved_post_view_model.dart';

class SavedPost extends StatelessWidget {
  const SavedPost({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SavedPostViewModel>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MainHomeAppBar(title: "Saved Post"),
        body: SizedBox(
          width: double.infinity,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  width: 390.w,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: viewModel.items.length,
                    itemBuilder: (context, index) {
                      final item = viewModel.items[index];
                      return SavedCardWidget(item: item, index: index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
