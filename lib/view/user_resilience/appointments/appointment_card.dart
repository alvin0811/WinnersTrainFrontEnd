
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_profile_image.dart';

class AppointmentCard extends StatelessWidget {
  final String? imageUrl;
  final String? docName;
  final String? buttonText;
  final Widget? button;
  final String? time;
  final double? width;
  final bool isPast;
  final bool isButton;
  final VoidCallback? onTap;
  const AppointmentCard({
    this.imageUrl,
    this.docName,
    this.width,
    this.button,
    this.onTap,
    this.buttonText,
    this.isPast = false,
    this.isButton = false,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      
      margin: EdgeInsets.only(
        bottom: 10.h,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xff1213141A), width: 1.0),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: CustomShadows.defaultShadow),
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
                    SizedBox(
                        width: 99.w,
                        height: 33.h,
                        child: isPast
                            ? button
                            : Consumer<AppointmentViewModel>(
                              builder: (context, value, child){return 
                               CustomButton(
                                  width: width ?? 93.w,
                                  height: 33.h,
                                  borderRadius: BorderRadius.circular(28.r),
                                  fontcolor: Color(0xff0066FF),
                                  isGradient: false,
                                  fontsize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  text: buttonText,
                                  color: Colors.blue.withOpacity(0.2)).inkWell(onTap: ()=> value.selectedItem.value == "Upcoming"? 
                                  Navigator.pushNamed(context,RoutesName.upcomingAppointments): Navigator.pushNamed(context, RoutesName.ongoingAppointments));
  })),
                  ],
                ),
              ),
            ],
          ),
          //15.h.verticalSpace,
          if (isButton) button!
        ],
      ),
    );
  }
}
