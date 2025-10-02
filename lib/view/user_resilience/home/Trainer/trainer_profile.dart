import 'package:flutter_svg/svg.dart';
import 'package:winner_trains_app/resources/app_strings.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/review_card.dart';

class TrainerProfile extends StatefulWidget {
  final bool? isSaved;
  const TrainerProfile({super.key, this.isSaved = false});

  @override
  State<TrainerProfile> createState() => _TrainerProfileState();
}

class _TrainerProfileState extends State<TrainerProfile> {
  late final ValueNotifier<bool> _isSaved;

  @override
  void initState() {
    super.initState();
    _isSaved = ValueNotifier<bool>(widget.isSaved ?? false);
  }

  @override
  void dispose() {
    _isSaved.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(
              title: 'Resilience Trainer',
              actions: [
                GestureDetector(
                  onTap: () {
                    _isSaved.value = !_isSaved.value;
                  },
                  child: ValueListenableBuilder<bool>(
                    valueListenable: _isSaved,
                    builder: (context, value, _) {
                      return value
                          ? SvgPicture.asset(
                              AppAssets.icon.bookmarkSave,
                              width: 75.w,
                              height: 75.h,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              AppAssets.icon.bookmarkUnsave,
                              width: 75.w,
                              height: 75.h,
                              fit: BoxFit.cover,
                            );
                    },
                  ),
                ),
              ],
            ),
            body: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: context.primary,
                  borderRadius: BorderRadius.circular(10.r),
                  border: CustomBorder.thin(color: context.outline),
                  boxShadow: CustomShadows.customShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 108.w,
                          height: 123.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppAssets.images.doctor2Image),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: Colors.black.withOpacity(0.2)),
                          ),
                        ),
                        10.w.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Dr.Lucas Henry',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: context.onPrimary),
                                ),
                                8.w.horizontalSpace,
                                Image.asset(
                                  AppAssets.icon.starIcon,
                                  width: 15.88.w,
                                  height: 15.2.h,
                                ),
                                8.w.horizontalSpace,
                                Text(
                                  '4.8',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: context.onPrimaryContainer
                                          .withOpacity(0.7)),
                                ),
                              ],
                            ),
                            6.h.verticalSpace,
                            Row(
                              children: [
                                Text(
                                  '54,',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: context.onPrimary),
                                ),
                                8.w.horizontalSpace,
                                Text(
                                  'Male',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: context.onPrimary),
                                ),
                              ],
                            ),
                            6.h.verticalSpace,
                            Text(
                              'Psychologists',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: context.onPrimary),
                            ),
                            6.h.verticalSpace,
                            Row(
                              children: [
                                Text(
                                  'Consulting fee:',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: context.onPrimary),
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  '\$100.00',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff0066FF),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    16.h.verticalSpace,
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          color: Color(0xffE7ECF2),
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                '23',
                                style: context.labelLarge
                                    .copyWith(color: context.secondary),
                              ),
                              10.h.verticalSpace,
                              Text(
                                'Reviews',
                                style: context.titleMedium
                                    .copyWith(fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Text('|',
                              style: context.titleMedium.copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 30)),
                          Column(
                            children: [
                              Text(
                                '70+',
                                style: context.labelLarge.copyWith(
                                  color: context.secondary,
                                ),
                              ),
                              10.h.verticalSpace,
                              Text(
                                'Patients',
                                style: context.titleMedium
                                    .copyWith(fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Text('|',
                              style: context.titleMedium.copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 30)),
                          Column(
                            children: [
                              Text(
                                '12+',
                                style: context.labelLarge
                                    .copyWith(color: context.secondary),
                              ),
                              10.h.verticalSpace,
                              Text(
                                'Years exp.',
                                style: context.titleMedium
                                    .copyWith(fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    10.h.verticalSpace,
                    Text(
                      'Bio & Specialization',
                      style: context.titleMedium
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    8.h.verticalSpace,
                    Text(
                      AppStrings.description,
                      style: context.titleMedium
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    5.h.verticalSpace
                  ],
                ),
              ),
              10.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reviews (23)',
                    style: context.titleMedium
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 18.sp),
                  ),
                  Text(
                    'See All',
                    style: context.titleMedium.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1.2,
                        decorationColor: context.onPrimary),
                  ).inkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, RoutesName.reviews))
                ],
              ),
              8.h.verticalSpace,
              ReviewCard(
                  userName: 'John Smith',
                  imageUrl: AppAssets.images.person2Image,
                  ratings: '4.8',
                  reviews:
                      'Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus',
                  time: '1 day ago'),
              Spacer(),
              CustomButton(
                text: 'Get Appointment',
                borderRadius: BorderRadius.circular(35.r),
              ).inkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, RoutesName.bookingSchedule))
            ]).paddingSymmetric(horizontal: 20.w, vertical: 20.h)));
  }
}
