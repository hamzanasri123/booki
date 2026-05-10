import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/status_chip.dart';
import '../../../booking/domain/entities/appointment.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    required this.appointment,
    super.key,
  });

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    final time = DateFormat('HH:mm').format(appointment.startAt);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  appointment.serviceName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              _Status(status: appointment.status),
            ],
          ),
          const SizedBox(height: 8),
          Text('${appointment.employeeName} • $time'),
          const SizedBox(height: 6),
          Text('${appointment.price} DT • ${appointment.clientName}'),
        ],
      ),
    );
  }
}

class _Status extends StatelessWidget {
  const _Status({required this.status});

  final AppointmentStatus status;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      AppointmentStatus.pending => StatusChip.pending(),
      AppointmentStatus.confirmed => StatusChip.confirmed(),
      AppointmentStatus.cancelled => const StatusChip(
          label: 'Annulé',
          color: Colors.red,
        ),
      AppointmentStatus.completed => const StatusChip(
          label: 'Terminé',
          color: Colors.green,
        ),
      AppointmentStatus.noShow => const StatusChip(
          label: 'No-show',
          color: Colors.orange,
        ),
    };
  }
}
