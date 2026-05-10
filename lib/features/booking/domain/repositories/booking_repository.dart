import '../entities/appointment.dart';
import '../entities/create_appointment_input.dart';

abstract interface class BookingRepository {
  Stream<List<Appointment>> watchClientAppointments(String clientId);

  Stream<List<Appointment>> watchTenantAppointments(String tenantId);

  Future<String> createAppointment(CreateAppointmentInput input);

  Future<void> updateAppointmentStatus({
    required String tenantId,
    required String appointmentId,
    required AppointmentStatus status,
  });
}
