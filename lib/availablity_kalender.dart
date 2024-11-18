
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!


import 'package:kalender/kalender.dart';

import 'bookingType.dart';
import 'eventType.dart';

const String default_language = "fr";

class StaticCalendarWidget extends StatefulWidget {
  const StaticCalendarWidget({
    super.key,
    this.width,
    this.height,
    this.startingEvent,
    this.endingEvent,
    this.bookings,
    this.unaivability,
    this.languageValue,
    this.currentBooking,
  });

  final double? width;
  final double? height;
  final DateTime? startingEvent;
  final DateTime? endingEvent;
  final List<BookingsRecord>? bookings;
  final List<UnavailabilityRecord>? unaivability;
  final String? languageValue;
  final BookingDataTypeStruct? currentBooking;

  @override
  State<StaticCalendarWidget> createState() => _StaticCalendarWidgetState();
}

class _StaticCalendarWidgetState extends State<StaticCalendarWidget> {



  final CalendarController<Event> controller = CalendarController(
    calendarDateTimeRange: DateTimeRange(
      start: DateTime(DateTime.now().year - 1),
      end: DateTime(DateTime.now().year + 1),
    ),
  );
  final CalendarEventsController<Event> eventController =
  CalendarEventsController<Event>();

  late ViewConfiguration currentConfiguration = viewConfigurations[0];
  List<ViewConfiguration> viewConfigurations = [
    WeekConfiguration(
      showDayHeader: true,
      showMultiDayHeader: true,
      showWeekNumber: false,
      // startHour: widget.startingEvent?.hour ?? 6,
      // endHour: widget.endingEvent?.hour ?? 18,
    ),
    CustomMultiDayConfiguration(
      name: 'Day',
      numberOfDays: 1,
      startHour: 6,
      endHour: 18,
    ),
    CustomMultiDayConfiguration(
      name: 'Custom',
      numberOfDays: 1,
    ),
    WorkWeekConfiguration(),
    MonthConfiguration(),
    ScheduleConfiguration(),
    MultiWeekConfiguration(
      numberOfWeeks: 3,
    ),
  ];

  @override
  void initState() {
    super.initState();

    DateTime now = DateTime.now();
    // eventController.addEvents([
    //   CalendarEvent(
    //     dateTimeRange: DateTimeRange(
    //       start: now.subtract(const Duration(hours: 5)),
    //       end: now.subtract(const Duration(hours: 1)),
    //     ),
    //     eventData: Event(title: 'Event 1'),
    //   ),
    //   CalendarEvent(
    //     dateTimeRange: DateTimeRange(
    //       start: now.subtract(const Duration(hours: 5)),
    //       end: now.subtract(const Duration(hours: 2)),
    //     ),
    //     eventData: Event(title: 'Event 2'),
    //   ),
    // ]);

    // print(widget.bookings);
    // print("TEST INITIALISAITON");

    final currentEvent2 = CalendarEvent<Event>(
      dateTimeRange: DateTimeRange(
        start: now.add(const Duration(hours: 16)), // Cible dans la semaine
        end: now.add(const Duration(hours: 18)),
      ),
      eventData: Event(
        title: '',
        color: const Color.fromARGB(255, 84, 151, 167),
        type: EventType.Temporary,
      ),
    );

    eventController.addEvents([currentEvent2]);

    List<ViewConfiguration> viewConfigurations = [
      WeekConfiguration(
        // timelineWidth: 10,
        // hourLineLeftMargin: 10,
        // multiDayTileHeight: 10,
        showDayHeader: false,
        showMultiDayHeader: false,
        showWeekNumber: false,
        createEvents: false,
        // verticalStepDuration: const Duration(minutes: 15),
        startHour: (currentEvent2.dateTimeRange.start.hour - 2) ?? 6,
        endHour: widget.endingEvent?.hour ?? 18,
      ),
      CustomMultiDayConfiguration(
        name: 'Day',
        numberOfDays: 1,
        startHour: 6,
        endHour: 18,
      ),
      CustomMultiDayConfiguration(
        name: 'Custom',
        numberOfDays: 1,
      ),
      WorkWeekConfiguration(),
      MonthConfiguration(),
      ScheduleConfiguration(),
      MultiWeekConfiguration(
        numberOfWeeks: 3,
      ),
    ];
    currentConfiguration = viewConfigurations[0];

    // eventController.addEvents(generateCalendarEvents(widget.bookings,
    // widget.unaivability, widget.languageValue ?? default_language));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.jumpToDate(currentEvent2.dateTimeRange.start);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(
    //     'FRANCO startingDay: ${widget.startingEvent}, endingDay: ${widget.endingEvent}, bookings: ${widget.bookings}, unavailability: ${widget.unaivability}');
    try {
      eventController
          .removeWhere((event) => event.eventData!.type != EventType.Temporary);
      //eventsController.clearEvents();
      eventController.addEvents(generateCalendarEvents(widget.bookings,
          widget.unaivability, widget.languageValue ?? default_language));
    } catch (e) {
      print("error");
      print(e);
    }
    return Scaffold(
      body: SafeArea(
        child: CalendarView(
          controller: controller,
          eventsController: eventController,
          viewConfiguration: currentConfiguration,
          tileBuilder: _tileBuilder,
          multiDayTileBuilder: _multiDayTileBuilder,
          scheduleTileBuilder: _scheduleTileBuilder,
          // components: CalendarComponents(
          //   calendarHeaderBuilder: _calendarHeader,
          // ),
          eventHandlers: CalendarEventHandlers(
            onEventTapped: _onEventTapped,
            onEventChanged: _onEventChanged,
            onCreateEvent: _onCreateEvent,
            onEventCreated: _onEventCreated,
          ),
        ),
      ),
    );
  }

