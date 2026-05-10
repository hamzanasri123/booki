import '../domain/entities/appointment.dart';

final demoAppointments = [
  Appointment(
    id: 'apt_001',
    tenantId: 'elite_barber_tunis',
    clientName: 'Ahmed',
    serviceName: 'Coupe homme',
    employeeName: 'Sami',
    startAt: DateTime(2026, 5, 10, 14),
    endAt: DateTime(2026, 5, 10, 14, 30),
    price: 25,
    status: AppointmentStatus.pending,
  ),
  Appointment(
    id: 'apt_002',
    tenantId: 'elite_barber_tunis',
    clientName: 'Yassine',
    serviceName: 'Coupe + barbe',
    employeeName: 'Karim',
    startAt: DateTime(2026, 5, 10, 16),
    endAt: DateTime(2026, 5, 10, 16, 45),
    price: 40,
    status: AppointmentStatus.confirmed,
  ),
];
