import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

class RegisterClient {
  const RegisterClient(this.repository);

  final AuthRepository repository;

  Future<AppUser> call({
    required String fullName,
    required String email,
    required String password,
    String? phone,
  }) {
    return repository.registerClient(
      fullName: fullName,
      email: email,
      password: password,
      phone: phone,
    );
  }
}
