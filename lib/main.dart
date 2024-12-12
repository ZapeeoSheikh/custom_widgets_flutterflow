// import 'package:event_calander/function.dart';
import 'package:event_calander/bookingType.dart';
import 'package:event_calander/event_calendar.dart';
import 'package:event_calander/percentage_bar.dart';
import 'package:event_calander/place%20API.dart';
import 'package:event_calander/range_slider.dart';
import 'package:event_calander/sageBuilder.dart';
import 'package:event_calander/timeSlot_picker.dart';
import 'package:flutter/material.dart';
// import 'package:calendar_view/calendar_view.dart';

import 'availablity_kalender.dart';
import 'barchart.dart';
import 'chart.dart';
import 'function.dart';
import 'labeled slider.dart';
import 'linechart.dart';
import 'loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: CustomBarChart(
      //   weekSpots: [10, 20, 3, 40, 25, 16,47 ],
      //   monthSpots: [100, 20, 300, 40, 50, 600, 70],
      //   month3Spots: [100, 20, 300, 402, 520, 610, 750],
      //   month6Spots: [100, 2000, 300, 4010, 5020, 600, 7000],
      //   yearSpots: [10000, 20000, 30000, 40000, 50000, 60000, 70000],
      //   allYearSpots: [
      //     DataPoint(year: 2022, value: 1298),
      //     DataPoint(year: 2023, value: 10298),
      //     DataPoint(year: 2024, value: 3298),
      //   ],)

      // home: CircularProgressBarI(color: Colors.grey, size: 30,),

//       home: CustomSliderPage(
//         width: 800, height: 29,
//         color: Color(0xff5497A7),
//         steps: [
//           1, 5, 10, 15, 20, 25
//         ],
//         stepValues: [
// "","5 €", "10 €", "-5% \nde commission", "10 €", "400 h",
//         ], stepSubValues: [" "," ", " ", "sur les 3 prochaines prestations", " ", "sur votre parcours de grades",  ],
//       ),

    home:StageBuilder(count: 4, currentIndex: 1, height: 45, width: 45)
      // home: FunctionTesting()
      // home: DoubleSlider(startPoint: 20, endPoint: 80)
      // home: PercentageBar(value1: 10000, value2: 2000, value3: 5000,)
      // home: StaticCalendarWidget(
      //   startingEvent: DateTime.now(),
      //   endingEvent: DateTime.now(),
      //   bookings:  [
      //     BookingsRecord(clientId: "1", workerId: "1", serviceId: "1", status: "Paid", scheduledAt: DateTime(2024, 11, 4), completedAt: DateTime.now(), price: 232, review: "review", createdAt: DateTime.now(), updatedAt: DateTime(2024, 12, 4), city: "Lahore", startTime: DateTime.now(), endTime: DateTime.now(), equiped: true, cleanedElec: true, contract: true, numberHour: 23, address: "address")
      //   ],
      //   unaivability: [
      //     UnavailabilityRecord(startTime: DateTime.now().add(Duration(hours: 2)), endTime: DateTime.now().add(Duration(hours: 3)), workerId: "1")
      //       ],
      // )
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
