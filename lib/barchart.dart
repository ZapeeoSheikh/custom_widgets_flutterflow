
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'linechart.dart';

class CustomBarChart extends StatefulWidget {
  const CustomBarChart({
    super.key,
    this.width,
    this.height,
    required this.weekSpots,
    required this.monthSpots,
    required this.month3Spots,
    required this.month6Spots,
    required this.yearSpots,
    required this.allYearSpots,
  });

  final double? width;
  final double? height;
  final List<double> weekSpots;
  final List<double> monthSpots;
  final List<double> month3Spots;
  final List<double> month6Spots;
  final List<double> yearSpots;
  final List<DataPoint> allYearSpots;

  @override
  State<CustomBarChart> createState() => _CustomBarChartState();
}

class _CustomBarChartState extends State<CustomBarChart> {
  List<BarChartGroupData> barGroups = [];
  List<FlSpot> yspots = [];
  String selectedRange = '1 mois';

  @override
  void initState() {
    super.initState();
    barGroups = _getDataForRange(selectedRange);

    for (var i = 0; i < widget.allYearSpots.length; i++) {
      final xValue = widget.allYearSpots[i].year;
      final yValue = widget.allYearSpots[i].value;

      yspots.add(FlSpot(xValue.toDouble(), yValue.toDouble()));
    }
  }

  List<BarChartGroupData> _getDataForRange(String range) {
    final data = <double>[];
    switch (range) {
      case 'Semaine':
        data.addAll(widget.weekSpots);
        break;
      case '1 mois':
        data.addAll(widget.monthSpots);
        break;
      case '3 mois':
        data.addAll(widget.month3Spots);
        break;
      case '6 mois':
        data.addAll(widget.month6Spots);
        break;
      case '1 an':
        data.addAll(widget.yearSpots);
        break;
      case 'Total':
        for (var spot in yspots) {
          data.add(spot.y);
        }
        break;
      default:
        return [];
    }
    return List.generate(
      data.length,
          (i) => BarChartGroupData(
        x: i + 1,
        barRods: [
          BarChartRodData(
            toY: data[i],
            width: 10,
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }

  void _onRangeSelected(String range) {
    setState(() {
      selectedRange = range;
      barGroups = _getDataForRange(range);
    });
  }

  double _calculateInterval() {
    switch (selectedRange) {
      case 'Semaine':
        return 1;
      case '1 mois':
        return 4;
      case '3 mois':
        return 10;
      case '6 mois':
        return 20;
      case '1 an':
        return 50;
      default:
        return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                child: BarChart(
                  BarChartData(
                    barGroups: barGroups,
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                value.toInt().toString(),
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            );
                          },
                          interval: _calculateInterval(),
                        ),
                      ),
                    ),
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRangeButton(String range) {
    return GestureDetector(
      onTap: () => _onRangeSelected(range),
      child: Text(
        range,
        style: TextStyle(
          fontWeight:
          selectedRange == range ? FontWeight.bold : FontWeight.normal,
          color:
          selectedRange == range ? Colors.blueGrey[800] : Colors.grey[600],
        ),
      ),
    );
  }
}

