import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/view/widgets/trainer/Communites_widgets_Cards/custom_Card.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/communites_card_view_model.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart'; // CustomCard widget

class DiscoverCard extends StatelessWidget {
  const DiscoverCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390.w,
      child: Consumer<CommunitesCardViewModel>(
        builder: (context, viewModel, child) {
          final cardData = viewModel.discoverCards;
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0.w,
              mainAxisSpacing: 8.h,
              childAspectRatio: 200.w / 255.h,
            ),
            itemCount: cardData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.communitydetail);
                  
                },
                child: CustomCard(
                  cardData: cardData[index],
                  hasJoinButton: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
// class DiscoverCard extends StatelessWidget {
//   const DiscoverCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 390.w,
//       child: Consumer<CommunitesCardViewModel>(
//         builder: (context, viewModel, child) {
//           final cardData = viewModel.discoverCards;

//           return SizedBox(width: 390.w,
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 final isSmallDevice = constraints.maxHeight < 900 || constraints.maxWidth < 390;
//                 final double cardHeight = isSmallDevice ? 260.h : 255.h;
//                 final double cardWidth = isSmallDevice ? 166.w : 180.w;
//                 final double aspectRatio = cardWidth / cardHeight;
//                 return GridView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   padding: EdgeInsets.zero,
//                   itemCount: cardData.length,
//                   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                     maxCrossAxisExtent: cardWidth,
//                     mainAxisSpacing: 8.h,
//                     crossAxisSpacing: 0.w,
//                     childAspectRatio: aspectRatio,
//                   ),
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(context, RoutesName.communitydetail);
//                       },
//                       child: CustomCard(
//                         cardData: cardData[index],
//                         hasJoinButton: true,
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
