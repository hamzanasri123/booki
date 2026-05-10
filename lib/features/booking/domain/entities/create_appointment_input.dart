class CreateAppointmentInput {
  const CreateAppointmentInput({
    required this.tenantId,
    required this.serviceId,
    required this.employeeId,
    required this.startAt,
  });

  final String tenantId;
  final String serviceId;
  final String employeeId;
  final DateTime startAt;

  Map<String, dynamic> toJson() {
    return {
      'tenantId': tenantId,
      'serviceId': serviceId,
      'employeeId': employeeId,
      'startAt': startAt.toIso8601String(),
    };
  }
}
