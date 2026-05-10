import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/controllers/auth_providers.dart';
import '../../../business/presentation/controllers/business_providers.dart';
import '../../data/datasources/booking_remote_datasource.dart';
import '../../data/repositories/booking_repository_impl.dart';
import '../../domain/repositories/booking_repository.dart';
import '../../domain/usecases/create_appointment.dart';
import '../../domain/usecases/update_appointment_status.dart';

final bookingRemoteDatasourceProvider =
    Provider<BookingRemoteDatasource>((ref) {
  return BookingRemoteDatasource(
    firestore: ref.watch(firestoreProvider),
    functions: ref.watch(firebaseFunctionsProvider),
  );
});

final bookingRepositoryProvider = Provider<BookingRepository>((ref) {
  return BookingRepositoryImpl(ref.watch(bookingRemoteDatasourceProvider));
});

final createAppointmentProvider = Provider<CreateAppointment>((ref) {
  return CreateAppointment(ref.watch(bookingRepositoryProvider));
});

final updateAppointmentStatusProvider =
    Provider<UpdateAppointmentStatus>((ref) {
  return UpdateAppointmentStatus(ref.watch(bookingRepositoryProvider));
});
