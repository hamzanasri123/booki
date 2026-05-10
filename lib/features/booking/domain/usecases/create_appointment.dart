import '../entities/create_appointment_input.dart';
import '../repositories/booking_repository.dart';

class CreateAppointment {
  const CreateAppointment(this.repository);

  final BookingRepository repository;

  Future<String> call(CreateAppointmentInput input) {
    return repository.createAppointment(input);
  }
}
