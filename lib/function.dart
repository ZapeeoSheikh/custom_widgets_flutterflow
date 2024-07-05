// import 'dart:io';

import 'dart:io';
import 'package:geocode/geocode.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FunctionTesting extends StatefulWidget {
  const FunctionTesting({super.key});

  @override
  State<FunctionTesting> createState() => _FunctionTestingState();
}

class _FunctionTestingState extends State<FunctionTesting> {
  DateTime cost = DateTime.now();
  
  initState(){
    // cost = actualCostOfJanuaray(
    //   [
    //     ShipmentRecord(delivery_date: "2024-04-16 12:00:00.000", cost: 10),
    //     ShipmentRecord(delivery_date: "2024-01-16 12:00:00.000", cost: 100),
    //     ShipmentRecord(delivery_date: "2024-01-16 12:00:00.000", cost: 100),
    //     ShipmentRecord(delivery_date: "2024-02-16 12:00:00.000", cost: 100),
    //     ShipmentRecord(delivery_date: "2024-02-16 12:00:00.000", cost: 100),
    //     ShipmentRecord(delivery_date: "2024-03-16 12:00:00.000", cost: 100),
    //   ]
    // );

    fun();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("COst of Januaray is: " ),
            Text("$cost"),
          ],
        ),
      ),
      
    );
  }

  double actualCostOfJanuaray(List<ShipmentRecord> shipments) {
    /// MODIFY CODE ONLY BELOW THIS LINE

    // calculate the cost of all the list where delivery date in shipment record must be in january
    final januaryShipments = shipments
        .where((shipment) => shipment.delivery_date.split("-")[1] == '01' || shipment.delivery_date.split("-")[1] == '02');
    // print("2024-02-16 12:00:00.000".split("-")[1]);
    print(januaryShipments);
    final totalCost = januaryShipments.fold<double>(
        0, (previousValue, shipment) => previousValue + shipment.cost);
    return totalCost;

    /// MODIFY CODE ONLY ABOVE THIS LINE
  }

  fun(){
    final dateFormatter = DateFormat("yyyy-MM-dd");
    final timeFormatter = DateFormat("hh:mm a"); // Use 'hh' for 12-hour format
    final pDate = dateFormatter.parse('2024-05-01');
    final pTime = timeFormatter.parse('8:10 AM');

    cost = DateTime(pDate.year, pDate.month, pDate.day, pTime.hour, pTime.minute);
  }


}


class ShipmentRecord {
  String delivery_date;
  int cost;

  ShipmentRecord({
    required this.delivery_date,
    required this.cost,
  });
}



class AddressToLatLng extends StatefulWidget {
  const AddressToLatLng({super.key});

  @override
  State<AddressToLatLng> createState() => _AddressToLatLngState();
}

class _AddressToLatLngState extends State<AddressToLatLng> {
  String Latlng = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(Latlng),
          ElevatedButton(onPressed: (){
              geocode();
          }, child: Text("Press me"))
        ],
      ),
    );
  }




  void geocode() async {

    GeoCode geoCode = GeoCode();

    try {
      Coordinates coordinates = await geoCode.forwardGeocoding(
          address: "Choburji Quaters Lahore");
      setState(() {
      print("Latitude: ${coordinates.latitude}");
      print("Longitude: ${coordinates.longitude}");
      Latlng = "Latitude: ${coordinates.latitude}, Longitude: ${coordinates.longitude}";
      });
    } catch (e) {
      print(e);
    }

  }
}
