import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/controllers/auth_providers.dart';
import '../../data/datasources/business_remote_datasource.dart';
import '../../data/repositories/business_repository_impl.dart';
import '../../domain/entities/business.dart';
import '../../domain/repositories/business_repository.dart';
import '../../domain/usecases/create_business.dart';
import '../../domain/usecases/watch_active_businesses.dart';

final firebaseFunctionsProvider = Provider<FirebaseFunctions>((ref) {
  return FirebaseFunctions.instance;
});

final businessRemoteDatasourceProvider =
    Provider<BusinessRemoteDatasource>((ref) {
  return BusinessRemoteDatasource(
    firestore: ref.watch(firestoreProvider),
    functions: ref.watch(firebaseFunctionsProvider),
  );
});

final businessRepositoryProvider = Provider<BusinessRepository>((ref) {
  return BusinessRepositoryImpl(ref.watch(businessRemoteDatasourceProvider));
});

final createBusinessProvider = Provider<CreateBusiness>((ref) {
  return CreateBusiness(ref.watch(businessRepositoryProvider));
});

final watchActiveBusinessesProvider = Provider<WatchActiveBusinesses>((ref) {
  return WatchActiveBusinesses(ref.watch(businessRepositoryProvider));
});

final activeBusinessesProvider = StreamProvider<List<Business>>((ref) {
  return ref.watch(watchActiveBusinessesProvider).call();
});
