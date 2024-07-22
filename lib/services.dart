import 'package:firebase_auth/firebase_auth.dart';

class Services {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  singIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  signUp(String email, String password) {
    _auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}
