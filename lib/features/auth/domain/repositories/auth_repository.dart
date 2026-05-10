import '../entities/app_user.dart';

abstract interface class AuthRepository {
  Stream<AppUser?> watchCurrentUser();

  Future<AppUser?> getCurrentUser();

  Future<AppUser> signInWithEmail({
    required String email,
    required String password,
  });

  Future<AppUser> registerClient({
    required String fullName,
    required String email,
    required String password,
    String? phone,
  });

  Future<void> signOut();
}
