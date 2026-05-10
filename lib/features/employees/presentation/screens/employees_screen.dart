import 'package:flutter/material.dart';

import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/section_header.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const employees = [
      ('Sami', 'Coupe homme, Barbe'),
      ('Karim', 'Coupe + barbe'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Employés')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SectionHeader(title: 'Équipe'),
            const SizedBox(height: 12),
            for (final employee in employees) ...[
              AppCard(
                child: Row(
                  children: [
                    const CircleAvatar(child: Icon(Icons.person_outline)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            employee.$1,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(employee.$2),
                        ],
                      ),
                    ),
                    Switch(value: true, onChanged: (_) {}),
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
