import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/app_user.dart';

class AuthState {
  const AuthState({
    this.user,
    this.isLoading = false,
  });

  final AppUser? user;
  final bool isLoading;

  bool get isAuthenticated => user != null;

  AuthState copyWith({
    AppUser? user,
    bool? isLoading,
    bool clearUser = false,
  }) {
    return AuthState(
      user: clearUser ? null : user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class AuthController extends StateNotifier<AuthState> {
  AuthController() : super(const AuthState());

  void loginAsClient() {
    state = const AuthState(
      user: AppUser(
        uid: 'demo_client',
        fullName: 'Ahmed Ben Ali',
        email: 'ahmed@mail.com',
        role: UserRole.client,
      ),
    );
  }

  void loginAsOwner() {
    state = const AuthState(
      user: AppUser(
        uid: 'demo_owner',
        fullName: 'Nour Ben Salah',
        email: 'owner@booki.tn',
        role: UserRole.owner,
        tenantId: 'elite_barber_tunis',
      ),
    );
  }

  void logout() {
    state = const AuthState();
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController();
});
