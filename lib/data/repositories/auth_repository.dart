import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutor_app/data/models/user_model.dart';
import 'package:tutor_app/data/services/auth_service.dart';

class AuthRepository {
  final AuthService _authService = AuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> register(String email, String password, {String role = "student"}) async {
    User? user = await _authService.signUp(email, password);
    if (user != null) {
      UserModel newUser = UserModel(uid: user.uid, email: email, role: role);
      await _firestore.collection("users").doc(user.uid).set(newUser.toMap());
      return newUser;
    }
    return null;
  }

  Future<UserModel?> login(String email, String password) async {
    User? user = await _authService.signIn(email, password);
    if (user != null) {
      DocumentSnapshot doc = await _firestore.collection("users").doc(user.uid).get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }
    }
    return null;
  }

  Future<void> resetPassword(String email) => _authService.resetPassword(email);

  Future<void> logout() => _authService.signOut();

  Stream<User?> get userStream => _authService.userChanges;
}
