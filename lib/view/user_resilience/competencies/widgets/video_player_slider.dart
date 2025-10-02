import 'package:flutter/material.dart';

class VideoProgressSlider extends StatelessWidget {
  final Duration currentPosition;
  final Duration totalDuration;
  final ValueChanged<double> onChanged;

  const VideoProgressSlider({
    super.key,
    required this.currentPosition,
    required this.totalDuration,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final value = totalDuration.inMilliseconds == 0
        ? 0.0
        : currentPosition.inMilliseconds / totalDuration.inMilliseconds;

    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 6, // thickness of slider
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 7, // white circle size
        ),
        overlayShape: const RoundSliderOverlayShape(
          overlayRadius: 0, // remove glow when dragging
        ),
        activeTrackColor: const Color(0xffB6D7A8), // light green
        inactiveTrackColor: Colors.grey.shade600,   // gray bar
        thumbColor: Colors.white,                   // white handle
      ),
      child: Slider(
        value: value.clamp(0.0, 1.0),
        onChanged: (newValue) {
          final newPosition =
              Duration(milliseconds: (newValue * totalDuration.inMilliseconds).round());
          onChanged(newValue);
        },
      ),
    );
  }
}
