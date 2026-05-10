import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../appointments/presentation/widgets/appointment_card.dart';
import '../../../booking/data/demo_appointments.dart';

class BusinessDashboardScreen extends StatelessWidget {
  const BusinessDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appointments = demoAppointments;
    final revenue = appointments.fold<num>(
      0,
      (sum, appointment) => sum + appointment.price,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
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
              'Elite Barber Tunis',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: _MetricCard(
                    label: 'RDV aujourd’hui',
                    value: appointments.length.toString(),
                    icon: Icons.calendar_today_outlined,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _MetricCard(
                    label: 'Revenus',
                    value: '$revenue DT',
                    icon: Icons.payments_outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _DashboardAction(
                  label: 'Setup',
                  icon: Icons.tune,
                  onTap: () => context.go(AppRoutes.businessSetup),
                ),
                _DashboardAction(
                  label: 'Services',
                  icon: Icons.room_service_outlined,
                  onTap: () => context.go(AppRoutes.businessServices),
                ),
                _DashboardAction(
                  label: 'Employés',
                  icon: Icons.groups_outlined,
                  onTap: () => context.go(AppRoutes.businessEmployees),
                ),
                _DashboardAction(
                  label: 'Abonnement',
                  icon: Icons.workspace_premium_outlined,
                  onTap: () => context.go(AppRoutes.subscription),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Prochains rendez-vous'),
            const SizedBox(height: 12),
            for (final appointment in appointments) ...[
              AppointmentCard(appointment: appointment),
              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          const SizedBox(height: 12),
          Text(value, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }
}

class _DashboardAction extends StatelessWidget {
  const _DashboardAction({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      onPressed: onTap,
    );
  }
}
