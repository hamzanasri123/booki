import 'package:flutter/material.dart';

import '../../../../core/widgets/app_card.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final plans = const [
      ('Starter', '29 DT/mois', '1 employé • 50 réservations'),
      ('Pro', '79 DT/mois', 'Employés multiples • illimité'),
      ('Premium', '149 DT/mois', 'IA • promotions • multi-branches'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Abonnement')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            for (final plan in plans) ...[
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(plan.$1, style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 6),
                    Text(plan.$2),
                    const SizedBox(height: 6),
                    Text(plan.$3),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}
