enum AppointmentStatus {
  pending,
  confirmed,
  cancelled,
  completed,
  noShow;
}

class Appointment {
  const Appointment({
    required this.id,
    required this.tenantId,
    required this.clientName,
    required this.serviceName,
    required this.employeeName,
    required this.startAt,
    required this.endAt,
    required this.price,
    required this.status,
  });

  final String id;
  final String tenantId;
  final String clientName;
  final String serviceName;
  final String employeeName;
  final DateTime startAt;
  final DateTime endAt;
  final num price;
  final AppointmentStatus status;
}
