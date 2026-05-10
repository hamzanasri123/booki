class CreateBusinessInput {
  const CreateBusinessInput({
    required this.name,
    required this.category,
    required this.city,
    required this.address,
    required this.phone,
    this.description = '',
  });

  final String name;
  final String category;
  final String city;
  final String address;
  final String phone;
  final String description;

  Map<String, dynamic> toJson() {
    return {
      'name': name.trim(),
      'category': category.trim(),
      'city': city.trim(),
      'address': address.trim(),
      'phone': phone.trim(),
      'description': description.trim(),
    };
  }
}
