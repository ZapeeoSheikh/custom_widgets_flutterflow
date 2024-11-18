// import 'package:flutter/material.dart';
//
// class PercentageBar extends StatelessWidget {
//   final double value1;
//   final double value2;
//   final double value3;
//
//   const PercentageBar({
//     super.key,
//     required this.value1,
//     required this.value2,
//     required this.value3,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     // Calculate total value and percentages
//     final totalValue = value1 + value2 + value3;
//     final percentage1 = (value1 / totalValue) * 100;
//     final percentage2 = (value2 / totalValue) * 100;
//     final percentage3 = (value3 / totalValue) * 100;
//
//     return Container(
//             width: 280,
//
//             child: Stack(
//               alignment: Alignment(.9, .1),
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       flex: percentage1.toInt(),
//                       child: Container(
//                         height: 45,
//                         decoration: BoxDecoration(
//                             color: Colors.blueGrey,
//                             borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))
//                         ),// Adjust color as needed
//                       ),
//                     ),
//                     Expanded(
//                       flex: percentage2.toInt(),
//                       child: Container(
//                         height: 45,
//                         color: Colors.green, // Adjust color as needed
//                       ),
//                     ),
//                     Expanded(
//                       flex: percentage3.toInt(),
//                       child: Container(
//                         height: 45,
//                         decoration: BoxDecoration(
//                             color: Colors.amber, // Adjust color as needed
//                             borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8))
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                     "${value1 + value2 + value3} \€",
//                   style: FlutterFlowTheme.of(context).bodyMedium.override(
//                     fontFamily: 'Readex Pro',
//                     color: FlutterFlowTheme.of(context).primaryBackground,
//                     fontSize: 24,
//                     letterSpacing: 0.8,
//                     fontWeight: FontWeight.w300,
//                   ),
//                 ),
//
//               ]
//             ),
//           );
//   }
// }