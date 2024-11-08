// // Automatic FlutterFlow imports
// import '/backend/backend.dart';
// import '/backend/schema/structs/index.dart';
// import '/backend/schema/enums/enums.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/custom_code/widgets/index.dart'; // Imports other custom widgets
// import '/custom_code/actions/index.dart'; // Imports custom actions
// import '/flutter_flow/custom_functions.dart'; // Imports custom functions
// import 'package:flutter/material.dart';
// // Begin custom widget code
// // DO NOT REMOVE OR MODIFY THE CODE ABOVE!
//
// // import 'package:flutter/rendering.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:intl/find_locale.dart';
// import 'package:intl/intl.dart';
// import 'package:kalender/kalender.dart';
// import 'dart:math';
// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import 'dart:ui';
//
// import 'package:flutter/gestures.dart';
// import 'package:flutter/services.dart';
//
// String getLocalizedText(String languageValue, String textEN, String textFR) {
//   print(languageValue);
//   return languageValue == 'fr' ? textFR : textEN;
// }
//
// const String default_language = "fr";
//
// /*
// class NewEventDialog extends StatefulWidget {
//   const NewEventDialog({
//     super.key,
//     required this.dialogTitle,
//     required this.event,
//     this.width,
//     this.height,
//   });
//
//   final double? width;
//   final double? height;
//   final String dialogTitle;
//   final CalendarEvent<Event> event;
//
//   @override
//   State<NewEventDialog> createState() => _NewEventDialogState();
// }
//
// class _NewEventDialogState extends State<NewEventDialog> {
//   late DateTimeRange dateTimeRange = widget.event.dateTimeRange;
//
//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(
//       insetPadding: EdgeInsets.zero,
//       titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       title: Text(widget.dialogTitle),
//       children: [
//         TextFormField(
//           initialValue: widget.event.eventData?.title,
//           decoration: const InputDecoration(
//             labelText: 'Title',
//             isDense: true,
//           ),
//           onChanged: (value) {
//             widget.event.eventData =
//                 widget.event.eventData?.copyWith(title: value);
//           },
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           child: DateTimeRangeEditor(
//             dateTimeRange: dateTimeRange,
//             onStartChanged: (dateTime) {
//               if (dateTime.isAfter(dateTimeRange.end)) return;
//               setState(() {
//                 dateTimeRange = DateTimeRange(
//                   start: dateTime,
//                   end: dateTimeRange.end,
//                 );
//                 widget.event.dateTimeRange = dateTimeRange;
//               });
//             },
//             onEndChanged: (dateTime) {
//               if (dateTime.isBefore(dateTimeRange.start)) return;
//               setState(() {
//                 dateTimeRange = DateTimeRange(
//                   start: dateTimeRange.start,
//                   end: dateTime,
//                 );
//                 widget.event.dateTimeRange = dateTimeRange;
//               });
//             },
//           ),
//         ),
//         Row(
//           children: [
//             DropdownMenu<Color>(
//               label: const Text('Color'),
//               initialSelection: widget.event.eventData?.color ?? Colors.blue,
//               dropdownMenuEntries: const [
//                 DropdownMenuEntry(value: Colors.blue, label: 'blue'),
//                 DropdownMenuEntry(value: Colors.green, label: 'green'),
//                 DropdownMenuEntry(value: Colors.red, label: 'red'),
//               ],
//               onSelected: (value) {
//                 if (value == null) return;
//                 widget.event.eventData =
//                     widget.event.eventData?.copyWith(color: value);
//               },
//             )
//           ],
//         ),
//         const Divider(),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             TextButton.icon(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               icon: const Icon(Icons.cancel),
//               label: const Text('Cancel'),
//             ),
//             TextButton.icon(
//               onPressed: () {
//                 Navigator.of(context).pop(widget.event);
//               },
//               icon: const Icon(Icons.save),
//               label: const Text('Save'),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
// */
// class DateTimeRangeEditor extends StatelessWidget {
//   const DateTimeRangeEditor({
//     super.key,
//     required this.dateTimeRange,
//     required this.onStartChanged,
//     required this.onEndChanged,
//     required this.languageValue,
//   });
//   final DateTimeRange dateTimeRange;
//   final void Function(DateTime) onStartChanged;
//   final void Function(DateTime) onEndChanged;
//   final String languageValue;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 4),
//           child: DateTimePicker(
//             title: getLocalizedText(languageValue, 'From', 'Depuis'),
//             languageValue: languageValue,
//             helpText: getLocalizedText(languageValue, 'Select start date',
//                 'Sélectionner la date de début'),
//             dateTime: dateTimeRange.start,
//             onDateTimeChanged: (dateTime) {
//               // Vérifie si l'heure de fin est au moins une heure après l'heure de début
//               if (dateTime.isAfter(dateTimeRange.end) ||
//                   dateTimeRange.end.difference(dateTime).inMinutes < 60) {
//                 //final newEndTime = dateTime.add(Duration(hours: 1));
//                 // onEndChanged(newEndTime);
//
//                 ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(getLocalizedText(languageValue,
//                         'One hour minimum', 'Une heure minimum')),
//                   ),
//                 );
//               } else {
//                 onStartChanged(dateTime);
//               }
//             },
//             maxDateTime: dateTimeRange.end,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 4),
//           child: DateTimePicker(
//             title: getLocalizedText(languageValue, 'To', 'Pour'),
//             languageValue: languageValue,
//             helpText: getLocalizedText(languageValue, 'Select end date',
//                 'Sélectionner la date de fin'),
//             dateTime: dateTimeRange.end,
//             onDateTimeChanged: (dateTime) {
//               // Vérifie si l'heure de fin est au moins une heure après l'heure de début
//               if (dateTime.isBefore(dateTimeRange.start) ||
//                   dateTime.difference(dateTimeRange.start).inMinutes < 60) {
//                 //final newEndTime = dateTime.add(Duration(hours: 1));
//                 // onEndChanged(newEndTime);
//                 ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(getLocalizedText(languageValue,
//                         'One hour minimum', 'Une heure minimum')),
//                   ),
//                 );
//               } else {
//                 onEndChanged(dateTime);
//               }
//             },
//             minDateTime: dateTimeRange.start,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class DateTimePicker extends StatefulWidget {
//   const DateTimePicker({
//     super.key,
//     required this.title,
//     required this.dateTime,
//     required this.onDateTimeChanged,
//     this.helpText,
//     this.minDateTime,
//     this.maxDateTime,
//     required this.languageValue,
//   });
//
//   final String title;
//   final String? helpText;
//   final DateTime dateTime;
//   final DateTime? minDateTime;
//   final DateTime? maxDateTime;
//   final Function(DateTime dateTime) onDateTimeChanged;
//   final String languageValue;
//
//   @override
//   State<DateTimePicker> createState() => _DateTimePickerState();
// }
//
// class _DateTimePickerState extends State<DateTimePicker> {
//   late DateTime dateTime = widget.dateTime;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           widget.title,
//           style: Theme.of(context).textTheme.bodySmall,
//         ),
//         Form(
//           autovalidateMode: AutovalidateMode.always,
//           child: Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: TextFormField(
//                   initialValue: dateTime.hour.toString(),
//                   onChanged: (value) {
//                     int? hourValue = int.tryParse(value);
//                     if (hourValue == null || hourValue < 0 || hourValue > 23) {
//                       return;
//                     }
//
//                     widget.onDateTimeChanged(
//                       DateTime(
//                         dateTime.year,
//                         dateTime.month,
//                         dateTime.day,
//                         hourValue,
//                         dateTime.minute,
//                       ),
//                     );
//                   },
//                   textAlign: TextAlign.center,
//                   keyboardType: TextInputType.number,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.allow(RegExp('[0-9]')),
//                   ],
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return getLocalizedText(widget.languageValue,
//                           'Please enter a value', 'Veuillez saisir une valeur');
//                     }
//                     int hourValue = int.parse(value);
//
//                     DateTime newDateTime = DateTime(
//                       dateTime.year,
//                       dateTime.month,
//                       dateTime.day,
//                       hourValue,
//                       dateTime.minute,
//                     );
//
//                     if (widget.minDateTime != null &&
//                         newDateTime.isBefore(widget.minDateTime!)) {
//                       return getLocalizedText(
//                           widget.languageValue, 'Invalid', 'Invalide');
//                     }
//
//                     if (widget.maxDateTime != null &&
//                         newDateTime.isAfter(widget.maxDateTime!)) {
//                       return getLocalizedText(
//                           widget.languageValue, 'Invalid', 'Invalide');
//                     }
//
//                     dateTime = newDateTime;
//
//                     return null;
//                   },
//                   decoration: const InputDecoration(isDense: true),
//                 ),
//               ),
//               const Text(':'),
//               Expanded(
//                 flex: 1,
//                 child: TextFormField(
//                   initialValue: widget.dateTime.minute.toString(),
//                   onChanged: (value) {
//                     int? minuteValue = int.tryParse(value);
//                     if (minuteValue == null ||
//                         minuteValue < 0 ||
//                         minuteValue > 59) return;
//                     widget.onDateTimeChanged(
//                       DateTime(
//                         dateTime.year,
//                         dateTime.month,
//                         dateTime.day,
//                         dateTime.hour,
//                         minuteValue,
//                       ),
//                     );
//                   },
//                   keyboardType: TextInputType.number,
//                   textAlign: TextAlign.center,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.allow(RegExp('[0-9]')),
//                   ],
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return getLocalizedText(widget.languageValue,
//                           'Please enter a value', 'Veuillez saisir une valeur');
//                     }
//                     int? minuteValue = int.parse(value);
//
//                     DateTime newDateTime = DateTime(
//                       dateTime.year,
//                       dateTime.month,
//                       dateTime.day,
//                       dateTime.hour,
//                       minuteValue,
//                     );
//
//                     if (widget.minDateTime != null &&
//                         newDateTime.isBefore(widget.minDateTime!)) {
//                       return getLocalizedText(
//                           widget.languageValue, 'Invalid', 'Invalide');
//                     }
//
//                     if (widget.maxDateTime != null &&
//                         newDateTime.isAfter(widget.maxDateTime!)) {
//                       return getLocalizedText(
//                           widget.languageValue, 'Invalid', 'Invalide');
//                     }
//
//                     dateTime = newDateTime;
//
//                     return null;
//                   },
//                   decoration: const InputDecoration(isDense: true),
//                 ),
//               ),
//               Flexible(
//                 flex: 2,
//                 child: TextButton(
//                   onPressed: () async {
//                     DateTime? selectedDate = await showDatePicker(
//                       context: context,
//                       initialDate: widget.dateTime,
//                       firstDate: DateTime(1970),
//                       lastDate: DateTime(2070),
//                       helpText: widget.helpText,
//                     );
//                     if (selectedDate == null) return;
//                     widget.onDateTimeChanged(selectedDate);
//                   },
//                   child: Text(
//                       '${widget.dateTime.day}/${widget.dateTime.month}/${widget.dateTime.year}'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class EventEditDialog extends StatefulWidget {
//   const EventEditDialog(
//       {super.key,
//       required this.dialogTitle,
//       required this.event,
//       required this.deleteEvent,
//       required this.cancelEdit,
//       required this.languageValue});
//
//   final String dialogTitle;
//   final CalendarEvent<Event> event;
//   final void Function(CalendarEvent<Event> event) deleteEvent;
//   final VoidCallback cancelEdit;
//   final String languageValue;
//
//   @override
//   State<EventEditDialog> createState() => _EventEditDialogState();
// }
//
// class _EventEditDialogState extends State<EventEditDialog> {
//   late DateTimeRange dateTimeRange = widget.event.dateTimeRange;
//
//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(
//       insetPadding: EdgeInsets.zero,
//       titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(widget.dialogTitle),
//           IconButton.filledTonal(
//             tooltip: getLocalizedText(
//                 widget.languageValue, 'Delete Event', 'Supprimer un événement'),
//             onPressed: () {
//               widget.deleteEvent(widget.event);
//               Navigator.of(context).pop();
//             },
//             icon: const Icon(Icons.delete),
//           )
//         ],
//       ),
//       children: [
//         TextFormField(
//           initialValue: widget.event.eventData?.title,
//           decoration: InputDecoration(
//             labelText: getLocalizedText(widget.languageValue, 'Title', 'Titre'),
//             isDense: true,
//           ),
//           onChanged: (value) {
//             widget.event.eventData =
//                 widget.event.eventData?.copyWith(title: value);
//           },
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           child: DateTimeRangeEditor(
//             languageValue: widget.languageValue,
//             dateTimeRange: widget.event.dateTimeRange,
//             onStartChanged: (dateTime) {
//               if (dateTime.isAfter(dateTimeRange.end)) return;
//               setState(() {
//                 dateTimeRange = DateTimeRange(
//                   start: dateTime,
//                   end: dateTimeRange.end,
//                 );
//                 widget.event.dateTimeRange = dateTimeRange;
//               });
//             },
//             onEndChanged: (dateTime) {
//               if (dateTime.isBefore(dateTimeRange.start)) return;
//               setState(() {
//                 dateTimeRange = DateTimeRange(
//                   start: dateTimeRange.start,
//                   end: dateTime,
//                 );
//                 widget.event.dateTimeRange = dateTimeRange;
//               });
//             },
//           ),
//         ),
//         Row(
//           children: [
//             DropdownMenu<Color>(
//               label: Text(
//                   getLocalizedText(widget.languageValue, 'Color', 'Couleur')),
//               initialSelection: widget.event.eventData?.color ?? Colors.blue,
//               dropdownMenuEntries: [
//                 DropdownMenuEntry(
//                   value: Colors.blue,
//                   label: getLocalizedText(widget.languageValue, 'Blue', 'Bleu'),
//                 ),
//                 DropdownMenuEntry(
//                   value: Colors.green,
//                   label:
//                       getLocalizedText(widget.languageValue, 'Green', 'Vert'),
//                 ),
//                 DropdownMenuEntry(
//                   value: Colors.red,
//                   label: getLocalizedText(widget.languageValue, 'Red', 'Route'),
//                 ),
//               ],
//               onSelected: (value) {
//                 if (value == null) return;
//                 widget.event.eventData =
//                     widget.event.eventData?.copyWith(color: value);
//               },
//             )
//           ],
//         ),
//         const Divider(),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             TextButton.icon(
//               onPressed: () {
//                 widget.cancelEdit();
//                 Navigator.of(context).pop(false);
//               },
//               icon: const Icon(Icons.cancel),
//               label: Text(
//                 getLocalizedText(widget.languageValue, 'Cancel', 'Annuler'),
//               ),
//             ),
//             TextButton.icon(
//               onPressed: () {
//                 Navigator.of(context).pop(true);
//               },
//               icon: const Icon(Icons.save),
//               label: Text(
//                 getLocalizedText(widget.languageValue, 'Save', 'Sauvegarder'),
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
//
// class ScheduleTile extends StatelessWidget {
//   const ScheduleTile({
//     super.key,
//     required this.event,
//     required this.date,
//   });
//   final CalendarEvent<Event> event;
//   final DateTime date;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0,
//       color: event.eventData?.color ?? Colors.blue,
//       child: ListTile(
//         title: Text(event.eventData?.title ?? ''),
//         subtitle: Text(
//           event.eventData?.description ?? '',
//           maxLines: 2,
//           overflow: TextOverflow.ellipsis,
//         ),
//         mouseCursor: SystemMouseCursors.click,
//         dense: true,
//       ),
//     );
//   }
// }
//
// class MultiDayEventTile extends StatelessWidget {
//   const MultiDayEventTile(
//       {super.key,
//       required this.event,
//       required this.tileType,
//       required this.continuesBefore,
//       required this.continuesAfter,
//       required this.languageValue});
//   final CalendarEvent<Event> event;
//   final TileType tileType;
//   final bool continuesBefore;
//   final bool continuesAfter;
//   final String languageValue;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
//       child: Material(
//         type: MaterialType.card,
//         color: color(event.eventData?.color ?? Colors.blue),
//         elevation: elevation,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(continuesBefore ? 0 : 12),
//           bottomLeft: Radius.circular(continuesBefore ? 0 : 12),
//           topRight: Radius.circular(continuesAfter ? 0 : 12),
//           bottomRight: Radius.circular(continuesAfter ? 0 : 12),
//         ),
//         child: Container(
//           decoration: tileType == TileType.selected
//               ? BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(
//                     color: Theme.of(context).colorScheme.onBackground,
//                     width: 1,
//                   ),
//                 )
//               : null,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Text(
//                     event.eventData?.title ?? '',
//                     style: Theme.of(context).textTheme.bodyMedium,
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Color color(Color color) {
//     if (tileType == TileType.ghost) {
//       return color.withAlpha(100);
//     } else {
//       return color;
//     }
//   }
//
//   double get elevation {
//     switch (tileType) {
//       case TileType.ghost:
//         return 0.0;
//       case TileType.normal:
//         return 4.0;
//       case TileType.selected:
//         return 8.0;
//       default:
//         return 0.0;
//     }
//   }
// }
//
// class EventTile extends StatelessWidget {
//   const EventTile({
//     super.key,
//     required this.event,
//     required this.tileType,
//     required this.drawOutline,
//     required this.continuesBefore,
//     required this.continuesAfter,
//   });
//
//   final CalendarEvent<Event> event;
//   final TileType tileType;
//   final bool drawOutline;
//   final bool continuesBefore;
//   final bool continuesAfter;
//
//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: BoxDecoration(
//         color: color(event.eventData?.color ?? Colors.blue),
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(continuesBefore ? 0 : 8),
//           bottomLeft: Radius.circular(continuesAfter ? 0 : 8),
//           topRight: Radius.circular(continuesBefore ? 0 : 8),
//           bottomRight: Radius.circular(continuesAfter ? 0 : 8),
//         ),
//         border: drawOutline || tileType == TileType.selected
//             ? Border.all(color: Theme.of(context).colorScheme.onBackground)
//             : null,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: RichText(
//                 text: TextSpan(children: [
//                   TextSpan(
//                     text: event.eventData?.title ?? '',
//                     style: Theme.of(context).textTheme.titleSmall,
//                   ),
//                   const TextSpan(text: '\n'),
//                   TextSpan(
//                     text: event.eventData?.description ?? '',
//                     style: Theme.of(context).textTheme.bodySmall,
//                   ),
//                 ]),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Color color(Color color) {
//     if (tileType == TileType.ghost) {
//       return color.withAlpha(100);
//     } else {
//       return color;
//     }
//   }
//
//   double get elevation {
//     switch (tileType) {
//       case TileType.ghost:
//         return 0.0;
//       case TileType.normal:
//         return 4.0;
//       case TileType.selected:
//         return 8.0;
//       default:
//         return 0.0;
//     }
//   }
// }
//
// class CalendarZoomDetector extends StatefulWidget {
//   const CalendarZoomDetector({
//     super.key,
//     required this.controller,
//     required this.child,
//   });
//
//   final CalendarController controller;
//   final Widget child;
//
//   @override
//   State<CalendarZoomDetector> createState() => _CalendarZoomDetectorState();
// }
//
// class _CalendarZoomDetectorState extends State<CalendarZoomDetector> {
//   bool _isCtrlPressed = false;
//   double _pointerY = 0.0;
//   double _currentZoom = 0.7;
//   double _initialZoom = 0.7;
//
//   @override
//   void initState() {
//     super.initState();
//     // ServicesBinding.instance.keyboard.addHandler(_onKey);
//
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       View.of(context).platformDispatcher.onKeyData = _onKey;
//     });
//
//     _currentZoom = widget.controller.heightPerMinute?.value ?? 0.7;
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       hitTestBehavior: HitTestBehavior.translucent,
//       onEnter: (event) {
//         setState(() {
//           _pointerY = event.localPosition.dy;
//         });
//       },
//       onHover: (event) {
//         setState(() {
//           _pointerY = event.localPosition.dy;
//         });
//       },
//       child: RawGestureDetector(
//         behavior: HitTestBehavior.translucent,
//         gestures: {
//           AllowMultipleGestureRecognizer: GestureRecognizerFactoryWithHandlers<
//               AllowMultipleGestureRecognizer>(
//             AllowMultipleGestureRecognizer.new, //constructor
//             (instance) {
//               instance.onStart = (details) {
//                 _initialZoom = _currentZoom;
//
//                 if (details.pointerCount <= 1) return;
//                 widget.controller.lockScrollPhysics();
//               };
//               instance.onUpdate = (details) {
//                 if (details.pointerCount <= 1) return;
//
//                 final oldZoom = _currentZoom;
//                 _currentZoom =
//                     (_initialZoom * details.verticalScale).clamp(0.3, 6.0);
//
//                 final scrollController = widget.controller.scrollController;
//                 if (scrollController == null) return;
//                 final newPosition = calculateScrollPosition(
//                       scrollController,
//                       oldZoom,
//                     ).clamp(
//                       scrollController.position.minScrollExtent,
//                       scrollController.position.maxScrollExtent,
//                     ) -
//                     details.focalPointDelta.dy;
//
//                 if (newPosition.isFinite) {
//                   scrollController.jumpTo(newPosition);
//                 }
//
//                 widget.controller.adjustHeightPerMinute(_currentZoom);
//               };
//               instance.onEnd = (details) {
//                 widget.controller.unlockScrollPhysics();
//               };
//             },
//           ),
//         },
//         child: Listener(
//           onPointerSignal: (event) {
//             if (_isCtrlPressed) {
//               if (event is PointerScrollEvent) {
//                 setState(() {
//                   final oldZoom = _currentZoom;
//
//                   var newZoom = _currentZoom;
//                   if (event.scrollDelta.dy > 0) {
//                     newZoom -= 0.1;
//                   } else {
//                     newZoom += 0.1;
//                   }
//                   _currentZoom = newZoom.clamp(0.3, 6.0);
//
//                   final scrollController = widget.controller.scrollController;
//                   if (scrollController != null) {
//                     final newPosition = calculateScrollPosition(
//                       scrollController,
//                       oldZoom,
//                     );
//
//                     if (newPosition.isFinite) {
//                       scrollController.jumpTo(newPosition);
//                     }
//                   }
//
//                   widget.controller.adjustHeightPerMinute(_currentZoom);
//                 });
//               }
//
//               if (event is PointerScaleEvent) {
//                 setState(() {
//                   final oldZoom = _currentZoom;
//
//                   double newZoom = _currentZoom;
//                   if (event.scale > 1) {
//                     newZoom += 0.1;
//                   } else {
//                     newZoom -= 0.1;
//                   }
//                   _currentZoom = newZoom.clamp(0.3, 6.0);
//
//                   final scrollController = widget.controller.scrollController;
//                   if (scrollController != null) {
//                     final newPosition = calculateScrollPosition(
//                       scrollController,
//                       oldZoom,
//                     );
//
//                     if (newPosition.isFinite) {
//                       scrollController.jumpTo(newPosition);
//                     }
//                   }
//
//                   widget.controller.adjustHeightPerMinute(_currentZoom);
//                 });
//               }
//             }
//           },
//           child: widget.child,
//         ),
//       ),
//     );
//   }
//
//   bool _onKey(KeyData event) {
//     if (!mounted) return false;
//
//     final key = event.logical;
//
//     if (key == LogicalKeyboardKey.controlLeft.keyId ||
//         key == LogicalKeyboardKey.controlRight.keyId) {
//       if (event.type == KeyEventType.down) {
//         _startZoom();
//         return true;
//       }
//
//       if (event.type == KeyEventType.up) {
//         _endZoom();
//         return true;
//       }
//     }
//
//     return false;
//   }
//
//   void _startZoom() {
//     setState(() {
//       widget.controller.lockScrollPhysics();
//       _isCtrlPressed = true;
//     });
//   }
//
//   void _endZoom() {
//     setState(() {
//       widget.controller.unlockScrollPhysics();
//       _isCtrlPressed = false;
//     });
//   }
//
//   double calculateScrollPosition(
//     ScrollController scrollController,
//     double oldZoom,
//   ) {
//     // Get the height of the visible portion of the content
//     final viewportHeight = scrollController.position.viewportDimension;
//
//     // Calculate the ratio of the pointer's position within the viewport to the viewport's total height.
//     final pointerPosition = _pointerY / viewportHeight;
//
//     // Calculate the ratio of the new zoom level to the previous zoom level
//     final zoomRatio = _currentZoom / oldZoom;
//
//     // Calculate the new scroll position.
//     return ((scrollController.position.pixels +
//                 pointerPosition * scrollController.position.viewportDimension) *
//             zoomRatio) -
//
//         // This part ensures that the pointer's position within the viewport stays the same.
//         pointerPosition * scrollController.position.viewportDimension;
//   }
// }
//
// // Custom Gesture Recognizer.
// // rejectGesture() is overridden. When a gesture is rejected, this is the function that is called. By default, it disposes of the
// // Recognizer and runs clean up. However we modified it so that instead the Recognizer is disposed of, it is actually manually added.
// // The result is instead you have one Recognizer winning the Arena, you have two. It is a win-win.
// class AllowMultipleGestureRecognizer extends ScaleGestureRecognizer {
//   @override
//   void rejectGesture(int pointer) {
//     acceptGesture(pointer);
//   }
// }
//
// class CalendarWidget extends StatefulWidget {
//   const CalendarWidget({
//     super.key,
//     required this.eventsController,
//     required this.calendarController,
//     required this.calendarComponents,
//     required this.calendarStyle,
//     required this.calendarLayoutDelegates,
//     required this.currentConfiguration,
//     required this.onDateTapped,
//     required this.updatePageStateWithSelectedBooking,
//     required this.languageValue,
//   });
//
//   final CalendarEventsController<Event> eventsController;
//   final CalendarController<Event> calendarController;
//   final CalendarComponents calendarComponents;
//   final CalendarStyle calendarStyle;
//   final CalendarLayoutDelegates<Event> calendarLayoutDelegates;
//
//   final ViewConfiguration currentConfiguration;
//   final VoidCallback onDateTapped;
//   final Future Function(BookingDataTypeStruct selectedBooking)?
//       updatePageStateWithSelectedBooking;
//   final String languageValue;
//
//   @override
//   State<CalendarWidget> createState() => _CalendarWidgetState();
// }
//
// class _CalendarWidgetState extends State<CalendarWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return CalendarView<Event>(
//       controller: widget.calendarController,
//       eventsController: widget.eventsController,
//       viewConfiguration: widget.currentConfiguration,
//       tileBuilder: _tileBuilder,
//       multiDayTileBuilder: _multiDayTileBuilder,
//       scheduleTileBuilder: _scheduleTileBuilder,
//       components: widget.calendarComponents,
//       style: widget.calendarStyle,
//       layoutDelegates: widget.calendarLayoutDelegates,
//       eventHandlers: CalendarEventHandlers<Event>(
//         onEventChanged: onEventChanged,
//         onEventTapped: onEventTapped,
//         onDateTapped: onDateTapped,
//         onCreateEvent: onEventCreate,
//         onEventCreated: onEventCreated,
//       ),
//     );
//   }
//
//   CalendarEvent<Event> onEventCreate(DateTimeRange dateTimeRange) {
//     return CalendarEvent<Event>(
//       dateTimeRange: dateTimeRange,
//       eventData: Event(
//         title: getLocalizedText(
//             widget.languageValue, 'Your booking', 'Votre réservation'),
//         type: EventType.Temporary,
//         color: Colors.yellow,
//       ),
//     );
//   }
//
//   /// This function is called when a new event is created.
//   Future<void> onEventCreated(CalendarEvent<Event> event) async {
//     widget.eventsController
//         .removeWhere((event) => event.eventData!.type == EventType.Temporary);
//
//     if (event.dateTimeRange.end
//             .difference(event.dateTimeRange.start)
//             .inMinutes <
//         60) {
//       event.dateTimeRange = DateTimeRange(
//         start: event.dateTimeRange.start,
//         end: event.dateTimeRange.start.add(Duration(hours: 1)),
//       );
//
//       ScaffoldMessenger.of(context).hideCurrentSnackBar();
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//             getLocalizedText(
//                 widget.languageValue, 'One hour minimum', 'Une heure minimum'),
//           ),
//         ),
//       );
//     }
//
//     widget.eventsController.addEvent(event);
//     if (widget.updatePageStateWithSelectedBooking != null) {
//       BookingDataTypeStruct newBooking = BookingDataTypeStruct();
//       newBooking.startTime = event.dateTimeRange.start;
//       newBooking.endTime = event.dateTimeRange.end;
//       widget.updatePageStateWithSelectedBooking!(newBooking);
//     }
//
//     /*
//     // Show the new event dialog.
//     CalendarEvent<Event>? newEvent = await showDialog<CalendarEvent<Event>>(
//       context: context,
//       builder: (BuildContext context) {
//         return NewEventDialog(
//           dialogTitle: 'Create Event',
//           event: event,
//         );
//       },
//     );
//
//     /// Add the event to the events controller.
//     if (newEvent != null) {
//       widget.eventsController.addEvent(newEvent);
//
//       print('in newEvent');
//       BookingDataTypeStruct newBooking = BookingDataTypeStruct();
//       newBooking.startTime = event.dateTimeRange.start;
//       newBooking.endTime = event.dateTimeRange.end;
//
//       // Appel de la fonction pour mettre à jour l'état de la page avec le booking créé
//       if (widget.updatePageStateWithSelectedBooking != null) {
//         widget.updatePageStateWithSelectedBooking!(newBooking);
//       }
//     } else {
//       widget.eventsController.deselectEvent();
//     }
//     */
//   }
//
//   /// This function is called when an event is tapped.
//   Future<void> onEventTapped(CalendarEvent<Event> event) async {
//     // print('REMOVE ON EVENT TAPPED');
//
//     if (isMobile && event.eventData?.type == EventType.Temporary) {
//       widget.eventsController.selectedEvent == event
//           ? widget.eventsController.deselectEvent()
//           : widget.eventsController.selectEvent(event);
//     } //else {
//     // Make a copy of the event to restore it if the user cancels the changes.
//     // CalendarEvent<Event> copyOfEvent = event.copyWith();
//     /*
//       // Show the edit dialog.
//       await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return EventEditDialog(
//             dialogTitle: 'Edit Event',
//             event: event,
//             deleteEvent: widget.eventsController.removeEvent,
//             cancelEdit: () => event.eventData = copyOfEvent.eventData,
//           );
//         },
//       );*/
//     //}
//   }
//
//   /// This function is called when an event is changed.
//   Future<void> onEventChanged(
//     DateTimeRange initialDateTimeRange,
//     CalendarEvent<Event> event,
//   ) async {
//     if (event.eventData?.type != EventType.Temporary) {
//       // Ne permet pas de modifier les événements non temporaires
//       event.dateTimeRange = DateTimeRange(
//         start: initialDateTimeRange.start,
//         end: initialDateTimeRange.end,
//       );
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//             getLocalizedText(
//                 widget.languageValue,
//                 'Only temporary events can be modified.',
//                 'Seuls les événements temporaires peuvent être modifiés.'),
//           ),
//         ),
//       );
//       return;
//     } else {
//       if (event.dateTimeRange.end
//               .difference(event.dateTimeRange.start)
//               .inMinutes <
//           60) {
//         event.dateTimeRange = DateTimeRange(
//           start: event.dateTimeRange.start,
//           end: event.dateTimeRange.start.add(Duration(hours: 1)),
//         );
//
//         ScaffoldMessenger.of(context).hideCurrentSnackBar();
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(getLocalizedText(widget.languageValue,
//                 'One hour minimum.', 'Une heure minimum.')),
//           ),
//         );
//       }
//
//       if (widget.updatePageStateWithSelectedBooking != null) {
//         BookingDataTypeStruct newBooking = BookingDataTypeStruct();
//         newBooking.startTime = event.dateTimeRange.start;
//         newBooking.endTime = event.dateTimeRange.end;
//         widget.updatePageStateWithSelectedBooking!(newBooking);
//       }
//       ScaffoldMessenger.of(context).hideCurrentSnackBar();
//
//       // Show the snackbar and undo the changes if the user presses the undo button.
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//             '${event.eventData?.title} ${getLocalizedText(widget.languageValue, 'Changed', 'Modifié')}',
//           ),
//           action: SnackBarAction(
//             label: getLocalizedText(widget.languageValue, 'Undo', 'Annuler'),
//             onPressed: () {
//               widget.eventsController.updateEvent(
//                 newEventData: event.eventData,
//                 newDateTimeRange: initialDateTimeRange,
//                 test: (other) => other.eventData == event.eventData,
//               );
//             },
//           ),
//         ),
//       );
//     }
//   }
//
//   /// This function is called when a date is tapped.
//   void onDateTapped(date) {
//     // If the current view is not the single day view, change the view to the single day view.
//     if (widget.currentConfiguration is! DayConfiguration) {
//       // Set the selected date to the tapped date.
//       widget.calendarController.selectedDate = date;
//       widget.onDateTapped();
//       // widget.currentConfiguration = widget.viewConfigurations.first;
//     }
//   }
//
//   Widget _tileBuilder(
//     CalendarEvent<Event> event,
//     TileConfiguration tileConfiguration,
//   ) {
//     return EventTile(
//       event: event,
//       tileType: tileConfiguration.tileType,
//       drawOutline: tileConfiguration.drawOutline,
//       continuesBefore: tileConfiguration.continuesBefore,
//       continuesAfter: tileConfiguration.continuesAfter,
//     );
//   }
//
//   Widget _multiDayTileBuilder(
//     CalendarEvent<Event> event,
//     MultiDayTileConfiguration tileConfiguration,
//   ) {
//     return MultiDayEventTile(
//       languageValue: widget.languageValue,
//       event: event,
//       tileType: tileConfiguration.tileType,
//       continuesBefore: tileConfiguration.continuesBefore,
//       continuesAfter: tileConfiguration.continuesAfter,
//     );
//   }
//
//   Widget _scheduleTileBuilder(
//     CalendarEvent<Event> event,
//     DateTime date,
//   ) {
//     return ScheduleTile(
//       event: event,
//       date: date,
//     );
//   }
//
//   bool get isMobile => kIsWeb ? false : Platform.isAndroid || Platform.isIOS;
// }
//
// class CalendarHeader extends StatelessWidget {
//   const CalendarHeader({
//     super.key,
//     required this.calendarController,
//     required this.viewConfigurations,
//     required this.currentConfiguration,
//     required this.onViewConfigurationChanged,
//     required this.visibleDateTimeRange,
//     required this.refreshCalendarDatas,
//     required this.languageValue,
//   });
//
//   final CalendarController calendarController;
//   final List<ViewConfiguration> viewConfigurations;
//   final DateTimeRange visibleDateTimeRange;
//   final int currentConfiguration;
//   final void Function(int index) onViewConfigurationChanged;
//   final Future Function(DateTime selectedDate)? refreshCalendarDatas;
//   final String languageValue;
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         final buttonWidth = constraints.maxWidth < 600 ? 120.0 : 250.0;
//         final viewWidth = constraints.maxWidth < 600 ? 80.0 : 150.0;
//         final padding = constraints.maxWidth < 600 ? 0.0 : 4.0;
//         final buttonHeight = constraints.maxWidth < 600 ? 40.0 : 48.0;
//
//         final dateFormat = constraints.maxWidth < 600
//             ? DateFormat('yyyy - MMM')
//             : DateFormat('yyyy - MMMM');
//
//         final dateButton = FilledButton.tonal(
//           style: ButtonStyle(
//             minimumSize: MaterialStateProperty.all<Size>(
//               Size(buttonWidth, buttonHeight),
//             ),
//           ),
//           onPressed: () async {
//             final now = DateTime.now();
//             final firstDate = now.subtract(Duration(days: 365 * 10));
//             final lastDate = now.add(Duration(days: 365 * 10));
//             DateTime? selectedDate = await showDatePicker(
//               context: context,
//               initialDate: visibleDateTimeRange.start,
//               firstDate: firstDate,
//               lastDate: lastDate,
//             );
//             if (selectedDate == null) return;
//
//             calendarController.animateToDate(
//               selectedDate,
//             );
//           },
//           child: Text(
//             dateFormat.format(calendarController.visibleMonth!),
//             style: Theme.of(context).textTheme.titleLarge,
//           ),
//         );
//
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               dateButton,
//               if (viewConfigurations[currentConfiguration]
//                   is! ScheduleViewConfiguration)
//                 Padding(
//                   padding: EdgeInsets.only(left: padding),
//                   child: IconButton.filledTonal(
//                     onPressed: () {
//                       // Appel de refreshCalendarDatas lors de la modification de la date
//                       if (refreshCalendarDatas != null) {
//                         refreshCalendarDatas!(calendarController.selectedDate);
//                       }
//                       calendarController.animateToPreviousPage();
//                     },
//                     icon: const Icon(Icons.chevron_left),
//                     tooltip: getLocalizedText(
//                         languageValue, 'Previous Page', 'Page précédente'),
//                   ),
//                 ),
//               if (viewConfigurations[currentConfiguration]
//                   is! ScheduleViewConfiguration)
//                 Padding(
//                   padding: EdgeInsets.only(left: padding),
//                   child: IconButton.filledTonal(
//                     onPressed: () {
//                       // Appel de refreshCalendarDatas lors de la modification de la date
//                       if (refreshCalendarDatas != null) {
//                         refreshCalendarDatas!(calendarController.selectedDate);
//                       }
//                       calendarController.animateToNextPage();
//                     },
//                     icon: const Icon(Icons.chevron_right),
//                     tooltip: getLocalizedText(
//                         languageValue, 'Next Page', 'Page suivante'),
//                   ),
//                 ),
//               Padding(
//                 padding: EdgeInsets.only(left: padding),
//                 child: IconButton.filledTonal(
//                   onPressed: () {
//                     // Appel de refreshCalendarDatas lors de la modification de la date
//                     if (refreshCalendarDatas != null) {
//                       refreshCalendarDatas!(calendarController.selectedDate);
//                     }
//                     calendarController.animateToDate(
//                       DateTime.now(),
//                       duration: const Duration(milliseconds: 800),
//                     );
//                   },
//                   icon: const Icon(Icons.today),
//                   tooltip:
//                       getLocalizedText(languageValue, 'Today', 'Aujourd\'hui'),
//                 ),
//               ),
//               /*
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: padding),
//                       child: DropdownMenu<int>(
//                         width: viewWidth,
//                         initialSelection: currentConfiguration,
//                         dropdownMenuEntries: [
//                           for (var i = 0; i < viewConfigurations.length; i++)
//                             DropdownMenuEntry<int>(
//                               value: i,
//                               label: viewConfigurations[i].name,
//                             ),
//                         ],
//                         enableSearch: false,
//                         onSelected: (int? value) {
//                           if (value == null) return;
//                           onViewConfigurationChanged(value);
//                         },
//                         inputDecorationTheme: const InputDecorationTheme(
//                           contentPadding: EdgeInsets.symmetric(horizontal: 8),
//                           border: OutlineInputBorder(gapPadding: 16),
//                           constraints:
//                               BoxConstraints(maxHeight: 42, minHeight: 38),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )*/
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
// class ViewConfigurationCustomize extends StatelessWidget {
//   const ViewConfigurationCustomize({
//     super.key,
//     required this.currentConfiguration,
//     required this.languageValue,
//   });
//
//   final ViewConfiguration currentConfiguration;
//   final String languageValue;
//   @override
//   Widget build(BuildContext context) {
//     return ListenableBuilder(
//       listenable: currentConfiguration,
//       builder: (context, child) {
//         return ExpansionTile(
//           title: Text(getLocalizedText(
//               languageValue, 'View Configuration', 'Voir la configuration')),
//           initiallyExpanded: true,
//           children: [
//             if (currentConfiguration is MultiDayViewConfiguration)
//               ...multiDayConfig(
//                   currentConfiguration as MultiDayViewConfiguration),
//             if (currentConfiguration is MonthConfiguration)
//               ...monthConfig(currentConfiguration as MonthConfiguration)
//           ],
//         );
//       },
//     );
//   }
//
//   List<Widget> multiDayConfig(MultiDayViewConfiguration config) {
//     return [
//       SwitchListTile(
//         title: Text(getLocalizedText(languageValue, 'Enable Rescheduling',
//             'Activer la reprogrammation')),
//         value: config.enableRescheduling,
//         onChanged: (value) {
//           config.enableRescheduling = value;
//         },
//       ),
//       SwitchListTile(
//         title: Text(getLocalizedText(
//             languageValue, 'Enable Resizing', 'Activer le redimensionnement')),
//         value: config.enableResizing,
//         onChanged: (value) {
//           config.enableResizing = value;
//         },
//       ),
//       SwitchListTile(
//         title: Text(getLocalizedText(
//             languageValue, 'Enable Snapping', 'Activer l\'accrochage')),
//         value: config.eventSnapping,
//         onChanged: (value) {
//           config.eventSnapping = value;
//         },
//       ),
//       SwitchListTile(
//         title: Text(getLocalizedText(languageValue, 'Show Day Header',
//             'En-tête du jour de l\'exposition')),
//         value: config.showDayHeader,
//         onChanged: (value) {
//           config.showDayHeader = value;
//         },
//       ),
//       SwitchListTile(
//         title: Text(getLocalizedText(languageValue, 'Show Multi Day Header',
//             'Afficher l\'en-tête de plusieurs jours')),
//         value: config.showMultiDayHeader,
//         onChanged: (value) {
//           config.showMultiDayHeader = value;
//         },
//       ),
//       SwitchListTile(
//         title: Text(getLocalizedText(languageValue, 'Show Week Number',
//             'Numéro de la semaine d\'affichage')),
//         value: config.showWeekNumber,
//         onChanged: (value) {
//           config.showWeekNumber = value;
//         },
//       ),
//       DropDownBasic(
//         label: getLocalizedText(languageValue, 'MultiDay tile height',
//             'Hauteur de la tuile MultiDay'),
//         items: const [24.0, 48.0],
//         initialValue: config.multiDayTileHeight,
//         onChanged: (value) {
//           config.multiDayTileHeight = value;
//         },
//       ),
//       DropDownBasic(
//         label: getLocalizedText(languageValue, 'Day separator left offset',
//             'Séparateur de jour décalé à gauche'),
//         items: const [8.0, 48.0],
//         initialValue: config.daySeparatorLeftOffset,
//         onChanged: (value) {
//           config.daySeparatorLeftOffset = value;
//         },
//       ),
//       DropDownBasic(
//         label: getLocalizedText(
//             languageValue, 'Timeline width', 'Largeur de la ligne de temps'),
//         items: const [56.0, 104.0],
//         initialValue: config.timelineWidth,
//         onChanged: (value) {
//           config.timelineWidth = value;
//         },
//       ),
//       if (config is CustomMultiDayConfiguration)
//         DropDownBasic(
//           label: getLocalizedText(
//               languageValue, 'Number of days', 'Nombre de jours'),
//           items: const [1, 2, 3, 4, 5, 6, 7, 8],
//           initialValue: config.numberOfDays,
//           onChanged: (value) {
//             config.numberOfDays = value;
//           },
//         ),
//       if (config is WeekConfiguration)
//         FirstDayOfWeek(
//           value: config.firstDayOfWeek,
//           onChanged: (value) {
//             config.firstDayOfWeek = value;
//           },
//           languageValue: languageValue,
//         ),
//       TimeDropDown(
//         label: getLocalizedText(
//             languageValue, 'Durée du pas vertical', 'Vertical step duration'),
//         items: const [
//           Duration(minutes: 1),
//           Duration(minutes: 10),
//           Duration(minutes: 15),
//         ],
//         initialValue: config.verticalStepDuration,
//         onChanged: (value) {
//           config.verticalStepDuration = value;
//         },
//       ),
//       TimeDropDown(
//         label: getLocalizedText(languageValue, 'Vertical snap duration range',
//             'Plage de durée de l\'accrochage vertical'),
//         items: const [
//           Duration(minutes: 5),
//           Duration(minutes: 10),
//           Duration(minutes: 15),
//         ],
//         initialValue: config.verticalSnapRange,
//         onChanged: (value) {
//           config.verticalSnapRange = value;
//         },
//       ),
//       DropDownBasic(
//         label: getLocalizedText(languageValue, 'Start hour', 'Heure de début'),
//         items: List.generate(5, (index) => index),
//         initialValue: config.startHour,
//         onChanged: (value) {
//           config.startHour = value;
//         },
//       ),
//       DropDownBasic(
//         label: getLocalizedText(languageValue, 'End hour', 'Heure de fin'),
//         items: List.generate(5, (index) => 24 - index),
//         initialValue: config.endHour,
//         onChanged: (value) {
//           config.endHour = value;
//         },
//       ),
//     ];
//   }
//
//   List<Widget> monthConfig(MonthConfiguration config) {
//     return [
//       SwitchListTile(
//         title: Text(
//           getLocalizedText(languageValue, 'Show Header', 'Afficher l\'en-tête'),
//         ),
//         value: config.showHeader,
//         onChanged: (value) {
//           config.showHeader = value;
//         },
//       ),
//       SwitchListTile(
//         title: Text(
//           getLocalizedText(languageValue, 'Enable Rescheduling',
//               'Activer la reprogrammation'),
//         ),
//         value: config.enableRescheduling,
//         onChanged: (value) {
//           config.enableRescheduling = value;
//         },
//       ),
//       SwitchListTile(
//         title: Text(
//           getLocalizedText(
//               languageValue, 'Enable resizing', 'Activer la redimensionnement'),
//         ),
//         value: config.enableResizing,
//         onChanged: (value) {
//           config.enableResizing = value;
//         },
//       ),
//       DropDownBasic(
//         label: getLocalizedText(languageValue, 'MultiDay tile height',
//             'Hauteur de la tuile MultiDay'),
//         items: const [24.0, 48.0],
//         initialValue: config.multiDayTileHeight,
//         onChanged: (value) {
//           config.multiDayTileHeight = value;
//         },
//       ),
//       FirstDayOfWeek(
//         value: config.firstDayOfWeek,
//         onChanged: (value) {
//           config.firstDayOfWeek = value;
//         },
//         languageValue: languageValue,
//       ),
//     ];
//   }
// }
//
// class DropDownBasic<T> extends StatelessWidget {
//   const DropDownBasic({
//     super.key,
//     required this.label,
//     required this.items,
//     required this.initialValue,
//     required this.onChanged,
//   });
//
//   final String label;
//   final List<T> items;
//   final T initialValue;
//   final void Function(T) onChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
//       child: DropdownMenu<T>(
//         label: Text(label),
//         initialSelection: initialValue,
//         dropdownMenuEntries: items
//             .map(
//               (e) => DropdownMenuEntry<T>(
//                 value: e,
//                 label: e.toString(),
//               ),
//             )
//             .toList(),
//         expandedInsets: EdgeInsets.zero,
//         onSelected: (value) {
//           if (value == null) return;
//           onChanged(value);
//         },
//       ),
//     );
//   }
// }
//
// class TimeDropDown extends StatelessWidget {
//   const TimeDropDown({
//     super.key,
//     required this.label,
//     required this.items,
//     required this.initialValue,
//     required this.onChanged,
//   });
//
//   final String label;
//   final List<Duration> items;
//   final Duration initialValue;
//   final void Function(Duration) onChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
//       child: DropdownMenu<Duration>(
//         label: Text(label),
//         initialSelection: initialValue,
//         dropdownMenuEntries: items
//             .map(
//               (e) => DropdownMenuEntry<Duration>(
//                 value: e,
//                 label: '${e.inMinutes} minutes',
//               ),
//             )
//             .toList(),
//         expandedInsets: EdgeInsets.zero,
//         onSelected: (value) {
//           if (value == null) return;
//           onChanged(value);
//         },
//       ),
//     );
//   }
// }
//
// class FirstDayOfWeek extends StatelessWidget {
//   const FirstDayOfWeek({
//     super.key,
//     required this.value,
//     required this.onChanged,
//     required this.languageValue,
//   });
//
//   final int value;
//   final void Function(int value) onChanged;
//   final String languageValue;
//
//   @override
//   Widget build(BuildContext context) {
//     final daysOfWeek = <String>[
//       getLocalizedText(languageValue, 'Monday', 'Lundi'),
//       getLocalizedText(languageValue, 'Tuesday', 'Mardi'),
//       getLocalizedText(languageValue, 'Wednesday', 'Mercredi'),
//       getLocalizedText(languageValue, 'Thursday', 'Jeudi'),
//       getLocalizedText(languageValue, 'Saturday', 'Samedi'),
//       getLocalizedText(languageValue, 'Sunday', 'Dimanche'),
//     ];
//
//     return DropdownMenu<int>(
//       label: Text(
//         getLocalizedText(languageValue, 'First day of the week',
//             'Premier jour de la semaine'),
//       ),
//       expandedInsets: const EdgeInsets.symmetric(
//         horizontal: 16.0,
//         vertical: 12.0,
//       ),
//       initialSelection: 1,
//       onSelected: (value) {
//         if (value == null) return;
//         onChanged(value);
//       },
//       dropdownMenuEntries: daysOfWeek.indexed
//           .map(
//             (entry) => DropdownMenuEntry<int>(
//               value: entry.$1 + 1,
//               label: entry.$2,
//             ),
//           )
//           .toList(),
//     );
//   }
// }
//
// class CalendarCustomize extends StatefulWidget {
//   const CalendarCustomize({
//     super.key,
//     required this.currentConfiguration,
//     required this.onStyleChange,
//     required this.layoutDelegates,
//     required this.style,
//     required this.onCalendarLayoutChange,
//     required this.languageValue,
//   });
//
//   final ViewConfiguration currentConfiguration;
//   final CalendarStyle style;
//   final CalendarLayoutDelegates layoutDelegates;
//   final Function(CalendarStyle newStyle) onStyleChange;
//   final Function(CalendarLayoutDelegates<Event> newLayout)
//       onCalendarLayoutChange;
//   final String languageValue;
//   @override
//   State<CalendarCustomize> createState() => _CalendarCustomizeState();
// }
//
// class _CalendarCustomizeState extends State<CalendarCustomize> {
//   final Color highlightColor = Colors.red;
//
//   bool customLayoutController = false;
//
//   bool highlightCalendarHeader = false;
//   bool highlightDaySeparator = false;
//   bool highlightHourLine = false;
//   bool highlightDayHeader = false;
//
//   bool highlightTimeIndicator = false;
//   bool highlightTimeline = false;
//   bool highlightWeekNumber = false;
//   bool highlightMonthGrid = false;
//   bool highlightMonthCellHeaders = false;
//   bool highlightMonthHeader = false;
//
//   bool scheduleMonthHeader = false;
//   bool scheduleTilePaddingVertical = false;
//   bool scheduleTilePaddingHorizontal = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // const ThemeTile(),
//           if (widget.currentConfiguration is MultiDayViewConfiguration)
//             SwitchListTile.adaptive(
//               title: const Text('Custom Layout Controller'),
//               value: customLayoutController,
//               onChanged: (value) {
//                 customLayoutController = value;
//
//                 if (value) {
//                   widget.onCalendarLayoutChange(
//                     CalendarLayoutDelegates<Event>(
//                       tileLayoutDelegate: ({
//                         required events,
//                         required heightPerMinute,
//                         required date,
//                         required startHour,
//                         required endHour,
//                       }) =>
//                           EventGroupBasicLayoutDelegate(
//                         events: events,
//                         date: date,
//                         heightPerMinute: heightPerMinute,
//                         startHour: startHour,
//                         endHour: endHour,
//                       ),
//                     ),
//                   );
//                 } else {
//                   widget.onCalendarLayoutChange(
//                     CalendarLayoutDelegates<Event>(),
//                   );
//                 }
//               },
//             ),
//           ExpansionTile(
//             title: Text(
//               getLocalizedText(widget.languageValue, 'Highlight Components',
//                   'Mettre en évidence les composants'),
//             ),
//             initiallyExpanded: true,
//             children: [
//               SwitchListTile.adaptive(
//                 title: Text(
//                   getLocalizedText(widget.languageValue,
//                       'En-tête du calendrier', 'Calendar Header'),
//                 ),
//                 value: highlightCalendarHeader,
//                 onChanged: (value) {
//                   highlightCalendarHeader = value;
//                   widget.onStyleChange(
//                     widget.style.copyWith(
//                       calendarHeaderBackgroundStyle:
//                           CalendarHeaderBackgroundStyle(
//                         headerElevation: 0,
//                         headerBackgroundColor:
//                             value ? highlightColor.withAlpha(100) : null,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               if (widget.currentConfiguration is MultiDayViewConfiguration)
//                 ...multiDayConfig(
//                     widget.currentConfiguration as MultiDayViewConfiguration),
//               if (widget.currentConfiguration is MonthViewConfiguration)
//                 ...monthConfig(
//                     widget.currentConfiguration as MonthConfiguration),
//               if (widget.currentConfiguration is ScheduleConfiguration)
//                 ...scheduleConfig(
//                     widget.currentConfiguration as ScheduleConfiguration)
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   List<Widget> scheduleConfig(ScheduleConfiguration config) {
//     return [
//       SwitchListTile.adaptive(
//         title: Text(
//           getLocalizedText(
//               widget.languageValue, 'Day Header', 'En-tête du jour'),
//         ),
//         value: highlightDayHeader,
//         onChanged: (value) {
//           highlightDayHeader = value;
//           widget.onStyleChange(
//             widget.style.copyWith(
//               dayHeaderStyle: DayHeaderStyle(
//                 backgroundColor: value ? highlightColor.withAlpha(100) : null,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//             ),
//           );
//         },
//       ),
//       SwitchListTile.adaptive(
//         title: Text(
//           getLocalizedText(widget.languageValue, 'Schedule Month Header',
//               'En-tête du mois de l\'horaire'),
//         ),
//         value: scheduleMonthHeader,
//         onChanged: (value) {
//           scheduleMonthHeader = value;
//           widget.onStyleChange(
//             widget.style.copyWith(
//               scheduleMonthHeaderStyle: value
//                   ? const ScheduleMonthHeaderStyle(
//                       monthColors: {
//                         1: Colors.red,
//                         2: Colors.red,
//                         3: Colors.red,
//                         4: Colors.red,
//                         5: Colors.red,
//                         6: Colors.red,
//                         7: Colors.red,
//                         8: Colors.red,
//                         9: Colors.red,
//                         10: Colors.red,
//                         11: Colors.red,
//                         12: Colors.red,
//                       },
//                     )
//                   : const ScheduleMonthHeaderStyle(),
//             ),
//           );
//         },
//       ),
//       SwitchListTile.adaptive(
//         title: Text(
//           getLocalizedText(widget.languageValue, 'ScheduleDateTile margin',
//               'Marge ScheduleDateTile'),
//         ),
//         value: scheduleTilePaddingVertical,
//         onChanged: (value) {
//           scheduleTilePaddingVertical = value;
//           widget.onStyleChange(
//             widget.style.copyWith(
//               scheduleDateTileStyle: ScheduleDateTileStyle(
//                 margin: value
//                     ? const EdgeInsets.symmetric(vertical: 16)
//                     : const EdgeInsets.symmetric(vertical: 4),
//                 tilePadding: widget.style.scheduleDateTileStyle.tilePadding,
//               ),
//             ),
//           );
//         },
//       ),
//       SwitchListTile.adaptive(
//         title: Text(
//           getLocalizedText(widget.languageValue, 'Schedule Tile Padding',
//               'Planifier le padding des carreaux'),
//         ),
//         value: scheduleTilePaddingHorizontal,
//         onChanged: (value) {
//           scheduleTilePaddingHorizontal = value;
//           widget.onStyleChange(
//             widget.style.copyWith(
//               scheduleDateTileStyle: ScheduleDateTileStyle(
//                 tilePadding: value
//                     ? const EdgeInsets.symmetric(horizontal: 8, vertical: 4)
//                     : const EdgeInsets.symmetric(horizontal: 8),
//                 margin: widget.style.scheduleDateTileStyle.margin,
//               ),
//             ),
//           );
//         },
//       ),
//     ];
//   }
//
//   List<Widget> multiDayConfig(MultiDayViewConfiguration config) {
//     return [
//       SwitchListTile.adaptive(
//         title: Text(
//           getLocalizedText(
//               widget.languageValue, 'Day Separator', 'Séparateur de jours'),
//         ),
//         value: highlightDaySeparator,
//         onChanged: (value) {
//           highlightDaySeparator = value;
//           widget.onStyleChange(
//             widget.style.copyWith(
//               daySeparatorStyle: DaySeparatorStyle(
//                 color: value ? highlightColor : null,
//               ),
//             ),
//           );
//         },
//       ),
//       SwitchListTile.adaptive(
//         title: Text(getLocalizedText(
//             widget.languageValue, 'Hour Lines', 'Lignes des heures')),
//         value: highlightHourLine,
//         onChanged: (value) {
//           highlightHourLine = value;
//           widget.onStyleChange(
//             widget.style.copyWith(
//               hourLineStyle: HourLineStyle(
//                 color: value ? highlightColor : null,
//               ),
//             ),
//           );
//         },
//       ),
//       SwitchListTile.adaptive(
//         title: Text(getLocalizedText(
//             widget.languageValue, 'Day Header', 'En-tête des jours')),
//         value: highlightDayHeader,
//         onChanged: (value) {
//           highlightDayHeader = value;
//           widget.onStyleChange(
//             widget.style.copyWith(
//               dayHeaderStyle: DayHeaderStyle(
//                 backgroundColor: value ? highlightColor.withAlpha(100) : null,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//             ),
//           );
//         },
//       ),
//       SwitchListTile.adaptive(
//         title: Text(getLocalizedText(
//             widget.languageValue, 'Time Indicator', 'Indicateur de temps')),
//         value: highlightTimeIndicator,
//         onChanged: (value) {
//           highlightTimeIndicator = value;
//           widget.onStyleChange(
//             widget.style.copyWith(
//               timeIndicatorStyle: TimeIndicatorStyle(
//                 color: value ? Colors.greenAccent : null,
//               ),
//             ),
//           );
//         },
//       ),
//       SwitchListTile.adaptive(
//         title: Text(
//             getLocalizedText(widget.languageValue, 'Timeline', 'Chronologie')),
//         value: highlightTimeline,
//         onChanged: (value) {
//           highlightTimeline = value;
//           widget.onStyleChange(
//             widget.style.copyWith(
//                 timelineStyle: TimelineStyle(
//               textStyle: highlightTimeline
//                   ? TextStyle(
//                       color: highlightColor,
//                     )
//                   : null,
//             )),
//           );
//         },
//       ),
//       SwitchListTile.adaptive(
//         title: Text(getLocalizedText(
//             widget.languageValue, 'Week Number', 'Numéro de la semaine')),
//         value: highlightWeekNumber,
//         onChanged: (value) {
//           highlightWeekNumber = value;
//           widget.onStyleChange(widget.style.copyWith(
//             weekNumberStyle: WeekNumberStyle(
//               visualDensity: value ? VisualDensity.comfortable : null,
//               textStyle: TextStyle(
//                 color: value ? highlightColor : null,
//               ),
//             ),
//           ));
//         },
//       ),
//     ];
//   }
//
//   List<Widget> monthConfig(MonthConfiguration config) {
//     return [
//       SwitchListTile.adaptive(
//         title: const Text('Month Header'),
//         value: highlightMonthHeader,
//         onChanged: (value) {
//           highlightMonthHeader = value;
//           widget.onStyleChange(
//             widget.style.copyWith(
//               monthHeaderStyle: MonthHeaderStyle(
//                 textStyle: TextStyle(
//                   color: value ? highlightColor : null,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//       SwitchListTile.adaptive(
//         title: Text(getLocalizedText(widget.languageValue, 'Month cell header',
//             'En-tête de cellule du mois')),
//         value: highlightMonthCellHeaders,
//         onChanged: (value) {
//           highlightMonthCellHeaders = value;
//           widget.onStyleChange(
//             widget.style.copyWith(
//               monthCellHeaderStyle: MonthCellHeaderStyle(
//                 backgroundColor: value ? highlightColor.withAlpha(100) : null,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//             ),
//           );
//         },
//       ),
//       SwitchListTile.adaptive(
//         title: Text(getLocalizedText(
//             widget.languageValue, 'Month grid', 'grille du mois')),
//         value: highlightMonthGrid,
//         onChanged: (value) {
//           highlightMonthGrid = value;
//           widget.onStyleChange(
//             widget.style.copyWith(
//               monthGridStyle: MonthGridStyle(
//                 color: value ? highlightColor : null,
//               ),
//             ),
//           );
//         },
//       ),
//     ];
//   }
// }
//
// const lightColorScheme = ColorScheme(
//   brightness: Brightness.light,
//   primary: Color(0xFF6750A4),
//   onPrimary: Color(0xFFFFFFFF),
//   primaryContainer: Color(0xFFEADDFF),
//   onPrimaryContainer: Color(0xFF21005D),
//   secondary: Color(0xFF625B71),
//   onSecondary: Color(0xFFFFFFFF),
//   secondaryContainer: Color(0xFFE8DEF8),
//   onSecondaryContainer: Color(0xFF1D192B),
//   tertiary: Color(0xFF7D5260),
//   onTertiary: Color(0xFFFFFFFF),
//   tertiaryContainer: Color(0xFFFFD8E4),
//   onTertiaryContainer: Color(0xFF31111D),
//   error: Color(0xFFB3261E),
//   onError: Color(0xFFFFFFFF),
//   errorContainer: Color(0xFFF9DEDC),
//   onErrorContainer: Color(0xFF410E0B),
//   outline: Color(0xFF79747E),
//   background: Color(0xFFFFFBFE),
//   onBackground: Color(0xFF1C1B1F),
//   surface: Color(0xFFFFFBFE),
//   onSurface: Color(0xFF1C1B1F),
//   surfaceVariant: Color(0xFFE7E0EC),
//   onSurfaceVariant: Color(0xFF49454F),
//   inverseSurface: Color(0xFF313033),
//   onInverseSurface: Color(0xFFF4EFF4),
//   inversePrimary: Color(0xFFD0BCFF),
//   shadow: Color(0xFF000000),
//   surfaceTint: Color(0xFF6750A4),
//   outlineVariant: Color(0xFFCAC4D0),
//   scrim: Color(0xFF000000),
// );
//
// const darkColorScheme = ColorScheme(
//   brightness: Brightness.dark,
//   primary: Color(0xFFD0BCFF),
//   onPrimary: Color(0xFF381E72),
//   primaryContainer: Color(0xFF4F378B),
//   onPrimaryContainer: Color(0xFFEADDFF),
//   secondary: Color(0xFFCCC2DC),
//   onSecondary: Color(0xFF332D41),
//   secondaryContainer: Color(0xFF4A4458),
//   onSecondaryContainer: Color(0xFFE8DEF8),
//   tertiary: Color(0xFFEFB8C8),
//   onTertiary: Color(0xFF492532),
//   tertiaryContainer: Color(0xFF633B48),
//   onTertiaryContainer: Color(0xFFFFD8E4),
//   error: Color(0xFFF2B8B5),
//   onError: Color(0xFF601410),
//   errorContainer: Color(0xFF8C1D18),
//   onErrorContainer: Color(0xFFF9DEDC),
//   outline: Color(0xFF938F99),
//   background: Color(0xFF1C1B1F),
//   onBackground: Color(0xFFE6E1E5),
//   surface: Color(0xFF1C1B1F),
//   onSurface: Color(0xFFE6E1E5),
//   surfaceVariant: Color(0xFF49454F),
//   onSurfaceVariant: Color(0xFFCAC4D0),
//   inverseSurface: Color(0xFFE6E1E5),
//   onInverseSurface: Color(0xFF313033),
//   inversePrimary: Color(0xFF6750A4),
//   shadow: Color(0xFF000000),
//   surfaceTint: Color(0xFFD0BCFF),
//   outlineVariant: Color(0xFF49454F),
//   scrim: Color(0xFF000000),
// );
//
// class Event {
//   Event({
//     required this.title,
//     this.type = EventType.Booking,
//     this.description,
//     this.color,
//   });
//
//   /// The title of the [Event].
//   final String title;
//
//   /// The enum of the [Event].
//   final EventType type;
//
//   /// The description of the [Event].
//   final String? description;
//
//   /// The color of the [Event] tile.
//   final Color? color;
//
//   Event copyWith({
//     String? title,
//     EventType? type,
//     String? description,
//     Color? color,
//   }) {
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
//
// List<CalendarEvent<Event>> generateCalendarEvents(
//   List<BookingsRecord>? bookings,
//   List<UnavailabilityRecord>? unaivabilities,
//   String languageValue,
// ) {
//   List<CalendarEvent<Event>> events = [];
//   if (bookings != null) {
//     for (var booking in bookings) {
//       try {
//         // Suppose the booking class has startTime, endTime, and other fields
//         DateTime startTime = booking.startTime!;
//         DateTime endTime = booking.enTime!;
//         String title =
//             '${getLocalizedText(languageValue, "Busy schedule from ", "Planning occupé du ")} ${booking.startTime} ${getLocalizedText(languageValue, "to", "au")} ${booking.enTime} ';
//
//         // Create a CalendarEvent for each booking
//         events.add(
//           CalendarEvent<Event>(
//             dateTimeRange: DateTimeRange(
//               start: startTime,
//               end: endTime,
//             ),
//             eventData: Event(
//               title: title,
//               type: EventType.Booking,
//               description:
//                   'Service id: ${booking.serviceId}, Worker id: ${booking.workerId}',
//               color: Colors
//                   .blue, // You can customize the color based on the status or other criteria
//             ),
//           ),
//         );
//       } catch (e) {
//         print('Error with booking');
//         print(e);
//       }
//     }
//   }
//   if (unaivabilities != null) {
//     for (var unaivability in unaivabilities) {
//       try {
//         // Suppose the booking class has startTime, endTime, and other fields
//         DateTime startTime = unaivability.startTime!;
//         DateTime endTime = unaivability.endTime!;
//         String title =
//             '${getLocalizedText(languageValue, "Period of unavailability of the ", "Periode d\'indisponiblité du ")} ${startTime} ${getLocalizedText(languageValue, "to", "au")} ${endTime} '; // Replace with a more meaningful title if needed
//
//         // Create a CalendarEvent for each booking
//         events.add(
//           CalendarEvent<Event>(
//             dateTimeRange: DateTimeRange(
//               start: startTime,
//               end: endTime,
//             ),
//             eventData: Event(
//               title: title,
//               type: EventType.Unavailability,
//               description: 'Worker id : ${unaivability.workerId}',
//               color: Colors
//                   .red, // You can customize the color based on the status or other criteria
//             ),
//           ),
//         );
//       } catch (e) {
//         print('Error with unaivability');
//         print(e);
//       }
//     }
//   }
//
//   return events;
// }
//
// class CustomCalendar extends StatefulWidget {
//   const CustomCalendar({
//     super.key,
//     this.width,
//     this.height,
//     this.bookings,
//     this.unaivability,
//     this.startingDay,
//     this.endingDay,
//     this.refreshCalendarDatas,
//     this.updatePageStateWithSelectedBooking,
//     this.languageValue,
//   });
//
//   final double? width;
//   final double? height;
//   final List<BookingsRecord>? bookings;
//   final List<UnavailabilityRecord>? unaivability;
//   final DateTime? startingDay;
//   final DateTime? endingDay;
//   final Future Function(DateTime selectedDate)? refreshCalendarDatas;
//   final Future Function(BookingDataTypeStruct selectedBooking)?
//       updatePageStateWithSelectedBooking;
//   final String? languageValue;
//
//   @override
//   State<CustomCalendar> createState() => _CustomCalendarState();
// }
//
// class _CustomCalendarState extends State<CustomCalendar> {
//   late CalendarComponents calendarComponents;
//   late CalendarStyle calendarStyle;
//   late CalendarLayoutDelegates<Event> calendarLayoutDelegates;
//
//   final CalendarController<Event> calendarController =
//       CalendarController<Event>();
//
//   CalendarEventsController<Event> eventsController =
//       CalendarEventsController<Event>();
//
//   List<ViewConfiguration> viewConfigurations = [
//     WeekConfiguration(
//       name: 'Month',
//       multiDayTileHeight: 24,
//       enableResizing: true,
//       createMultiDayEvents: true,
//       enableRescheduling: true,
//       // showHeader: true
//       // numberOfDays: 1,
//       // startHour: 6,
//       // endHour: 18,
//     ),
//     WeekConfiguration(
//       name: 'Custom',
//       multiDayTileHeight: 24,
//       enableResizing: true,
//       createMultiDayEvents: true,
//       enableRescheduling: true,
//       // showHeader: true
//       // numberOfDays: 2,
//       // startHour: 6,
//       // endHour: 18,
//     ),
//     WeekConfiguration(),
//     WorkWeekConfiguration(),
//     MonthConfiguration(),
//     ScheduleConfiguration(),
//     MultiWeekConfiguration(),
//   ];
//   int currentConfiguration = 0;
//
//   @override
//   void initState() {
//     super.initState();
//
//     viewConfigurations = [
//       WeekConfiguration(
//         name: 'Month',
//         firstDayOfWeek: 1,
//         multiDayTileHeight: 24,
//         enableResizing: true,
//         createMultiDayEvents: true,
//         enableRescheduling: true,
//         // showHeader: true
//         // numberOfDays: 1,
//         // startHour: widget.startingDay?.hour ?? 6,
//         // endHour: widget.endingDay?.hour ?? 18,
//         // enableResizing: false,
//         // enableRescheduling: false,
//       ),
//       WeekConfiguration(
//         name: 'Custom',
//         multiDayTileHeight: 24,
//         enableResizing: true,
//         createMultiDayEvents: true,
//         enableRescheduling: true,
//         // showHeader: true
//         // numberOfDays: 2,
//         // startHour: widget.startingDay?.hour ?? 6,
//         // endHour: widget.endingDay?.hour ?? 18,
//       ),
//       WeekConfiguration(),
//       WorkWeekConfiguration(),
//       MonthConfiguration(),
//       ScheduleConfiguration(),
//       MultiWeekConfiguration(),
//     ];
//
//     calendarComponents = CalendarComponents(
//       calendarHeaderBuilder: _calendarHeaderBuilder,
//       calendarZoomDetector: _calendarZoomDetectorBuilder,
//     );
//     calendarStyle = CalendarStyle(
//         calendarHeaderBackgroundStyle:
//             CalendarHeaderBackgroundStyle(headerElevation: 0),
//         monthHeaderStyle: MonthHeaderStyle(
//           stringBuilder: (date) {
//             return DateFormat.EEEE(Intl.defaultLocale).format(date);
//           },
//         ),
//         dayHeaderStyle: DayHeaderStyle(
//           stringBuilder: (date) {
//             return DateFormat('EEE', Intl.defaultLocale).format(date);
//           },
//         ),
//         scheduleMonthHeaderStyle: ScheduleMonthHeaderStyle(
//           stringBuilder: (date) {
//             return DateFormat('yyyy - MMMM', Intl.defaultLocale).format(date);
//           },
//         ));
//
//     calendarLayoutDelegates = CalendarLayoutDelegates();
//     eventsController
//         .removeWhere((event) => event.eventData!.type != EventType.Temporary);
//     //eventsController.clearEvents();
//     eventsController.addEvents(generateCalendarEvents(widget.bookings,
//         widget.unaivability, widget.languageValue ?? default_language));
//   }
//
//   Widget _calendarHeaderBuilder(DateTimeRange visibleDateTimeRange) {
//     print("widget.languageValue");
//     print(widget.languageValue);
//     return CalendarHeader(
//       languageValue: widget.languageValue ?? default_language,
//       calendarController: calendarController,
//       viewConfigurations: viewConfigurations,
//       currentConfiguration: currentConfiguration,
//       onViewConfigurationChanged: (viewConfiguration) {
//         setState(() {
//           currentConfiguration = viewConfiguration;
//         });
//       },
//       visibleDateTimeRange: visibleDateTimeRange,
//       refreshCalendarDatas: widget.refreshCalendarDatas,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("widget.languageValue");
//     print(widget.languageValue);
//     print(
//         'startingDay: ${widget.startingDay}, endingDay: ${widget.endingDay}, bookings: ${widget.bookings}, unavailability: ${widget.unaivability}, selectedDate: ${calendarController.selectedDate}');
//
//     return Scaffold(
//       body: SafeArea(
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             try {
//               eventsController.removeWhere(
//                   (event) => event.eventData!.type != EventType.Temporary);
//               //eventsController.clearEvents();
//               eventsController.addEvents(generateCalendarEvents(
//                   widget.bookings,
//                   widget.unaivability,
//                   widget.languageValue ?? default_language));
//             } catch (e) {
//               print("error");
//               print(e);
//             }
//             final calendarWidget = CalendarWidget(
//               eventsController: eventsController,
//               calendarController: calendarController,
//               calendarComponents: calendarComponents,
//               calendarStyle: calendarStyle,
//               currentConfiguration: viewConfigurations[currentConfiguration],
//               calendarLayoutDelegates: calendarLayoutDelegates,
//               languageValue: widget.languageValue ?? default_language,
//               updatePageStateWithSelectedBooking:
//                   widget.updatePageStateWithSelectedBooking,
//               onDateTapped: () {
//                 // Appel de refreshCalendarDatas lors de la modification de la date
//                 if (widget.refreshCalendarDatas != null) {
//                   widget
//                       .refreshCalendarDatas!(calendarController.selectedDate!);
//                 }
//                 setState(() {
//                   currentConfiguration = 0;
//                 });
//               },
//             );
//
//             final calendarCustomize = CalendarCustomize(
//               currentConfiguration: viewConfigurations[currentConfiguration],
//               style: calendarStyle,
//               languageValue: widget.languageValue ?? default_language,
//               layoutDelegates: calendarLayoutDelegates,
//               onStyleChange: (newStyle) {
//                 setState(() {
//                   calendarStyle = newStyle;
//                 });
//               },
//               onCalendarLayoutChange: (newLayout) {
//                 setState(() {
//                   calendarLayoutDelegates = newLayout;
//                 });
//               },
//             );
//
//             final viewConfigurationCustomize = ViewConfigurationCustomize(
//               currentConfiguration: viewConfigurations[currentConfiguration],
//               languageValue: widget.languageValue ?? default_language,
//             );
//
//             if (constraints.maxWidth < 500) {
//               return calendarWidget;
//             } else {
//               return Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Flexible(
//                     flex: 3,
//                     child: calendarWidget,
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: SingleChildScrollView(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           calendarCustomize,
//                           viewConfigurationCustomize,
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _calendarZoomDetectorBuilder(
//       CalendarController controller, Widget child) {
//     return CalendarZoomDetector(
//       controller: controller,
//       child: child,
//     );
//   }
// }
