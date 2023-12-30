import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class SliderInput extends StatefulWidget {
  final String sliderLabel;
  double sliderValue;
  intl.NumberFormat sliderValueFormat;
  double sliderMinValue = 10;
  double sliderMaxValue = 100;
  final ValueChanged<double>? onChanged;
  SliderInput(
      {super.key,
      required this.sliderLabel,
      required this.sliderValue,
      required this.sliderMinValue,
      required this.sliderMaxValue,
      required this.sliderValueFormat});
  @override
  State<SliderInput> createState() => _SliderInputState();
}

class _SliderInputState extends State<SliderInput> {
  double currentSliderValue = 1;

  @override
  void initState() {
    currentSliderValue = widget.sliderValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Text(widget.sliderLabel),
        Text(widget.sliderValueFormat.format(currentSliderValue))
      ]),
      Slider(
        value: currentSliderValue,
        min: widget.sliderMinValue,
        max: widget.sliderMaxValue,
        label: currentSliderValue.toString(),
        divisions: 10,
        onChanged: (double value) {
          setState((){
            currentSliderValue = value;
          });

        },
      )
    ]);
  }
}
