import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/view/widgets/custom_profile_image.dart';

class BookingCard extends StatelessWidget {
  final String? imageUrl;
  final String? trainerName;
  final String? country;
  final String? date;
  final String? time;
  final String? consultingFee;
  final String? additionalInformation;
  final Widget? appointmentButton;
  final Widget? confirmationButton;
  final Widget? cancellationButton;
  const BookingCard(
      {super.key,
      this.imageUrl,
      this.trainerName,
      this.country,
      this.date,
      this.time,
      this.consultingFee,
      this.additionalInformation,
      this.appointmentButton,
      this.confirmationButton,
      this.cancellationButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 394.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
          color: Color(0xffffffff),
          boxShadow: CustomShadows.defaultShadow,
          border: Border.all(color: Color(0xff1213141A), width: 1.0),
          borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfilePicture(
                    imageUrl: imageUrl ?? AppAssets.images.person2Image,
                    width: 58.w,
                    height: 58.h,
                  ),
                  12.w.horizontalSpace,
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          trainerName ?? 'Dr. Lucas Henry',
                          style: context.titleMedium
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        5.h.verticalSpace,
                        Text(country ?? 'New York, USA',
                            style: context.bodySmall.copyWith(
                                color: context.onPrimaryContainer
                                    .withOpacity(0.5))),
                      ]),
                ],
              ),
              if (appointmentButton != null)
                Row(
                  children: [
                    appointmentButton!,
                  ],
                )
            ],
          ),
          20.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Date',
                style:
                    context.titleMedium.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(date ?? 'March 27, 2024',
                  style: context.titleMedium.copyWith(
                      color: context.onPrimaryContainer.withOpacity(0.5))),
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
                ' Time',
                style:
                    context.titleMedium.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(time ?? '8.55 PM   To   9:15 PM',
                  style: context.titleMedium.copyWith(
                      color: context.onPrimaryContainer.withOpacity(0.5))),
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
                'Consulting fee',
                style:
                    context.titleMedium.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(consultingFee ?? '\$100.00',
                  style:
                      context.titleMedium.copyWith(color: Color(0xff0066FF))),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Color(0xffDDE2E8),
          ),
          8.h.verticalSpace,
          Text(
            'Additional Note',
            style: context.titleMedium.copyWith(fontWeight: FontWeight.w600),
          ),
          5.h.verticalSpace,
          Text(
              textAlign: TextAlign.justify,
              additionalInformation ??
                  'Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae,.',
              style: context.titleMedium.copyWith(
                  color: context.onPrimaryContainer.withOpacity(0.5))),
          if (confirmationButton != null || cancellationButton != null)
            Column(
              children: [
                39.h.verticalSpace,
                confirmationButton!,
                20.h.verticalSpace,
                cancellationButton!,
                10.h.verticalSpace,
              ],
            )
        ],
      ),
    );
  }
}
