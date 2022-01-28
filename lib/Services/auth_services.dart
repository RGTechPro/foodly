import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth extends ChangeNotifier {
   User? _firebaseUser; 
   bool isLoading = false;
  setUser(User? user) {
    _firebaseUser = user;
    notifyListeners();
  }
   User? getUser() {
    return _firebaseUser;
  }
 Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        isLoading = true;
    //isLoading = true;
    notifyListeners();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
 addUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    bool exist = false;
    try {
      await users.doc(user!.uid).get().then((doc) {
        exist = doc.exists;
        if (exist == true) print('exist');
      });
    } catch (e) {
      // If any error
      exist = false;
      print(e);
    }
    if (exist == false) {
      users
          .doc(user!.uid)
          .set({
            'name': user.displayName,
            'email': user.email,
            'phoneNo': user.phoneNumber
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
  }


}
