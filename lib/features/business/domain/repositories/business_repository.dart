import '../entities/business.dart';
import '../entities/create_business_input.dart';

abstract interface class BusinessRepository {
  Stream<List<Business>> watchActiveBusinesses({String? city});

  Future<Business> getBusiness(String tenantId);

  Future<String> createBusiness(CreateBusinessInput input);
}
