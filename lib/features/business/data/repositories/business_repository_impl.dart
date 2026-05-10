import '../../domain/entities/business.dart';
import '../../domain/entities/create_business_input.dart';
import '../../domain/repositories/business_repository.dart';
import '../datasources/business_remote_datasource.dart';

class BusinessRepositoryImpl implements BusinessRepository {
  const BusinessRepositoryImpl(this.remoteDatasource);

  final BusinessRemoteDatasource remoteDatasource;

  @override
  Stream<List<Business>> watchActiveBusinesses({String? city}) {
    return remoteDatasource.watchActiveBusinesses(city: city);
  }

  @override
  Future<Business> getBusiness(String tenantId) {
    return remoteDatasource.getBusiness(tenantId);
  }

  @override
  Future<String> createBusiness(CreateBusinessInput input) {
    return remoteDatasource.createBusiness(input);
  }
}
