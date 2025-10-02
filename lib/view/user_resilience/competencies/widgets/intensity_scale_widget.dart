import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';

class IntensityScaleSlider extends StatelessWidget {
  final double min;
  final double max;
  final double initialValue;
  final Function(double) onChanged;

  // ValueNotifier to hold slider value
  final ValueNotifier<double> valueNotifier;

  IntensityScaleSlider({
    super.key,
    this.min = 1,
    this.max = 10,
    this.initialValue = 5,
    required this.onChanged,
  }) : valueNotifier = ValueNotifier<double>(initialValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        gradient: LinearGradient(
          begin: Alignment(0.9, -1.0), // ~104° start
          end: Alignment(0.9, 0.9), // ~104° end
          colors: [
            Color(0xFFFFFFFF), // White
            Color(0xFFDDEAF3), // Light bluish gray
          ],
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Intensity Scale",
            style: context.bodyMedium.copyWith(
                fontWeight: FontWeight.w600, color: Color(0xff181818)),
          ),
          12.h.verticalSpace,
          Column(
            children: [
              ValueListenableBuilder<double>(
                valueListenable: valueNotifier,
                builder: (context, value, _) {
                  return SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 10.h,
                      inactiveTrackColor: Colors.transparent,
                      activeTickMarkColor:
                          Colors.white, // active division circles
                      inactiveTickMarkColor: Colors.white,
                      activeTrackColor: Colors.transparent,
                      thumbColor: Colors.white,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 10),
                      overlayShape: SliderComponentShape.noOverlay,
                      trackShape: const GradientRectSliderTrackShape(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFF6A88), // pinkish-red
                            Color(0xFFFFC371), // orange
                          ],
                        ),
                      ),
                    ),
                    child: Slider(
                      min: min,
                      max: max,
                      divisions: (max - min).toInt(),
                      value: value,
                      onChanged: (newValue) {
                        valueNotifier.value = newValue;
                        onChanged(newValue);
                      },
                    ),
                  );
                },
              ),
              // Labels under the slider
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  (max - min + 1).toInt(),
                  (index) => Text(
                    "${index + min.toInt()}",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Custom gradient track painter
class GradientRectSliderTrackShape extends SliderTrackShape {
  final LinearGradient gradient;

  const GradientRectSliderTrackShape({required this.gradient});

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 4;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    Offset? secondaryOffset,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
  }) {
    final rect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
    );

    final paint = Paint()..shader = gradient.createShader(rect);

    context.canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(8)),
      paint,
    );
  }
}
