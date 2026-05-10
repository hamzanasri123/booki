import '../domain/entities/business.dart';

const demoBusinesses = [
  Business(
    id: 'elite_barber_tunis',
    name: 'Elite Barber Tunis',
    category: 'Barber',
    city: 'Tunis',
    address: 'Lac 1, Tunis',
    rating: 4.8,
    description: 'Barber shop premium à Tunis avec réservation rapide.',
    services: ['Coupe homme', 'Barbe', 'Coupe + barbe'],
  ),
  Business(
    id: 'glow_beauty',
    name: 'Glow Beauty Center',
    category: 'Beauté',
    city: 'Ariana',
    address: 'Menzah 6, Ariana',
    rating: 4.7,
    description: 'Soins visage, coiffure et esthétique dans un espace moderne.',
    services: ['Brushing', 'Soin visage', 'Manucure'],
  ),
];
