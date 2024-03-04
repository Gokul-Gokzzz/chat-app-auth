import 'package:chat_app/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProviders extends ChangeNotifier {
  Future<UserCredential>? user;
  AuthenticationService service = AuthenticationService();
  signInWithEmail(String email, String password, BuildContext context) {
    return service.signInWithEmailAndPassword(email, password, context);
  }

  signUpWithEmail(String email, String password, String name) {
    return service.signInWithEmailAndPassword(email, password, name);
  }

  singupWithGoogle() {
    return service.signinWithGoogle();
  }

  signInWithGithub(context) {
    return service.signInWithGithub(context);
  }
}
