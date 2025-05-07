import 'package:dashboard/Features/Home/Data/Model/product_Model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data/repo/repo_product_impl.dart';
import 'get_pending_product_state.dart';

class PendingProductCubit extends Cubit<GetProductState> {
  final RepoProductImpl repo;

  PendingProductCubit(this.repo) : super(GetProductInitialState());

  Future<void> fetchPendingProducts() async {
    emit(GetProductLoadingState());

    final result = await repo.getPendingProducts();

    result.fold((failure) => emit(GetProductErrorState(failure.message)), (
      products,
    ) async {
      final List<ProductModel> updatedProducts = [];

      for (final product in products) {
        if (product.userId != null) {
          final userResult = await repo.getUserById(product.userId!);

          userResult.fold(
            (failure) {
              print("Error fetching user: ${failure.message}");
            },
            (user) {
              product.user = user;
              // print("User fetched successfully: ${user.firstName}");
            },
          );
        }

        updatedProducts.add(product);
      }

      emit(GetProductSuccessState(products)); // إرسال المنتجات المحدثة
    });
  }
}
