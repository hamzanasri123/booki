import 'package:flutter/material.dart';

import '../../../../core/widgets/app_card.dart';
import '../../../business/domain/entities/business.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({
    required this.business,
    required this.onTap,
    super.key,
  });

  final Business business;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AppCard(
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.storefront_outlined),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(business.name, style: theme.textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text('${business.category} • ${business.city}'),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(business.rating.toStringAsFixed(1)),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
