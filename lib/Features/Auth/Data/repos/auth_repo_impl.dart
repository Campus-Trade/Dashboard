import 'package:dartz/dartz.dart';
import 'package:dashboard/Features/Auth/Data/models/reset_passowrd.dart';

import '../../../../Core/errors/exception.dart';
import '../../../../Core/errors/failure.dart';
import '../../../../Core/services/firebase_auth_services.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/login_request_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImpl({required this.firebaseAuthServices});

  @override
  Future<Either<Failure, String>> signInWithEmailAndPassword(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
        email: loginRequestModel.email,
        password: loginRequestModel.password,
      );
      return right(user.uid);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure('Something went wrong please try again later'));
    }
  }

  @override
  Future<Either<Failure, bool>> sendPasswordResetEmail(
    ResetPassowrdModel resetPassowrdModel,
  ) async {
    try {
      var password = firebaseAuthServices.sendPasswordResetEmail(
        email: resetPassowrdModel.email,
      );
      return right(true);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure('Something went wrong please try again later'));
    }
  }
}
