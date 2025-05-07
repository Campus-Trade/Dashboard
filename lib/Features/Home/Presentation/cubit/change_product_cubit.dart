import 'package:dashboard/Features/Home/Presentation/cubit/change_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data/repo/repo_product_state.dart';

class ChangeProductCubit extends Cubit<ChangeProductState> {
  final RepoProductStateImpl repo;

  ChangeProductCubit(this.repo) : super(ChangeProductInitialState());

  Future<void> ChangeProductState(String productId) async {
    emit(ChangeProductLoadingState());
    final result = await repo.changeProductState(productId);

    result.fold(
      (failure) => emit(ChangeProductErrorState(failure.message)),
      (products) => emit(ChangeProductSuccessState()),
    );
  }

  Future<void> deleteProduct(String productId) async {
    emit(ChangeProductLoadingState());

    final result = await repo.deleteProduct(productId);

    result.fold(
      (failure) => emit(ChangeProductErrorState(failure.message)),
      (products) => emit(ChangeProductSuccessState()),
    );
  }
}
