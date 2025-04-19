import 'package:dartz/dartz.dart';

import '../../../Core/errors/failure.dart';
import '../../Data/models/login_request_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> signInWithEmailAndPassword(
    LoginRequestModel loginRequestModel,
  );
}
