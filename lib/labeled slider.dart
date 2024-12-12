import 'package:flutter/material.dart';

class CustomSliderPage extends StatefulWidget {
  final Color color;
  final double width;
  final double height;
  final List<int> steps; // Step values for the slider
  final List<String> stepValues; // Labels for each step
  final List<String> stepSubValues; // Sub-labels (nullable for some indices)

  const CustomSliderPage({
    super.key,
    required this.color,
    required this.steps,
    required this.stepValues,
    required this.stepSubValues, required this.width, required this.height,
  });

  @override
  _CustomSliderPageState createState() => _CustomSliderPageState();
}

class _CustomSliderPageState extends State<CustomSliderPage> {
  double _currentValue = 0; // Default slider value
  late List<int> _steps;
  late List<String> _stepValues;
  late List<String?> _stepSubValues;

  @override
  void initState() {
    super.initState();
    _steps = widget.steps;
    _stepValues = widget.stepValues;
    _stepSubValues = widget.stepSubValues;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            // mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: widget.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Step labels
                    Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(_stepValues.length, (index) {
                            return SizedBox(
                              width: 130,
                              child: Text(
                                _stepValues[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: index <= _currentValue
                                        ? widget.color // Grey for current and previous steps
                                        : Colors.black, // Black for remaining steps
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            );
                          }),
                        ),
                        // Optional sub-values
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(_stepSubValues.length, (index) {
                            final subValue = _stepSubValues[index];
                            return SizedBox(
                              width: 120,
                              child: subValue != '' || subValue != ' '
                                  ? Text(
                                subValue!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:  index <= _currentValue
                                      ? widget.color // Grey for current and previous steps
                                      : Colors.black,
                                  fontSize: 10,
                                ),
                              )
                                  : SizedBox.shrink(), // Hide if sub-value is null or empty
                            );
                          }),
                        ),
                      ],
                    ),
                    // Slider
                    SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: widget.color,
                        inactiveTrackColor: widget.color.withOpacity(0.3),
                        thumbColor: Colors.white,
                        overlayColor: widget.color.withOpacity(0.2),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        trackHeight: 4.0,
                      ),
                      child: Slider(
                        value: _currentValue,
                        min: 0,
                        max: (_steps.length - 1).toDouble(),
                        divisions: _steps.length - 1,
                        onChanged: (value) {
                          setState(() {
                            _currentValue = value;
                          });
                        },
                      ),
                    ),
                    // Numeric step values under the slider
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(_steps.length, (index) {
                          return Column(
                            children: [
                              Text(
                                '${_steps[index]}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: index <= _currentValue
                                      ? widget.color
                                      : Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
