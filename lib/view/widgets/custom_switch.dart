import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';

class CustomSwitch extends StatelessWidget {
  final ValueNotifier<bool> switchNotifier;

  CustomSwitch({Key? key, required this.switchNotifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: switchNotifier,
      builder: (context, isSwitched, child) {
        return Transform.scale(
          scale: 0.7,
          child: Switch(
            value: isSwitched,
            onChanged: (value) => switchNotifier.value = value,
            activeColor: Colors.white,
            inactiveThumbColor: Color(0xff48576E),
            inactiveTrackColor: Color(0xffE0E7F0),
            // inactiveThumbColor: const Color(0xFF0F2D3D),
            activeTrackColor: const Color(0xFF16A34A),
            //inactiveTrackColor: const Color(0xFFC1D3F4),
            splashRadius: 0,
            trackOutlineColor: MaterialStateProperty.all(
                isSwitched ? Colors.transparent : Colors.grey.shade500),
            thumbIcon: MaterialStateProperty.all(null),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        );
      },
    );
  }
}
