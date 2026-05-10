import '../entities/business.dart';
import '../repositories/business_repository.dart';

class WatchActiveBusinesses {
  const WatchActiveBusinesses(this.repository);

  final BusinessRepository repository;

  Stream<List<Business>> call({String? city}) {
    return repository.watchActiveBusinesses(city: city);
  }
}
