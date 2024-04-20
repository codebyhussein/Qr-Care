import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  CustomSlider({super.key, required this.value});

  double value = 0;

  @override
  State<CustomSlider> createState() => _CustomeSliderState();
}

class _CustomeSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
            data: const SliderThemeData(
                disabledActiveTrackColor: Color(0xff004854),
                thumbShape: RoundSliderOverlayShape()),
            child:
                Slider(max: 5, min: 0, value: widget.value, onChanged: null)),
        Text(
          "${widget.value.toInt()}/5",
          style: const TextStyle(fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
