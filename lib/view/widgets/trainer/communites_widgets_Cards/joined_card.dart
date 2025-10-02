import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/view/widgets/trainer/Communites_widgets_Cards/custom_Card.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/communites_card_view_model.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart'; // CustomCard Widget

class JoinedCard extends StatelessWidget {
  const JoinedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommunitesCardViewModel>(
      builder: (context, viewModel, child) {
        final cardData = viewModel.joinedCards;

        return SizedBox(width: 390.w,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, 
                crossAxisSpacing: 0.w, 
                mainAxisSpacing: 10.h, 
              childAspectRatio: 187.w / 205.h,
            ),
            itemCount: cardData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.communitesjoined);
                },
                child: CustomCard(
                  cardData: cardData[index],
                  hasJoinButton: false,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
// class JoinedCard extends StatelessWidget {
//   const JoinedCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(width: 390.w,
//       child: Consumer<CommunitesCardViewModel>(
//         builder: (context, viewModel, child) {
//           final cardData = viewModel.joinedCards;
      
//           return LayoutBuilder(
//             builder: (context, constraints) {
//               final isSmallDevice = constraints.maxHeight < 700 || constraints.maxWidth < 360;
      
//               final double cardHeight = isSmallDevice ? 220.h : 205.h;
//               final double cardWidth = isSmallDevice ? 166.w : 187.w;
//               final double aspectRatio = cardWidth / cardHeight;
      
//               return SizedBox(
//                 width: double.infinity,
//                 child: GridView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                     maxCrossAxisExtent: cardWidth,
//                     mainAxisSpacing: 10.h,
//                     crossAxisSpacing: 0.w,
//                     childAspectRatio: aspectRatio,
//                   ),
//                   itemCount: cardData.length,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(context, RoutesName.communitesjoined);
//                       },
//                       child: CustomCard(
//                         cardData: cardData[index],
//                         hasJoinButton: false,
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
