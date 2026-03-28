import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/models/card_model.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/communites_card_view_model.dart';

// class CustomCard extends StatelessWidget {
//   final CardDataModel cardData;
//   final bool hasJoinButton;

//   const CustomCard({
//     super.key,
//     required this.cardData,
//     required this.hasJoinButton,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 5.w),
//       child: Container(
//         width: 187.w,
//         decoration: BoxDecoration(
//           color: const Color(0xffFFFFFF),
//           border: Border.all(color: const Color(0xff1213141a)),
//           borderRadius: BorderRadius.circular(15.r),
//           boxShadow: [
//             BoxShadow(
//               color: const Color(0xff2238500f),
//               offset: const Offset(0, 1),
//               blurRadius: 10.r,
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 10.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(15.r),
//                 child: Image.asset(
//                   cardData.image,
//                   width: 177.w,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               Text(
//                 cardData.title,
//                 style: TextStyle(
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.bold,
//                   color: const Color(0xff121314),
//                 ),
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               5.verticalSpace,
//               Row(
//                 children: [
//                   Flexible(
//                     flex: 1,
//                     child: Text(
//                       cardData.subtext1 ?? '',
//                       style: TextStyle(
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.normal,
//                         color: Colors.black,
//                       ),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   5.horizontalSpace,
//                   Flexible(
//                     flex: 2,
//                     child: Text(
//                       cardData.subtext2 ?? '',
//                       style: TextStyle(
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.normal,
//                         color: Colors.black,
//                       ),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ],
//               ),
//               10.verticalSpace,
//               if (hasJoinButton)
//                 SizedBox(
//                   width: 167.w,
//                   height: 32.h,
//                   child: CustomButton(
//                     buttonText: "Join",
//                     onPressed: () {
//                       Navigator.pushNamed(
//                         context,
//                         RoutesName.communitesjoined,
//                       );
//                     },
//                   ),
//                 ),
//               10.verticalSpace,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class CustomCard extends StatelessWidget {
  final CardDataModel cardData;
  final bool hasJoinButton;

  const CustomCard({
    super.key,
    required this.cardData,
    required this.hasJoinButton,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CommunitesCardViewModel>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Container(
        width: 187.w,
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          border: Border.all(color: const Color(0xff1213141A), width: 1.w),
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff2238500f),
              offset: const Offset(0, 1),
              blurRadius: 10.r,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              5.verticalSpace,
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  border:
                      Border.all(color: const Color(0xff1213141A), width: 1.w),
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff2238500f),
                      offset: const Offset(0, 1),
                      blurRadius: 10.r,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.asset(
                    cardData.image,
                    width: 177.w,
                    fit: BoxFit.none,
                  ),
                ),
              ),
              5.verticalSpace,
              Text(
                cardData.title,
                style: AppTextStyle.button(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              5.verticalSpace,
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      cardData.subtext1 ?? '',
                      style: AppTextStyle.body(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  5.horizontalSpace,
                  Flexible(
                    flex: 2,
                    child: Text(
                      cardData.subtext2 ?? '',
                      style: AppTextStyle.body(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              if (hasJoinButton)
                SizedBox(
                  width: 167.w,
                  height: 32.h,
                  child: CustomButton(
                    buttonText: "Join",
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RoutesName.communitesjoined,
                      );
                      viewModel.selectReportSelected("Joined");
                    },
                  ),
                ),
              10.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
