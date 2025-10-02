import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class StoryCardWidget extends StatelessWidget {
  final String story;
  final int imageIndex; // Add an index to select a background image

  const StoryCardWidget({super.key, required this.story, required this.imageIndex});

  @override
  Widget build(BuildContext context) {
    // List of background images
    List<String> backgroundImages = [
      "assets/images/Rectangle 1141.png",
      "assets/images/Rectangle 1141.png",
      "assets/images/Rectangle 1141.png",
    ];

    String selectedImage = backgroundImages[imageIndex % backgroundImages.length];
    return Opacity(opacity: 0.90,
      child: Container(
        width: 119.w, 
        height: 140.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(selectedImage), 
            fit: BoxFit.cover, 
          ),
          borderRadius: BorderRadius.circular(8.r), 
        ),
        child: Stack(
          clipBehavior: Clip.none, 
          alignment: Alignment.center, 
          children: [
            Positioned(
              top: 5,
              right: 10,
              child: Image.asset(
                "assets/images/Group 15884.png",
                width: 43.w,
                height: 17.h, 
                fit: BoxFit.cover, 
              ),
            ),
            GestureDetector(
              onTap: () {
            Navigator.pushNamed(context, RoutesName.storyview);
              },
              child: Image.asset(
                "assets/images/Group 15111.png",
                width: 38.w,
                height: 38.h, 
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
