import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/app_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                AppConstants.appName,
                style: theme.textTheme.headlineLarge?.copyWith(fontSize: 48),
              ),
              const SizedBox(height: 12),
              Text(
                'Réservation simple pour commerces de services.',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 32),
              AppButton(
                label: 'Commencer',
                icon: Icons.arrow_forward,
                onPressed: () => context.go(AppRoutes.login),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
