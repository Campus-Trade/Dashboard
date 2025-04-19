import 'package:bloc/bloc.dart';
import '../../../Data/models/login_request_model.dart';
import '../../../domain/repos/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signin(LoginRequestModel loginRequestModel) async {
    emit(SigninLoading());
    var result = await authRepo.signInWithEmailAndPassword(loginRequestModel);
    result.fold((failure) => emit(SigninFailure(message: failure.message)), (
      id,
    ) {
      if (loginRequestModel.email == "campustrade95@gmail.com") {
        emit(SigninSuccess());
      }
    });
  }
}
