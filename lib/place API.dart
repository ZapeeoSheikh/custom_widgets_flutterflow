// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class GooglePlacesSearchWidget extends StatefulWidget {
//   final String apiKey;
//
//   const GooglePlacesSearchWidget({required this.apiKey});
//
//   @override
//   _GooglePlacesSearchWidgetState createState() =>
//       _GooglePlacesSearchWidgetState();
// }
//
// class _GooglePlacesSearchWidgetState extends State<GooglePlacesSearchWidget> {
//   final _searchController = TextEditingController();
//   List<PlaceResult> _searchResults = [];
//
//   Future<void> _searchPlaces(String query) async {
//     final url = Uri.https(
//       'maps.googleapis.com',
//       '/maps/api/place/textsearch/json',
//       {
//         'key': widget.apiKey,
//         'query': query,
//         'inputtype': 'textquery',
//       },
//     );
//
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final results = jsonDecode(response.body)['results'] as List;
//         _searchResults = results
//             .map((result) => PlaceResult.fromJson(result))
//             .toList();
//         setState(() {});
//       } else {
//         // Handle error
//         print('Error fetching places: ${response.statusCode}');
//       }
//     } catch (error) {
//       // Handle network error
//       print('Error fetching places: $error');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           controller: _searchController,
//           onChanged: (query) => _searchPlaces(query),
//           decoration: InputDecoration(
//             hintText: 'Search for places...',
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: _searchResults.length,
//             itemBuilder: (context, index) {
//               final place = _searchResults[index];
//               return ListTile(
//                 title: Text(place.name),
//                 subtitle: Text(place.formattedAddress),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class PlaceResult {
//   final String name;
//   final String formattedAddress;
//
//   PlaceResult({required this.name, required this.formattedAddress});
//
//   factory PlaceResult.fromJson(Map<String, dynamic> json) => PlaceResult(
//     name: json['name'],
//     formattedAddress: json['formatted_address'],
//   );
// }
