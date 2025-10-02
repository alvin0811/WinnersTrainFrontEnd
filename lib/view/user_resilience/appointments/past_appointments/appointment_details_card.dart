import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_profile_image.dart';

class AppointmentDetailsCard extends StatelessWidget {
  final String? docName;
  final String? time;
  final String? imageUrl;
  final Widget? button;
  final String? date;
  final String? additionalInformation;
  final String? consultingFee;
  final Widget? appointmentButton;
  
  const AppointmentDetailsCard({
    super.key,
    this.docName,
    this.time,
    this.imageUrl,
    this.button,
    this.additionalInformation,
    this.consultingFee,
    this.date,
    this.appointmentButton,
   
  });

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
            children: [
              ProfilePicture(
                  width: 60.w,
                  height: 60.h,
                  imageUrl: imageUrl ?? AppAssets.images.personImage),
              10.w.horizontalSpace,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          docName ?? 'Dr. Sara William',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: context.onPrimary),
                        ),
                        Text(
                          time ?? 'Today , 07:00 PM',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color:
                                  context.onPrimaryContainer.withOpacity(0.5)),
                        ),
                      ],
                    ),
                    button ??
                        CustomButton(
                          text: "Cancelled",
                          isGradient: false,
                          color: Colors.red.withOpacity(0.2),
                          fontcolor: Color(0xffE70000),
                          width: 98.w,
                          fontsize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 33.h,
                        ),
                  ],
                ),
              ),
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
              Text(time ?? '8.55 PM',
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
          if (appointmentButton != null)
           appointmentButton!
        ],
      ),
    );
  }
}
