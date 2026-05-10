import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';

import '../../../../core/errors/app_exception.dart';
import '../../domain/entities/appointment.dart';
import '../../domain/entities/create_appointment_input.dart';
import '../models/appointment_model.dart';

class BookingRemoteDatasource {
  const BookingRemoteDatasource({
    required FirebaseFirestore firestore,
    required FirebaseFunctions functions,
  })  : _firestore = firestore,
        _functions = functions;

  final FirebaseFirestore _firestore;
  final FirebaseFunctions _functions;

  Stream<List<Appointment>> watchClientAppointments(String clientId) {
    return _firestore
        .collectionGroup('appointments')
        .where('clientId', isEqualTo: clientId)
        .orderBy('startAt', descending: true)
        .snapshots()
        .map(_mapAppointments);
  }

  Stream<List<Appointment>> watchTenantAppointments(String tenantId) {
    return _firestore
        .collection('tenants')
        .doc(tenantId)
        .collection('appointments')
        .orderBy('startAt')
        .snapshots()
        .map(_mapAppointments);
  }

  Future<String> createAppointment(CreateAppointmentInput input) async {
    final callable = _functions.httpsCallable('createAppointment');
    final result = await callable.call<Map<String, dynamic>>(input.toJson());
    final appointmentId = result.data['appointmentId'] as String?;

    if (appointmentId == null || appointmentId.isEmpty) {
      throw const AppException('Appointment creation did not return an id.');
    }

    return appointmentId;
  }

  Future<void> updateAppointmentStatus({
    required String tenantId,
    required String appointmentId,
    required AppointmentStatus status,
  }) async {
    final callable = _functions.httpsCallable('updateAppointmentStatus');
    await callable.call<void>({
      'tenantId': tenantId,
      'appointmentId': appointmentId,
      'status': status.name,
    });
  }

  List<Appointment> _mapAppointments(
    QuerySnapshot<Map<String, dynamic>> snapshot,
  ) {
    return snapshot.docs.map(AppointmentModel.fromFirestore).toList();
  }
}
