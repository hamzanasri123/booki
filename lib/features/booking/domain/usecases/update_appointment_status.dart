import '../entities/appointment.dart';
import '../repositories/booking_repository.dart';

class UpdateAppointmentStatus {
  const UpdateAppointmentStatus(this.repository);

  final BookingRepository repository;

  Future<void> call({
    required String tenantId,
    required String appointmentId,
    required AppointmentStatus status,
  }) {
    return repository.updateAppointmentStatus(
      tenantId: tenantId,
      appointmentId: appointmentId,
      status: status,
    );
  }
}