  CalendarEvent<Event> _onCreateEvent(DateTimeRange dateTimeRange) {
    return CalendarEvent(
      dateTimeRange: dateTimeRange,
      eventData: Event(
        title: 'New Event',
      ),
    );
  }

  Future<void> _onEventCreated(CalendarEvent<Event> event) async {
    // Add the event to the events controller.
    eventController.addEvent(event);
    // Deselect the event.
    eventController.deselectEvent();
  }

  Future<void> _onEventTapped(
      CalendarEvent<Event> event,
      ) async {
    eventController.selectedEvent == event
        ? eventController.deselectEvent()
        : eventController.selectEvent(event);
    return;
  }

  Future<void> _onEventChanged(
      DateTimeRange initialDateTimeRange,
      CalendarEvent<Event> event,
      ) async {
    eventController.deselectEvent();
  }

  Widget _tileBuilder(
      CalendarEvent<Event> event,
      TileConfiguration configuration,
      ) {
    final color = event.eventData?.color ?? Colors.blue;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.zero,
      elevation: 0,
      color: configuration.tileType != TileType.ghost
          ? color
          : color.withAlpha(100),
      child: Center(
        child: configuration.tileType != TileType.ghost
            ? Text(event.eventData?.title ?? 'New Event')
            : null,
      ),
    );
  }

  Widget _multiDayTileBuilder(
      CalendarEvent<Event> event,
      MultiDayTileConfiguration configuration,
      ) {
    final color = event.eventData?.color ?? Colors.blue;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2),
      elevation: 0,
      color: configuration.tileType == TileType.ghost
          ? color.withAlpha(100)
          : color,
      child: Center(
        child: configuration.tileType != TileType.ghost
            ? Text(event.eventData?.title ?? 'New Event')
            : null,
      ),
    );
  }

  Widget _scheduleTileBuilder(CalendarEvent<Event> event, DateTime date) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: event.eventData?.color ?? Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(event.eventData?.title ?? 'New Event'),
    );
  }

  Widget _calendarHeader(DateTimeRange dateTimeRange) {
    return Row(
      children: [
        IconButton(
          onPressed: controller.animateToPreviousPage,
          icon: const Icon(Icons.navigate_before_rounded),
        ),
        IconButton(
          onPressed: controller.animateToNextPage,
          icon: const Icon(Icons.navigate_next_rounded),
        ),
        IconButton(
          onPressed: () {
            controller.animateToDate(DateTime.now());
          },
          icon: const Icon(Icons.today),
        ),
      ],
    );
  }
}

