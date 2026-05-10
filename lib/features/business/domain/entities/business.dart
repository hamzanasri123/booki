class Business {
  const Business({
    required this.id,
    required this.name,
    required this.category,
    required this.city,
    required this.address,
    required this.rating,
    required this.description,
    required this.services,
  });

  final String id;
  final String name;
  final String category;
  final String city;
  final String address;
  final double rating;
  final String description;
  final List<String> services;
}
