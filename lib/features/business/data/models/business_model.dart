import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/business.dart';

class BusinessModel extends Business {
  const BusinessModel({
    required super.id,
    required super.name,
    required super.category,
    required super.city,
    required super.address,
    required super.rating,
    required super.description,
    required super.services,
    required this.ownerId,
    required this.phone,
    required this.isActive,
    required this.subscriptionPlan,
    this.photos = const [],
  });

  final String ownerId;
  final String phone;
  final bool isActive;
  final String subscriptionPlan;
  final List<String> photos;

  factory BusinessModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? <String, dynamic>{};

    return BusinessModel(
      id: doc.id,
      ownerId: data['ownerId'] as String? ?? '',
      name: data['name'] as String? ?? '',
      category: data['category'] as String? ?? '',
      city: data['city'] as String? ?? '',
      address: data['address'] as String? ?? '',
      phone: data['phone'] as String? ?? '',
      description: data['description'] as String? ?? '',
      rating: (data['rating'] as num?)?.toDouble() ?? 0,
      isActive: data['isActive'] as bool? ?? true,
      subscriptionPlan: data['subscriptionPlan'] as String? ?? 'starter',
      photos: List<String>.from(data['photos'] as List? ?? const []),
      services: const [],
    );
  }
}
