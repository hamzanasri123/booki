enum UserRole {
  client,
  owner,
  employee,
  admin;

  String get label {
    return switch (this) {
      UserRole.client => 'Client',
      UserRole.owner => 'Business owner',
      UserRole.employee => 'Employee',
      UserRole.admin => 'Admin',
    };
  }
}

class AppUser {
  const AppUser({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.role,
    this.tenantId,
    this.phone,
    this.photoUrl,
  });

  final String uid;
  final String fullName;
  final String email;
  final String? phone;
  final UserRole role;
  final String? tenantId;
  final String? photoUrl;
}
