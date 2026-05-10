import 'package:flutter/material.dart';

import '../../../../core/widgets/empty_state.dart';
import '../../../booking/data/demo_appointments.dart';
import '../widgets/appointment_card.dart';

class ClientAppointmentsScreen extends StatelessWidget {
  const ClientAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rendez-vous')),
      body: SafeArea(
        child: demoAppointments.isEmpty
            ? const EmptyState(
                title: 'Aucun rendez-vous',
                message: 'Vos réservations apparaîtront ici.',
              )
            : ListView.separated(
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return AppointmentCard(appointment: demoAppointments[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemCount: demoAppointments.length,
              ),
      ),
    );
  }
}
