import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/appointments/presentation/screens/client_appointments_screen.dart';
import '../../features/auth/domain/entities/app_user.dart';
import '../../features/auth/presentation/controllers/auth_controller.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/booking/presentation/screens/booking_screen.dart';
import '../../features/business/presentation/screens/business_details_screen.dart';
import '../../features/business/presentation/screens/business_setup_screen.dart';
import '../../features/dashboard/presentation/screens/business_dashboard_screen.dart';
import '../../features/employees/presentation/screens/employees_screen.dart';
import '../../features/home/presentation/screens/client_home_screen.dart';
import '../../features/onboarding/presentation/screens/splash_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/services/presentation/screens/services_screen.dart';
import '../../features/subscriptions/presentation/screens/subscription_screen.dart';
import 'app_routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: _RouterRefresh(ref),
    redirect: (context, state) {
      final isAuthRoute = state.matchedLocation == AppRoutes.login ||
          state.matchedLocation == AppRoutes.register ||
          state.matchedLocation == AppRoutes.splash;

      if (!authState.isAuthenticated && !isAuthRoute) {
        return AppRoutes.login;
      }

      if (authState.isAuthenticated && state.matchedLocation == AppRoutes.login) {
        return switch (authState.user!.role) {
          UserRole.owner || UserRole.employee => AppRoutes.businessDashboard,
          UserRole.client || UserRole.admin => AppRoutes.clientHome,
        };
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.clientHome,
        builder: (context, state) => const ClientHomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.businessDetails,
        builder: (context, state) {
          return BusinessDetailsScreen(
            tenantId: state.pathParameters['tenantId']!,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.booking,
        builder: (context, state) {
          return BookingScreen(tenantId: state.pathParameters['tenantId']!);
        },
      ),
      GoRoute(
        path: AppRoutes.appointments,
        builder: (context, state) => const ClientAppointmentsScreen(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.businessDashboard,
        builder: (context, state) => const BusinessDashboardScreen(),
      ),
      GoRoute(
        path: AppRoutes.businessSetup,
        builder: (context, state) => const BusinessSetupScreen(),
      ),
      GoRoute(
        path: AppRoutes.businessAppointments,
        builder: (context, state) => const ClientAppointmentsScreen(),
      ),
      GoRoute(
        path: AppRoutes.businessServices,
        builder: (context, state) => const ServicesScreen(),
      ),
      GoRoute(
        path: AppRoutes.businessEmployees,
        builder: (context, state) => const EmployeesScreen(),
      ),
      GoRoute(
        path: AppRoutes.subscription,
        builder: (context, state) => const SubscriptionScreen(),
      ),
    ],
  );
});

class _RouterRefresh extends ChangeNotifier {
  _RouterRefresh(Ref ref) {
    ref.listen(authControllerProvider, (_, __) => notifyListeners());
  }
}
