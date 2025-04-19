import 'package:firebase_auth/firebase_auth.dart';
import '../errors/exception.dart';

class FirebaseAuthServices {
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      print(
        "Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}",
      );
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'Email or passwrd is incorrect ');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'Email or passwrd is incorrect');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(message: 'Email or passwrd is incorrect');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'Poor internet connection');
      } else {
        throw CustomException(
          message: 'Something went wrong please try again later',
        );
      }
    } catch (e) {
      print(
        "Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}",
      );

      throw CustomException(
        message: 'Something went wrong please try again later',
      );
    }
  }
}
