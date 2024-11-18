class BookingDataTypeStruct {
  final String clientId;
  final String workerId;
  final String serviceId;
  final String status;
  final DateTime scheduledAt;
  final DateTime startTime;
  final DateTime endTime;
  final double price;
  final String city;
  final bool equiped;
  final bool cleanedEled;
  final double numberHour;
  final String address;

  BookingDataTypeStruct({
    required this.clientId,
    required this.workerId,
    required this.serviceId,
    required this.status,
    required this.scheduledAt,
    required this.startTime,
    required this.endTime,
    required this.price,
    required this.city,
    required this.equiped,
    required this.cleanedEled,
    required this.numberHour,
    required this.address,
  });

  factory BookingDataTypeStruct.fromJson(Map<String, dynamic> json) {
    return BookingDataTypeStruct(
      clientId: json['clientId'] as String,
      workerId: json['workerId'] as String,
      serviceId: json['serviceId'] as String,
      status: json['status'] as String,
      scheduledAt: DateTime.parse(json['scheduledAt']),
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      price: json['price'] as double,
      city: json['city'] as String,
      equiped: json['equiped'] as bool,
      cleanedEled: json['cleanedEled'] as bool,
      numberHour: json['numberHour'] as double,
      address: json['address'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clientId': clientId,
      'workerId': workerId,
      'serviceId': serviceId,
      'status': status,
      'scheduledAt': scheduledAt.toIso8601String(),
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'price': price,
      'city': city,
      'equiped': equiped,
      'cleanedEled': cleanedEled,
      'numberHour': numberHour,
      'address': address,
    };
  }
}

class UnavailabilityRecord {
  final DateTime startTime;
  final DateTime endTime;
  final String workerId;

  UnavailabilityRecord({
    required this.startTime,
    required this.endTime,
    required this.workerId,
  });

  factory UnavailabilityRecord.fromJson(Map<String, dynamic> json) {
    return UnavailabilityRecord(
      startTime: DateTime.parse(json['start_time']),
      endTime: DateTime.parse(json['end_time']),
      workerId: json['workerId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start_time': startTime.toIso8601String(),
      'end_time': endTime.toIso8601String(),
      'workerId': workerId,
    };
  }
}


class BookingsRecord {
  final String clientId;
  final String workerId;
  final String serviceId;
  final String status;
  final DateTime scheduledAt;
  final DateTime completedAt;
  final double price;
  final String review;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String city;
  final DateTime startTime;
  final DateTime endTime;
  final bool equiped;
  final bool cleanedElec;
  final bool contract;
  final double numberHour;
  final String address;

  BookingsRecord({
    required this.clientId,
    required this.workerId,
    required this.serviceId,
    required this.status,
    required this.scheduledAt,
    required this.completedAt,
    required this.price,
    required this.review,
    required this.createdAt,
    required this.updatedAt,
    required this.city,
    required this.startTime,
    required this.endTime,
    required this.equiped,
    required this.cleanedElec,
    required this.contract,
    required this.numberHour,
    required this.address,
  });

  factory BookingsRecord.fromJson(Map<String, dynamic> json) {
    return BookingsRecord(
      clientId: json['clientId'] as String,
      workerId: json['workerId'] as String,
      serviceId: json['serviceId'] as String,
      status: json['status'] as String,
      scheduledAt: DateTime.parse(json['scheduledAt']),
      completedAt: DateTime.parse(json['completedAt']),
      price: json['price'] as double,
      review: json['review'] as String,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      city: json['city'] as String,
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      equiped: json['equiped'] as bool,
      cleanedElec: json['cleanedElec'] as bool,
      contract: json['contract'] as bool,
      numberHour: json['numberHour'] as double,
      address: json['address'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clientId': clientId,
      'workerId': workerId,
      'serviceId': serviceId,
      'status': status,
      'scheduledAt': scheduledAt.toIso8601String(),
      'completedAt': completedAt.toIso8601String(),
      'price': price,
      'review': review,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'city': city,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'equiped': equiped,
      'cleanedElec': cleanedElec,
      'contract': contract,
      'numberHour': numberHour,
      'address': address,
    };
  }
}