import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/past_appointments/appointment_details_card.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

class CancelAppointments extends StatelessWidget {
  const CancelAppointments({super.key});

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
                const AppointmentDetailsCard(
                       time: '03:00 PM   To  04:00 PM',  
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
                        'Cancelled Details ',
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
                            'Cancelled Date',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cancelled Charged',
                            style: context.titleMedium
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text('\$2.20 (15%)',
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
                        'Cancelled Reason',
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
