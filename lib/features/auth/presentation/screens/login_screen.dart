import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(authControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Connexion')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              'Bienvenue sur Booki',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            const Text('Connectez-vous pour gérer vos rendez-vous.'),
            const SizedBox(height: 28),
            const AppTextField(
              label: 'Email',
              hint: 'ahmed@mail.com',
              icon: Icons.mail_outline,
            ),
            const SizedBox(height: 14),
            const AppTextField(
              label: 'Mot de passe',
              icon: Icons.lock_outline,
              obscureText: true,
            ),
            const SizedBox(height: 24),
            AppButton(
              label: 'Entrer comme client',
              icon: Icons.person_outline,
              onPressed: () {
                controller.loginAsClient();
                context.go(AppRoutes.clientHome);
              },
            ),
            const SizedBox(height: 12),
            AppButton(
              label: 'Entrer comme commerce',
              icon: Icons.storefront_outlined,
              onPressed: () {
                controller.loginAsOwner();
                context.go(AppRoutes.businessDashboard);
              },
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => context.go(AppRoutes.register),
              child: const Text('Créer un compte'),
            ),
          ],
        ),
      ),
    );
  }
}
