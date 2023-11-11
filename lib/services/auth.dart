import 'package:firebase_auth/firebase_auth.dart';
import 'package:userlogin/models/UserModel.dart';

class AuthService {
  // 1.firbase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // user from firebase user with uid
  UserModel? _userWithFirebaseUserUid(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // create a stream for checking the auth changes in the user
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userWithFirebaseUserUid);
  }

  // sign in anonymous
  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register using email and password

  Future registerWithEmailPasssword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (e) {
      print(e.toString());
    }
  }

  // login using email & password
  Future signInUsingEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (e) {
      print(e.toString());
    }
  }

  // login in gmail
  // signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
