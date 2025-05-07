import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failure.dart';
import '../../Data/models/login_request_model.dart';
import '../../Data/models/reset_passowrd.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> signInWithEmailAndPassword(
    LoginRequestModel loginRequestModel,
  );
  Future<Either<Failure, bool>> sendPasswordResetEmail(
    ResetPassowrdModel resetPassowrdModel,
  );
}
