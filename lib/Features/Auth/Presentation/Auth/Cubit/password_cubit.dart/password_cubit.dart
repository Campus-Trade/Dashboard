import 'package:bloc/bloc.dart';
import 'package:dashboard/Features/Auth/Presentation/Auth/Cubit/password_cubit.dart/passowrd_state.dart';

import '../../../../Data/models/reset_passowrd.dart';
import '../../../../domain/repos/auth_repo.dart';

class PasswordCubit extends Cubit<PassowrdState> {
  PasswordCubit(this.authRepo) : super(PassowrdInitial());
  final AuthRepo authRepo;
  Future<void> resetPassword(ResetPassowrdModel resetPasswordModel) async {
    emit(PassowrdLoading());
    var result = await authRepo.sendPasswordResetEmail(resetPasswordModel);
    result.fold((failure) => emit(PassowrdFailure(message: failure.message)), (
      id,
    ) {
      if (resetPasswordModel.email == "campustrade95@gmail.com") {
        emit(PassowrdSuccess());
      } else {
        emit(PassowrdFailure(message: "You are not an admin"));
      }
    });
  }
}
