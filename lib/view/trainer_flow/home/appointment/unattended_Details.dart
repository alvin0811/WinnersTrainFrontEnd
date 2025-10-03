import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/past_appointments/appointment_details_card.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

import '../../../widgets/custom_button.dart';

class UnattendedDetails extends StatelessWidget {
  const UnattendedDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(
              title: 'Appointment Details',
            ),
            body: Column(
              children: [
                AppointmentDetailsCard(
                  docName: 'Alexander Benjamin',
                  city: 'New York, USA',
                  time: '03:00 PM   To  04:00 PM',  
                    imageUrl: AppAssets.images.userProfile,
                  button: CustomButton(
                    text: "Unattended",
                    
                    isGradient: false,
                    color: Color(0xffE7ECF2),
                    fontcolor: Color(0xff7386A2),
                    width: 113.w,
                    fontsize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: 38.h,
                  ),
                ),
                10.h.verticalSpace,
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                  clipBehavior: Clip.none,
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      boxShadow: CustomShadows.defaultShadow,
                      border:
                          Border.all(color: Color(0xff1213141A), width: 1.0),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Report Details ',
                        style: context.titleMedium.copyWith(
                            fontSize: 18.sp, fontWeight: FontWeight.w600),
                      ),
                      20.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' User',
                            style: context.titleMedium
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text('Alex Benjamin',
                              style: context.titleMedium.copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 1.5,
                                  decorationColor: context.onPrimary,
                                  color: context.onPrimary)),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                        color: Color(0xffDDE2E8),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Report Date',
                            style: context.titleMedium
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text('March 27, 2024',
                              style: context.titleMedium.copyWith(
                                  color: context.onPrimaryContainer
                                      .withOpacity(0.5))),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                        color: Color(0xffDDE2E8),
                      ),
                      8.h.verticalSpace,
                      Text(
                        'Report Reason',
                        style: context.titleMedium
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      5.h.verticalSpace,
                      Text(
                          textAlign: TextAlign.justify,
                          'Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae,.',
                          style: context.titleMedium.copyWith(
                              color:
                                  context.onPrimaryContainer.withOpacity(0.5))),
                    ],
                  ),
                )
              ],
            ).paddingSymmetric(horizontal: 20.w, vertical: 20.h)));
  }
}