List<CalendarEvent<Event>> generateCalendarEvents(
    List<BookingsRecord>? bookings,
    List<UnavailabilityRecord>? unaivabilities,
    String languageValue,
    ) {
  List<CalendarEvent<Event>> events = [];
  if (bookings != null) {
    print(bookings);
    print("FRANCO");
    for (var booking in bookings) {
      try {
        // Suppose the booking class has startTime, endTime, and other fields
        DateTime startTime = booking.startTime!;
        DateTime endTime = booking.endTime!;
        // String title =
        //     '${getLocalizedText(languageValue, "Busy schedule from ", "Planning occupé du ")} ${booking.startTime} ${getLocalizedText(languageValue, "to", "au")} ${booking.enTime} ';
        String title = '';

        // Create a CalendarEvent for each booking
        events.add(
          CalendarEvent<Event>(
            dateTimeRange: DateTimeRange(
              start: startTime,
              end: endTime,
            ),
            eventData: Event(
              title: title,
              description: '',
              // description:
              //     'Service id: ${booking.serviceId}, Worker id: ${booking.workerId}',
              color: Color.fromARGB(125, 46, 53,
                  50), // You can customize the color based on the status or other criteria
            ),
          ),
        );
        // print('NOUVEAU BOOKING');
      } catch (e) {
        // print('ERREUR BOOKING');
        print(e);
      }
    }
  }
  if (unaivabilities != null) {
    for (var unaivability in unaivabilities) {
      try {
        // Suppose the booking class has startTime, endTime, and other fields
        DateTime startTime = unaivability.startTime!;
        DateTime endTime = unaivability.endTime!;
        // String title =
        //     '${getLocalizedText(languageValue, "Period of unavailability of the ", "Periode d\'indisponiblité du ")} ${startTime} ${getLocalizedText(languageValue, "to", "au")} ${endTime} '; // Replace with a more meaningful title if needed
        String title = ''; // Replace with a more meaningful title if needed

        // Create a CalendarEvent for each booking
        events.add(
          CalendarEvent<Event>(
            dateTimeRange: DateTimeRange(
              start: startTime,
              end: endTime,
            ),
            eventData: Event(
              title: title,
              // description: 'Worker id : ${unaivability.workerId}',
              description: '',
              color: Colors
                  .red, // You can customize the color based on the status or other criteria
            ),
          ),
        );
      } catch (e) {
        print('Error with unaivability');
        print(e);
      }
    }
  }

  return events;
}

class Event {
  Event({
    required this.title,
    this.type = EventType.Booking,
    this.description,
    this.color,
  });

  /// The title of the [Event].
  final String title;

  /// The enum of the [Event].
  final EventType type;

  /// The description of the [Event].
  final String? description;

  /// The color of the [Event] tile.
  final Color? color;

  Event copyWith({
    String? title,
    EventType? type,
    String? description,
    Color? color,
  }) {
    return Event(
      title: title ?? this.title,
      type: type ?? this.type,
      description: description ?? this.description,
      color: color ?? this.color,
    );
  }

  @override
  String toString() {
    return 'title: $title, type: $type, description: $description, color: ${color.toString()}';
  }
}










