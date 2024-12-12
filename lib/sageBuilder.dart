


import 'package:flutter/material.dart';

class StageBuilder extends StatefulWidget {
  const StageBuilder({
    super.key,
    this.width,
    this.height,
    required this.count,
    required this.currentIndex,
  });

  final double? width;
  final double? height;
  final int count;
  final int currentIndex;

  @override
  State<StageBuilder> createState() => _StageBuilderState();
}

class _StageBuilderState extends State<StageBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(2),
        child: Stack(
          alignment: Alignment.center, // Ensures children are centered
          children: [
            SizedBox(
              height: widget.height,
              width: widget.width,
              child: CircularProgressIndicator(
                value: widget.currentIndex / widget.count,
                backgroundColor: Colors.grey.withOpacity(0.6),
                strokeWidth: 6,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.pink),
                strokeCap: StrokeCap.round,
              ),
            ),
            Center( // Centers the text within the Stack
              child: Text(
                "${widget.currentIndex.toInt()} of ${widget.count.toInt()}",
                style: TextStyle(fontSize: 10, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}