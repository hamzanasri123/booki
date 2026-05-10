import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final user = authState.user;

    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 36,
                child: Text(user?.fullName.substring(0, 1) ?? 'B'),
              ),
              const SizedBox(height: 16),
              Text(
                user?.fullName ?? 'Invité',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 6),
              Text(user?.email ?? 'Non connecté'),
              const SizedBox(height: 6),
              Text(user?.role.label ?? 'Aucun rôle'),
              const Spacer(),
              AppButton(
                label: 'Déconnexion',
                icon: Icons.logout,
                onPressed: () {
                  ref.read(authControllerProvider.notifier).logout();
                  context.go(AppRoutes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
