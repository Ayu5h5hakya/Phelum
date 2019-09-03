import 'package:firebase_auth/firebase_auth.dart';
import 'package:phelum/data/auth_repository.dart';

class FirebaseUserRepository extends UserRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseUserRepository({FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> authenticate(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  @override
  Future<String> getUserId() async{
    return (await _firebaseAuth.currentUser()).uid;
  }

  @override
  Future<bool> isAuthenticated() async{
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }
  
}