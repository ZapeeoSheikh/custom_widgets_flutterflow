// import 'package:event_calander/function.dart';
import 'package:event_calander/event_calendar.dart';
import 'package:event_calander/place%20API.dart';
import 'package:event_calander/range_slider.dart';
import 'package:event_calander/timeSlot_picker.dart';
import 'package:flutter/material.dart';
// import 'package:calendar_view/calendar_view.dart';

import 'chart.dart';
import 'function.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: FunctionTesting()
 home: DoubleSlider(startPoint: 20, endPoint: 80)
 // home: GooglePlacesSearchWidget(apiKey: 'AIzaSyCHjdNb9HxLuysDr1ZbJyNsQYRob6k5DkM',)


      // home: CustomLineChart(
      //   ejan: 5000,
      //   emar: 2000,
      //   emay: 4000,
      //   ejuly: 2000,
      //   esep: 5000,
      //   enov: 1000,
      //   ajan: 3000,
      //   amar: 3000,
      //   amay: 1000,
      //   ajuly: 900,
      //   asep: 6000,
      //   anov: 3000,
      // ),
// home:
//       EventCalandar(events: [
//         ShipmentRecord(id: 12, pickUpDate: "2024-05-01", pickUpHour: '2:00 AM', carrier: "TCCP"),
//         ShipmentRecord(id: 12, pickUpDate: "2024-05-02", pickUpHour: '2:00 AM', carrier: "TCCP"),
//         ShipmentRecord(id: 12, pickUpDate: "2024-05-03", pickUpHour: '2:00 AM', carrier: "TCCP"),
//         ShipmentRecord(id: 12, pickUpDate: "2024-05-04", pickUpHour: '2:00 AM', carrier: "TCCP"),
//
//       ]),
    );
  }
}
