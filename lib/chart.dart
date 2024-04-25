// ignore_for_file: public_member_api_docs, sort_constructors_first
// Automatic FlutterFlow imports

// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatefulWidget {
  const CustomLineChart({
    super.key,
    this.width,
    this.height,
    required this.ejan,
    required this.emar,
    required this.emay,
    required this.ejuly,
    required this.esep,
    required this.enov,
    required this.ajan,
    required this.amar,
    required this.amay,
    required this.ajuly,
    required this.asep,
    required this.anov,
  });

  final double? width;
  final double? height;

  final double ejan;
  final double emar;
  final double emay;
  final double ejuly;
  final double esep;
  final double enov;
  final double ajan;
  final double amar;
  final double amay;
  final double ajuly;
  final double asep;
  final double anov;

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {
  List<Cost> estimatedCostList = [];
  List<Cost> actualCostList = [];

  @override
  void initState() {

    estimatedCostList = [
      Cost(month: 'jan', cost: widget.ejan),
      Cost(month: 'march', cost: widget.emar),
      Cost(month: 'may', cost: widget.emay),
      Cost(month: 'july', cost: widget.ejuly),
      Cost(month: 'sep', cost: widget.esep),
      Cost(month: 'nov', cost: widget.enov),
    ];

    actualCostList = [
    Cost(month: 'jan', cost: widget.ajan),
    Cost(month: 'march', cost: widget.amar),
    Cost(month: 'may', cost: widget.amay),
    Cost(month: 'july', cost: widget.ajuly),
    Cost(month: 'sep', cost: widget.asep),
    Cost(month: 'nov', cost: widget.anov)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            height: 300,
            child: LineChart(
              sampleData1,
            ),
          ),
        ],
      ),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        gridData: gridData,
        titlesData: titlesData,
        borderData: borderData,
        lineBarsData: lineBarsData,
        minX: 0,
        maxX: estimatedCostList.length.toDouble() - 1,
        maxY: estimatedCostList
            .map((obj) => obj.cost)
            .reduce((value, element) => value > element ? value : element),
        minY: 0,
      );

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: true, reservedSize: 50),
        ),
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  List<LineChartBarData> get lineBarsData =>
      [estimatedCostListData, actualCostListData];

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String datavalue;
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    );
    if (value.toInt() < estimatedCostList.length) {
      datavalue = "${estimatedCostList[value.toInt()].month}";
    } else {
      datavalue = '';
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: Text(
        datavalue,
        style: style,
      ),
    );
  }

  SideTitles get bottomTitles => SideTitles(
      showTitles: true,
      getTitlesWidget: bottomTitleWidgets,
      interval: 1,
      reservedSize: 40);

  FlGridData get gridData => const FlGridData(show: true);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.2), width: 2),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get estimatedCostListData => LineChartBarData(
        isCurved: false,
        color: Colors.blue,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(show: false),
        spots: estimatedCostList
            .asMap()
            .entries
            .map((entry) => FlSpot(entry.key.toDouble(), entry.value.cost))
            .toList(),
      );

  LineChartBarData get actualCostListData => LineChartBarData(
        isCurved: false,
        color: Colors.green,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(show: false),
        spots: actualCostList
            .asMap()
            .entries
            .map((entry) => FlSpot(entry.key.toDouble(), entry.value.cost))
            .toList(),
      );
}

class Cost {
  String month;
  double cost;

  Cost({
    required this.month,
    required this.cost,
  });
}
