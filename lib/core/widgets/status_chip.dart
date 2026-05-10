import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({
    required this.label,
    required this.color,
    super.key,
  });

  factory StatusChip.pending() {
    return const StatusChip(label: 'En attente', color: AppColors.warning);
  }

  factory StatusChip.confirmed() {
    return const StatusChip(label: 'Confirme', color: AppColors.success);
  }

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
