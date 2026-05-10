import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../../../core/errors/app_exception.dart';
import '../../domain/entities/app_user.dart';
import '../models/user_model.dart';

class AuthRemoteDatasource {
  const AuthRemoteDatasource({
    required firebase_auth.FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
  })  : _firebaseAuth = firebaseAuth,
        _firestore = firestore;

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  Stream<AppUser?> watchCurrentUser() {
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) {
      if (firebaseUser == null) {
        return null;
      }

      return getUserProfile(firebaseUser.uid);
    });
  }

  Future<AppUser?> getCurrentUser() async {
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser == null) {
      return null;
    }

    return getUserProfile(firebaseUser.uid);
  }

  Future<AppUser> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      final uid = credential.user?.uid;
      if (uid == null) {
        throw const AppException('Unable to read signed-in user.');
      }

      return getUserProfile(uid);
    } on firebase_auth.FirebaseAuthException catch (error) {
      throw AppException(error.message ?? 'Authentication failed.', code: error.code);
    }
  }

  Future<AppUser> registerClient({
    required String fullName,
    required String email,
    required String password,
    String? phone,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      final uid = credential.user?.uid;
      if (uid == null) {
        throw const AppException('Unable to create user.');
      }

      final user = UserModel(
        uid: uid,
        fullName: fullName.trim(),
        email: email.trim(),
        phone: phone?.trim(),
        role: UserRole.client,
      );

      await _firestore.collection('users').doc(uid).set(user.toFirestore());
      return user;
    } on firebase_auth.FirebaseAuthException catch (error) {
      throw AppException(error.message ?? 'Registration failed.', code: error.code);
    }
  }

  Future<AppUser> getUserProfile(String uid) async {
    final snapshot = await _firestore.collection('users').doc(uid).get();
    if (!snapshot.exists) {
      throw const AppException('User profile was not found.');
    }

    return UserModel.fromFirestore(snapshot);
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
