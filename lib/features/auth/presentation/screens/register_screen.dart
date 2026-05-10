import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Créer un compte')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const AppTextField(label: 'Nom complet', icon: Icons.badge_outlined),
            const SizedBox(height: 14),
            const AppTextField(label: 'Téléphone', icon: Icons.phone_outlined),
            const SizedBox(height: 14),
            const AppTextField(label: 'Email', icon: Icons.mail_outline),
            const SizedBox(height: 14),
            const AppTextField(
              label: 'Mot de passe',
              icon: Icons.lock_outline,
              obscureText: true,
            ),
            const SizedBox(height: 24),
            AppButton(
              label: 'Continuer',
              icon: Icons.arrow_forward,
              onPressed: () => context.go(AppRoutes.login),
            ),
          ],
        ),
      ),
    );
  }
}
