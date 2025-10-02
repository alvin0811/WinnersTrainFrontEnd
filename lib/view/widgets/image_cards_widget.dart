import 'dart:io';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/viewModel/user_view_models/help_and_feedback_view_model.dart';



Widget imageCards(BuildContext context, File img) {
    return Consumer<HelpAndFeedbackViewModel>(
      builder: (context, viewModel, child) {
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                height: 122.h,
                width: 122.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.7),
                  ),
                ),
                child: Image.file(
                  img,
                  width: 115.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: () {
                  viewModel.removeImage(img);
                },
                child: Container(
                  height: 30.h,
                  width: 30.h,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }