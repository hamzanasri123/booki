import '../../domain/entities/appointment.dart';
import '../../domain/entities/create_appointment_input.dart';
import '../../domain/repositories/booking_repository.dart';
import '../datasources/booking_remote_datasource.dart';

class BookingRepositoryImpl implements BookingRepository {
  const BookingRepositoryImpl(this.remoteDatasource);

  final BookingRemoteDatasource remoteDatasource;

  @override
  Stream<List<Appointment>> watchClientAppointments(String clientId) {
    return remoteDatasource.watchClientAppointments(clientId);
  }

  @override
  Stream<List<Appointment>> watchTenantAppointments(String tenantId) {
    return remoteDatasource.watchTenantAppointments(tenantId);
  }

  @override
  Future<String> createAppointment(CreateAppointmentInput input) {
    return remoteDatasource.createAppointment(input);
  }

  @override
  Future<void> updateAppointmentStatus({
    required String tenantId,
    required String appointmentId,
    required AppointmentStatus status,
  }) {
    return remoteDatasource.updateAppointmentStatus(
      tenantId: tenantId,
      appointmentId: appointmentId,
      status: status,
    );
  }
}
