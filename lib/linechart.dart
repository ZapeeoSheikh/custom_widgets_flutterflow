import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CustomLineChart extends StatefulWidget {
  final List<double> weekSpots ;
  final List<double> monthSpots ;
  final List<double> month3Spots ;
  final List<double> month6Spots ;
  final List<double> yearSpots ;
  final List<DataPoint> allYearSpots ;


  CustomLineChart({required this.weekSpots, required this.monthSpots, required this.month3Spots, required this.month6Spots, required this.yearSpots, required this.allYearSpots});

  @override
  _CustomLineChartState createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {
  List<FlSpot> spots = [];
  List<FlSpot> yspots = [];
  String selectedRange = '1 mois';

  @override
  void initState() {
    super.initState();
    spots = _getDataForRange(selectedRange);

    for (var i = 0; i < widget.allYearSpots.length; i++) {
      // Accessing the key '0' and using it as the x value in FlSpot
      final xValue = widget.allYearSpots[i].year ;
      final yValue = widget.allYearSpots[i].value;

      // Using a fixed value for y, or you can access another key if needed

      yspots.add(FlSpot(xValue.toDouble(), yValue.toDouble()));  // x must be double
    }
  }

  List<FlSpot> _getDataForRange(String range) {
    switch (range) {
      case 'Semaine':
        return [
          FlSpot(1, widget.weekSpots[0]),
          FlSpot(2, widget.weekSpots[1]),
          FlSpot(3, widget.weekSpots[2]),
          FlSpot(4, widget.weekSpots[3]),
          FlSpot(5, widget.weekSpots[4]),
          FlSpot(6, widget.weekSpots[5]),
          FlSpot(7, widget.weekSpots[6]),
        ];
      case '1 mois':
        return [
          FlSpot(1, widget.monthSpots[0]),
          FlSpot(5, widget.monthSpots[1]),
          FlSpot(10, widget.monthSpots[2]),
          FlSpot(15, widget.monthSpots[3]),
          FlSpot(20, widget.monthSpots[4]),
          FlSpot(25, widget.monthSpots[5]),
          FlSpot(30, widget.monthSpots[6]),
        ];
      case '3 mois':
        return [
          FlSpot(1, widget.month3Spots[0]),
          FlSpot(15, widget.month3Spots[1]),
          FlSpot(30, widget.month3Spots[2]),
          FlSpot(45, widget.month3Spots[3]),
          FlSpot(60, widget.month3Spots[4]),
          FlSpot(75, widget.month3Spots[5]),
          FlSpot(90, widget.month3Spots[6]),
        ];
      case '6 mois':
        return [
          FlSpot(1, widget.month6Spots[0]),
          FlSpot(30, widget.month6Spots[1]),
          FlSpot(60, widget.month6Spots[2]),
          FlSpot(90, widget.month6Spots[3]),
          FlSpot(120, widget.month6Spots[4]),
          FlSpot(150, widget.month6Spots[5]),
          FlSpot(180, widget.month6Spots[6]),
        ];
      case '1 an':
        return [
          FlSpot(1, widget.yearSpots[0]),
          FlSpot(60, widget.yearSpots[1]),
          FlSpot(120, widget.yearSpots[2]),
          FlSpot(180, widget.yearSpots[3]),
          FlSpot(240, widget.yearSpots[4]),
          FlSpot(300, widget.yearSpots[5]),
          FlSpot(365, widget.yearSpots[6]),
        ];
      case 'Total':
        return yspots;
      default:
        return [];
    }
  }

  void _onRangeSelected(String range) {
    setState(() {
      selectedRange = range;
      spots = _getDataForRange(range);
    });
  }

  // Function to calculate interval based on selected range
  double _calculateInterval() {
    switch (selectedRange) {
      case 'Semaine':
        return 1; // 1 interval per day (7 days)
      case '1 mois':
        return 30 / 7; // Approx 4 or 5 days per interval
      case '3 mois':
        return 90 / 7; // Approx 13 days per interval
      case '6 mois':
        return 180 / 7; // Approx 25 days per interval
      case '1 an':
        return 365 / 7; // Approx 52 days per interval
      default:
        return 1; // Default interval
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildRangeButton('Semaine'),
                  _buildRangeButton('1 mois'),
                  _buildRangeButton('3 mois'),
                  _buildRangeButton('6 mois'),
                  _buildRangeButton('1 an'),
                  _buildRangeButton('Total'),
                ],
              ),
              SizedBox(height: 20),
              AspectRatio(
                aspectRatio: 1.9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LineChart(
                    LineChartData(
                      minY: spots.map((spot) => spot.y).reduce((a, b) => a < b ? a : b) - 1,
                      maxY: spots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b) + 1,
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false), // Hide left axis
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false), // Hide right axis
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false), // Hide top axis
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  selectedRange == 'Total' ? value.toInt().toString() : '${value.toInt()}',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              );
                            },
                            interval: _calculateInterval(), // Use the dynamic interval
                          ),
                        ),
                      ),
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: spots,
                          isCurved: false, // Sharp edges
                          color: Colors.blueGrey,
                          barWidth: 2,
                          dotData: const FlDotData(show: true),
                        ),
                      ],
                      // extraLinesData: ExtraLinesData(horizontalLines: [
                      //   HorizontalLine(
                      //     y: 14.5,
                      //     color: Colors.redAccent,
                      //     strokeWidth: 25,
                      //     label: HorizontalLineLabel(
                      //       show: true,
                      //       labelResolver: (_) => 'Élevé par rapport au marché',
                      //       alignment: Alignment.centerLeft,
                      //       style: const TextStyle(
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      // ]),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build the range buttons
  Widget _buildRangeButton(String range) {
    return GestureDetector(
      onTap: () => _onRangeSelected(range),
      child: Text(
        range,
        style: TextStyle(
          fontWeight: selectedRange == range ? FontWeight.bold : FontWeight.normal,
          color: selectedRange == range ? Colors.blueGrey[800] : Colors.grey[600],
        ),
      ),
    );
  }
}
//
//
//
//
//
//




class DataPoint {
  final int year;
  final double value;

  const DataPoint({required this.year, required this.value});
}
