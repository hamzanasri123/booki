import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../business/data/demo_businesses.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({
    required this.tenantId,
    super.key,
  });

  final String tenantId;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String? selectedService;
  String selectedEmployee = 'N’importe qui';
  String selectedTime = '14:00';

  @override
  Widget build(BuildContext context) {
    final business = demoBusinesses.firstWhere(
      (item) => item.id == widget.tenantId,
      orElse: () => demoBusinesses.first,
    );
    selectedService ??= business.services.first;

    return Scaffold(
      appBar: AppBar(title: const Text('Réserver')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(business.name, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            _ChoiceSection(
              title: 'Service',
              values: business.services,
              selectedValue: selectedService!,
              onSelected: (value) => setState(() => selectedService = value),
            ),
            const SizedBox(height: 20),
            _ChoiceSection(
              title: 'Employé',
              values: const ['N’importe qui', 'Sami', 'Karim'],
              selectedValue: selectedEmployee,
              onSelected: (value) => setState(() => selectedEmployee = value),
            ),
            const SizedBox(height: 20),
            _ChoiceSection(
              title: 'Heure',
              values: const ['10:00', '11:30', '14:00', '16:00'],
              selectedValue: selectedTime,
              onSelected: (value) => setState(() => selectedTime = value),
            ),
            const SizedBox(height: 20),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Confirmation'),
                  const SizedBox(height: 8),
                  Text('$selectedService avec $selectedEmployee'),
                  Text('Aujourd’hui à $selectedTime • 25 DT'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            AppButton(
              label: 'Confirmer la réservation',
              icon: Icons.check,
              onPressed: () => context.go(AppRoutes.appointments),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChoiceSection extends StatelessWidget {
  const _ChoiceSection({
    required this.title,
    required this.values,
    required this.selectedValue,
    required this.onSelected,
  });

  final String title;
  final List<String> values;
  final String selectedValue;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final value in values)
              ChoiceChip(
                label: Text(value),
                selected: value == selectedValue,
                onSelected: (_) => onSelected(value),
              ),
          ],
        ),
      ],
    );
  }
}
