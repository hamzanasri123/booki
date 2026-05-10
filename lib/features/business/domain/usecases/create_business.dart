import '../entities/create_business_input.dart';
import '../repositories/business_repository.dart';

class CreateBusiness {
  const CreateBusiness(this.repository);

  final BusinessRepository repository;

  Future<String> call(CreateBusinessInput input) {
    return repository.createBusiness(input);
  }
}
