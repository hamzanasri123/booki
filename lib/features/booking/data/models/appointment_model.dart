import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/appointment.dart';

class AppointmentModel extends Appointment {
  const AppointmentModel({
    required super.id,
    required super.tenantId,
    required super.clientName,
    required super.serviceName,
    required super.employeeName,
    required super.startAt,
    required super.endAt,
    required super.price,
    required super.status,
    required this.clientId,
    required this.serviceId,
    required this.employeeId,
    required this.paymentStatus,
  });

  final String clientId;
  final String serviceId;
  final String employeeId;
  final String paymentStatus;

  factory AppointmentModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? <String, dynamic>{};

    return AppointmentModel(
      id: doc.id,
      tenantId: data['tenantId'] as String? ?? '',
      clientId: data['clientId'] as String? ?? '',
      clientName: data['clientName'] as String? ?? '',
      serviceId: data['serviceId'] as String? ?? '',
      serviceName: data['serviceName'] as String? ?? '',
      employeeId: data['employeeId'] as String? ?? '',
      employeeName: data['employeeName'] as String? ?? '',
      startAt: _dateFromTimestamp(data['startAt']) ?? DateTime.now(),
      endAt: _dateFromTimestamp(data['endAt']) ?? DateTime.now(),
      price: data['price'] as num? ?? 0,
      status: _statusFromString(data['status'] as String?),
      paymentStatus: data['paymentStatus'] as String? ?? 'unpaid',
    );
  }

  static AppointmentStatus _statusFromString(String? value) {
    return AppointmentStatus.values.firstWhere(
      (status) => status.name == value,
      orElse: () => AppointmentStatus.pending,
    );
  }

  static DateTime? _dateFromTimestamp(Object? value) {
    if (value is Timestamp) {
      return value.toDate();
    }

    return null;
  }
}