//
//
// import 'package:kalender/kalender.dart';
//
// // DO NOT REMOVE OR MODIFY THE CODE ABOVE!
// import 'package:flutter/material.dart';
// // Begin custom widget code
//
// import 'eventType.dart';
// import 'bookingType.dart';
//
//
// class StaticCalendarWidget extends StatefulWidget {
//   const StaticCalendarWidget({
//     super.key,
//     this.width,
//     this.height,
//     this.startingEvent,
//     this.endingEvent,
//     this.bookings,
//     this.unavailability,
//     this.languageValue,
//     this.currentBooking,
//   });
//
//   final double? width;
//   final double? height;
//   final DateTime? startingEvent;
//   final DateTime? endingEvent;
//   final List<BookingsRecord>? bookings;
//   final List<UnavailabilityRecord>? unavailability;
//   final String? languageValue;
//   final BookingDataTypeStruct? currentBooking;
//
//   @override
//   State<StaticCalendarWidget> createState() => _StaticCalendarWidgetState();
// }
//
// const String default_language = "fr";
//
// List<CalendarEvent<Event>> generateCalendarEvents(
//     List<BookingsRecord>? bookings,
//     List<UnavailabilityRecord>? unavailability,
//     String languageValue,
//     ) {
//   List<CalendarEvent<Event>> events = [];
//
//   // Process bookings
//   if (bookings != null) {
//     for (var booking in bookings) {
//       try {
//         DateTime startTime = booking.startTime!;
//         DateTime endTime = booking.endTime!;
//         String title = ''; // Placeholder or add localized title
//
//         events.add(CalendarEvent<Event>(
//           dateTimeRange: DateTimeRange(start: startTime, end: endTime),
//           eventData: Event(title: title, color: Color.fromARGB(125, 46, 53, 50)),
//         ));
//       } catch (e) {
//         print(e);
//       }
//     }
//   }
//
//   // Process unavailability
//   if (unavailability != null) {
//     for (var unavailable in unavailability) {
//       try {
//         DateTime startTime = unavailable.startTime!;
//         DateTime endTime = unavailable.endTime!;
//         String title = ''; // Placeholder or add localized title
//
//         events.add(CalendarEvent<Event>(
//           dateTimeRange: DateTimeRange(start: startTime, end: endTime),
//           eventData: Event(title: title, color: Colors.red),
//         ));
//       } catch (e) {
//         print(e);
//       }
//     }
//   }
//
//   return events;
// }
//
// class Event {
//   Event({
//     required this.title,
//     this.type = EventType.Booking,
//     this.description,
//     this.color,
//   });
//
//   final String title;
//   final EventType type;
//   final String? description;
//   final Color? color;
//
//   Event copyWith({String? title, EventType? type, String? description, Color? color}) {
//     return Event(
//       title: title ?? this.title,
//       type: type ?? this.type,
//       description: description ?? this.description,
//       color: color ?? this.color,
//     );
//   }
//
//   @override
//   String toString() {
//     return 'title: $title, type: $type, description: $description, color: ${color.toString()}';
//   }
// }

