import 'package:flutter/material.dart';

class CircularProgressBarI extends StatelessWidget {
  final double size; // Size of the circular progress bar
  final Color color; // Color of the progress bar

  const CircularProgressBarI({
    Key? key,
    this.size = 30.0, // Default size is 30
    this.color = Colors.grey, // Default color is blue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(
          // strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[300]!),
        ),
      ),
    );
  }
}
