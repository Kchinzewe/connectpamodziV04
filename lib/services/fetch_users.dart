import 'package:connectpamodziv04/screens/Create/create_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:connectpamodziv04/models/user_model.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  UserModel _userFromFirebaseUser() {
    return user != null
        ? UserModel(
            name: user.uid,
          )
        : null;
  }

  Future signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
