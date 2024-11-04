import 'package:flutter/material.dart';

class DoubleSlider extends StatefulWidget {
  const DoubleSlider({super.key, required this.startPoint, required this.endPoint, this.width, this.height});
  final double? width;
  final double? height;
  final double startPoint;
  final double endPoint;

  @override
  State<DoubleSlider> createState() => _DoubleSliderState();
}

class _DoubleSliderState extends State<DoubleSlider> {
  late RangeValues _currentRangeValues;

  @override
  void initState() {
    super.initState();
    _currentRangeValues = RangeValues(widget.startPoint, widget.endPoint);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: RangeSlider(
        values: _currentRangeValues,
        max: 100,
        divisions: 5,
        labels: RangeLabels(
          _currentRangeValues.start.round().toString(),
          _currentRangeValues.end.round().toString(),
        ),
        onChanged: (RangeValues newValues) {
          setState(() {
            _currentRangeValues = newValues;
          });
        },
      ),
    );
  }

  // Function to return the current range values
  RangeValues getCurrentRangeValues() {
    return _currentRangeValues;
  }
}