import 'package:flutter/material.dart';

import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/section_header.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = const [
      ('Coupe homme', '30 min', '25 DT'),
      ('Barbe', '20 min', '15 DT'),
      ('Coupe + barbe', '45 min', '40 DT'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Services')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SectionHeader(title: 'Services actifs'),
            const SizedBox(height: 12),
            for (final service in services) ...[
              AppCard(
                child: Row(
                  children: [
                    const Icon(Icons.room_service_outlined),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service.$1,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(service.$2),
                        ],
                      ),
                    ),
                    Text(service.$3),
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
