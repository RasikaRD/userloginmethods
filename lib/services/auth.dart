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
  // login using email & password
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
