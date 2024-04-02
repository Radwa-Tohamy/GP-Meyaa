import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meyaa/utility/ShowSnackBar.dart';
import 'package:meyaa/routes/app_routes.dart';
import 'package:meyaa/presentation/welcome_screen/welcome_screen.dart';
import 'package:meyaa/presentation/sign_up_screen/sign_up_screen.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:twitter_login/twitter_login.dart';

// import 'package:flutter_twitter_login/flutter_twitter_login.dart';

class firebaseAuthMethods {
  final FirebaseAuth _auth;
  firebaseAuthMethods(this._auth);

  //Email Sign UP
  Future<void> signUpWithEmail({
    required String UserName,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await SendEmailVerification(context);
      Navigator.pushReplacementNamed(context, AppRoutes.welcomeScreen);
    } on FirebaseAuthException catch (e) {
      // if you want to display your own custom error message
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      showSnackBar(
          context, e.message!); // Displaying the usual firebase error message
    }
  }

  // EMAIL LOGIN
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!_auth.currentUser!.emailVerified) {
        await SendEmailVerification(context);
        Navigator.pushReplacementNamed(context, AppRoutes.welcomeScreen);

        // restrict access to certain things using provider
        // transition to another page instead of home screen
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

// Email Verification
  Future<void> SendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email Verification Sent');
    }
    //firebase authException Type variable e
    on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, 'Error Occured while Sending verfication mail');
    }
  }

  // GOOGLE SIGN IN
  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential? userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // If sign-in is successful, navigate to the desired page
      if (userCredential != null) {
        await SendEmailVerification(context);
        Navigator.pushReplacementNamed(context, AppRoutes.welcomeScreen);
      }

      // Once signed in, return the UserCredential
      return userCredential;
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
      return null; // Return null if sign-in fails
    }
  }

  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      // Navigate to another page after signing in
      await SendEmailVerification(context);

      Navigator.pushReplacementNamed(context, AppRoutes.welcomeScreen);

      await _auth.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  Future<UserCredential?> signInWithTwitter(BuildContext context) async {
    try {
      final twitterLogin = new TwitterLogin(
          apiKey: 's08ntGpsXF5DEOzAK1zDdim2y',
          apiSecretKey: 'JqdBVviUgbGvAoxUzYnwfUXDjwbe4FDpTewwZl4z9z9YKYEBsh',
          redirectURI:
              'https://meyaa-gp-57e82.firebaseapp.com/__/auth/handler');

      // Trigger the sign-in flow
      final authResult = await twitterLogin.login();

      // Create a credential from the access token
      final twitterAuthCredential = TwitterAuthProvider.credential(
        accessToken: authResult.authToken!,
        secret: authResult.authTokenSecret!,
      );

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(twitterAuthCredential);

      // Navigate to another page after signing in
      Navigator.pushReplacementNamed(context, AppRoutes.welcomeScreen);
      await SendEmailVerification(context);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  void main() {
    runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SignUpScreen(),
        AppRoutes.welcomeScreen: (context) => WelcomeScreen(),
      },
    ));
  }
}
