import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this.remoteDatasource);

  final AuthRemoteDatasource remoteDatasource;

  @override
  Stream<AppUser?> watchCurrentUser() {
    return remoteDatasource.watchCurrentUser();
  }

  @override
  Future<AppUser?> getCurrentUser() {
    return remoteDatasource.getCurrentUser();
  }

  @override
  Future<AppUser> signInWithEmail({
    required String email,
    required String password,
  }) {
    return remoteDatasource.signInWithEmail(email: email, password: password);
  }

  @override
  Future<AppUser> registerClient({
    required String fullName,
    required String email,
    required String password,
    String? phone,
  }) {
    return remoteDatasource.registerClient(
      fullName: fullName,
      email: email,
      password: password,
      phone: phone,
    );
  }

  @override
  Future<void> signOut() {
    return remoteDatasource.signOut();
  }
}
