import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthClass {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  // *************************
  FirebaseAuth auth = FirebaseAuth.instance;
  final storga = const FlutterSecureStorage();
  // *************************

  Future<void> googleSignIn(BuildContext context) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        try {
          UserCredential userCredential =
              await auth.signInWithCredential(credential);
          storeTokenAndData(userCredential);
          //Navigator.push(context, MaterialPageRoute(builder: (context) =>const MainNavigator()));
        } catch (e) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          final snackBar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        final snackBar = SnackBar(content: Text("Not able to sign in"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> storeTokenAndData(UserCredential userCredential) async {
    await storga.write(
        key: 'token', value: userCredential.credential!.token.toString());

    await storga.write(key: 'userCredential', value: userCredential.toString());
  }

  Future<String?> getToken() async {
    return await storga.read(key: 'token');
  }

  Future<void> logout() async {
    try {
      await _googleSignIn.signOut();
      await auth.signOut();
      await storga.delete(key: 'token');
    } catch (e) {}
  }
}
