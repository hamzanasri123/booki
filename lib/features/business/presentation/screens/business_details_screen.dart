import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/section_header.dart';
import '../../data/demo_businesses.dart';

class BusinessDetailsScreen extends StatelessWidget {
  const BusinessDetailsScreen({
    required this.tenantId,
    super.key,
  });

  final String tenantId;

  @override
  Widget build(BuildContext context) {
    final business = demoBusinesses.firstWhere(
      (item) => item.id == tenantId,
      orElse: () => demoBusinesses.first,
    );

    return Scaffold(
      appBar: AppBar(title: Text(business.name)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withValues(
                      alpha: 0.12,
                    ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.storefront_outlined, size: 72),
            ),
            const SizedBox(height: 18),
            Text(
              business.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 6),
            Text('${business.address} • ${business.rating} ★'),
            const SizedBox(height: 12),
            Text(business.description),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Services disponibles'),
            const SizedBox(height: 12),
            for (final service in business.services) ...[
              AppCard(
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_outline),
                    const SizedBox(width: 12),
                    Expanded(child: Text(service)),
                    const Text('25 DT'),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
            const SizedBox(height: 20),
            AppButton(
              label: 'Réserver',
              icon: Icons.calendar_month_outlined,
              onPressed: () => context.go('/client/booking/$tenantId'),
            ),
          ],
        ),
      ),
    );
  }
}
