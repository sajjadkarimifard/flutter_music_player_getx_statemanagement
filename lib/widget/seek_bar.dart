import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeekBarData {
  final Duration position;
  final Duration duration;

  SeekBarData({required this.position, required this.duration});
}

class SeekBar extends StatelessWidget {
  const SeekBar({
    super.key,
    required this.duration,
    required this.position,
    this.onChanged,
    this.onChangeEnd,
  });
  final Duration position;
  final Duration duration;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;
  @override
  Widget build(BuildContext context) {
    double? dragValue;
    return Row(
      children: [
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 4,
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 4,
                disabledThumbRadius: 4,
              ),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
              activeTrackColor: Colors.white,
              inactiveTrackColor: Colors.white,
              thumbColor: Colors.white,
              overlayColor: Colors.white,
            ),
            child: Slider(
              value: min(dragValue ?? widget.position.inMilliseconds.toDouble(),
                  widget.position.inMilliseconds.toDouble()),
              onChanged: (value) {},
            ),
          ),
        ),
      ],
    );
  }
}