// class _StaticCalendarWidgetState extends State<StaticCalendarWidget> {
//   final CalendarController<Event> controller = CalendarController(
//     calendarDateTimeRange: DateTimeRange(
//       start: DateTime(DateTime.now().year - 1),
//       end: DateTime(DateTime.now().year + 1),
//     ),
//   );
//   final CalendarEventsController<Event> eventController = CalendarEventsController<Event>();
//
//   late ViewConfiguration currentConfiguration = viewConfigurations[0];
//   List<ViewConfiguration> viewConfigurations = [
//     WeekConfiguration(
//       showDayHeader: true,
//       showMultiDayHeader: true,
//       showWeekNumber: false,
//     ),
//     CustomMultiDayConfiguration(
//       name: 'Day',
//       numberOfDays: 1,
//       startHour: 6,
//       endHour: 18,
//     ),
//     CustomMultiDayConfiguration(
//       name: 'Custom',
//       numberOfDays: 1,
//     ),
//     WorkWeekConfiguration(),
//     MonthConfiguration(),
//     ScheduleConfiguration(),
//     MultiWeekConfiguration(numberOfWeeks: 3),
//   ];
//
//   @override
//   @override
//   void initState() {
//     super.initState();
//
//     DateTime now = DateTime.now();
//     final currentEvent2 = CalendarEvent<Event>(
//       dateTimeRange: DateTimeRange(
//         start: now.add(const Duration(hours: 16)),
//         end: now.add(const Duration(hours: 18)),
//       ),
//       eventData: Event(
//         title: '',
//         color: const Color.fromARGB(255, 84, 151, 167),
//         type: EventType.Temporary,
//       ),
//     );
//
//     // Placeholder lists for bookings and unavailabilities.
//     List<CalendarEvent> bookings = []; // Populate this list with booking events.
//     List<CalendarEvent> unavailabilities = []; // Populate this list with unavailable times.
//
//     eventController.addEvents([...bookings, ...unavailabilities]);
//
//     // Initialize the view configurations based on worker hours
//     int workerStartHour = 6; // replace with actual start hour from parameters
//     int workerEndHour = 18; // replace with actual end hour from parameters
//
//     List<ViewConfiguration> viewConfigurations = [
//       WeekConfiguration(
//         startHour: workerStartHour,
//         endHour: workerEndHour,
//         // Pass other configurations as needed
//       ),
//       CustomMultiDayConfiguration(
//         name: 'Day',
//         startHour: workerStartHour,
//         endHour: workerEndHour,
//       ),
//       // Add other configurations if necessary
//     ];
//
//     currentConfiguration = viewConfigurations[0];
//
//     // Disable past slots and unavailable slots
//     controller.onSlotSelected = (selectedSlot) {
//       DateTime selectedStart = selectedSlot.start;
//       DateTime selectedEnd = selectedSlot.end;
//
//       bool isInPast = selectedStart.isBefore(DateTime.now());
//       bool isUnavailable = unavailabilities.any((event) =>
//       selectedStart.isBefore(event.dateTimeRange.end) &&
//           selectedEnd.isAfter(event.dateTimeRange.start));
//       bool isBooked = bookings.any((event) =>
//       selectedStart.isBefore(event.dateTimeRange.end) &&
//           selectedEnd.isAfter(event.dateTimeRange.start));
//
//       if (isInPast || isUnavailable || isBooked) {
//         // Show error or disable the selection
//         print("Cannot book this slot");
//       } else {
//         // Update the page state with the selected slot
//         setState(() {
//           // Assign selectedSlot to a page state variable
//         });
//         print("Slot selected successfully");
//       }
//     };
//
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       controller.jumpToDate(currentEvent2.dateTimeRange.start);
//     });
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CalendarView(
//         controller: controller,
//         eventsController: eventController,
//         viewConfiguration: currentConfiguration,
//         tileBuilder: _tileBuilder,
//         multiDayTileBuilder: _multiDayTileBuilder,
//         scheduleTileBuilder: _scheduleTileBuilder,
//         eventHandlers: CalendarEventHandlers(
//           onEventTapped: _onEventTapped,
//           onEventChanged: _onEventChanged,
//           onCreateEvent: _onCreateEvent,
//           onEventCreated: _onEventCreated,
//         ),
//       ),
//     );
//   }
//
//   CalendarEvent<Event> _onCreateEvent(DateTimeRange dateTimeRange) {
//     return CalendarEvent(
//       dateTimeRange: dateTimeRange,
//       eventData: Event(title: 'New Event'),
//     );
//   }
//
//   Future<void> _onEventCreated(CalendarEvent<Event> event) async {
//     eventController.addEvent(event);
//     eventController.deselectEvent();
//   }
//
//   Future<void> _onEventTapped(CalendarEvent<Event> event) async {
//     return;
//   }
//
//   Future<void> _onEventChanged(DateTimeRange initialDateTimeRange, CalendarEvent<Event> event) async {
//     eventController.deselectEvent();
//   }
//
//   Widget _tileBuilder(CalendarEvent<Event> event, TileConfiguration configuration) {
//     final color = event.eventData?.color ?? Colors.blue;
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       margin: EdgeInsets.zero,
//       elevation: 0,
//       color: configuration.tileType != TileType.ghost ? color : color.withAlpha(100),
//       child: Center(
//         child: configuration.tileType != TileType.ghost
//             ? Text(event.eventData?.title ?? 'New Event')
//             : null,
//       ),
//     );
//   }
//
//   Widget _multiDayTileBuilder(CalendarEvent<Event> event, MultiDayTileConfiguration configuration) {
//     final color = event.eventData?.color ?? Colors.blue;
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 2),
//       elevation: 0,
//       color: configuration.tileType == TileType.ghost ? color.withAlpha(100) : color,
//       child: Center(
//         child: configuration.tileType != TileType.ghost ? Text(event.eventData?.title ?? 'New Event') : null,
//       ),
//     );
//   }
//
//   Widget _scheduleTileBuilder(CalendarEvent<Event> event, DateTime date) {
//     return DecoratedBox(
//       decoration: BoxDecoration(
//         color: event.eventData?.color ?? Colors.blue,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Text(event.eventData?.title ?? 'New Event'),
//     );
//   }
// }
