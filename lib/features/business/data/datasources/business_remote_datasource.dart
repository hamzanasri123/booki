import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';

import '../../../../core/errors/app_exception.dart';
import '../../domain/entities/business.dart';
import '../../domain/entities/create_business_input.dart';
import '../models/business_model.dart';

class BusinessRemoteDatasource {
  const BusinessRemoteDatasource({
    required FirebaseFirestore firestore,
    required FirebaseFunctions functions,
  })  : _firestore = firestore,
        _functions = functions;

  final FirebaseFirestore _firestore;
  final FirebaseFunctions _functions;

  Stream<List<Business>> watchActiveBusinesses({String? city}) {
    var query = _firestore
        .collection('tenants')
        .where('isActive', isEqualTo: true)
        .orderBy('rating', descending: true);

    if (city != null && city.trim().isNotEmpty) {
      query = query.where('city', isEqualTo: city.trim());
    }

    return query.snapshots().map((snapshot) {
      return snapshot.docs.map(BusinessModel.fromFirestore).toList();
    });
  }

  Future<Business> getBusiness(String tenantId) async {
    final snapshot = await _firestore.collection('tenants').doc(tenantId).get();
    if (!snapshot.exists) {
      throw const AppException('Business was not found.');
    }

    return BusinessModel.fromFirestore(snapshot);
  }

  Future<String> createBusiness(CreateBusinessInput input) async {
    final callable = _functions.httpsCallable('createBusiness');
    final result = await callable.call<Map<String, dynamic>>(input.toJson());
    final tenantId = result.data['tenantId'] as String?;

    if (tenantId == null || tenantId.isEmpty) {
      throw const AppException('Business creation did not return tenantId.');
    }

    return tenantId;
  }
}
