
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventCalandar extends StatefulWidget {
  const EventCalandar({
    super.key,
    this.width,
    this.height,
    required this.events,
  });

  final double? width;
  final double? height;
  final List<ShipmentRecord> events;

  @override
  State<EventCalandar> createState() => _EventCalandarState();
}

class _EventCalandarState extends State<EventCalandar> {
  @override
  final List<CalendarEventData> _events = [];
  final timeFormat = DateFormat("hh:mm a"); // Parser for 'HH:mm a' format
  final timeFormat1 = DateFormat("yyyy-MM-dd hh:mm a"); // Parser for 'HH:mm a' format
  final dateFormatter = DateFormat("yyyy-MM-dd");
  int i = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var item in widget.events) {
      i++;
      final parsedTime = timeFormat.parse(item.pickUpHour!); // Parse string to DateTime
      final newTime = parsedTime.add(Duration(hours: 2));
      final formattedTime = timeFormat.format(newTime);
      final pTime = timeFormat1.parse(item.pickUpDate! + " " +item.pickUpHour!);

      _events.add(
        CalendarEventData(
          color: i % 2 == 0 ? Colors.amber : Colors.blue,
          date: pTime,
          title:
          "ID: ${item.id}\n\n${item.carrier}\n${item.pickUpHour} - ${formattedTime}",
          startTime: pTime,
          endTime: pTime.add(Duration(hours: 2)),
        ),
      );

      print(_events);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WeekView(
          controller: EventController()..addAll(_events),
          showLiveTimeLineInAllDays: true,
          minDay: DateTime(2020),
          maxDay: DateTime(2050),
          initialDay: DateTime.now(),
          heightPerMinute: 1,
          eventArranger: const SideEventArranger(),
          startDay: WeekDays.sunday,
          startHour: 0,
        ));
  }
}


class ShipmentRecord {
  int? id;
  String? pickUpDate;
  String? pickUpHour;
  String? carrier;

  ShipmentRecord({this.id, this.pickUpDate, this.carrier, this.pickUpHour});

  ShipmentRecord.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pickUpDate = json['pickUpDate'];
    pickUpHour = json['pickUpHour'];
    carrier = json['carrier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pickUpDate'] = this.pickUpDate;
    data['pickUpHour'] = this.pickUpHour;
    data['carrier'] = this.carrier;
    return data;
  }
}