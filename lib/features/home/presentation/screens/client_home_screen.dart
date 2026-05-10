import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../business/data/demo_businesses.dart';
import '../widgets/business_card.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booki'),
        actions: [
          IconButton(
            onPressed: () => context.go(AppRoutes.appointments),
            icon: const Icon(Icons.calendar_month_outlined),
          ),
          IconButton(
            onPressed: () => context.go(AppRoutes.profile),
            icon: const Icon(Icons.person_outline),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Bonjour Ahmed',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 6),
            const Text('Trouvez et réservez votre prochain rendez-vous.'),
            const SizedBox(height: 18),
            const AppTextField(
              label: 'Rechercher',
              hint: 'Barber, salon, spa...',
              icon: Icons.search,
            ),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Catégories'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                _CategoryChip(label: 'Barber', icon: Icons.content_cut),
                _CategoryChip(label: 'Beauté', icon: Icons.spa_outlined),
                _CategoryChip(label: 'Sport', icon: Icons.fitness_center),
                _CategoryChip(label: 'Spa', icon: Icons.water_drop_outlined),
              ],
            ),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Commerces populaires'),
            const SizedBox(height: 12),
            for (final business in demoBusinesses) ...[
              BusinessCard(
                business: business,
                onTap: () => context.go('/client/business/${business.id}'),
              ),
              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    );
  }
}
