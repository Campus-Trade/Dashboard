import '../../Data/Model/User_Model.dart';
import '../../Data/Model/product_Model.dart';

abstract class GetProductState {}

class GetProductInitialState extends GetProductState {}

class GetProductLoadingState extends GetProductState {}

class GetProductSuccessState extends GetProductState {
  final List<ProductModel> products;
  GetProductSuccessState(this.products);
}

class GetProductUserSuccessState extends GetProductState {
  final UserModel user;
  GetProductUserSuccessState(this.user);
}

class GetProductErrorState extends GetProductState {
  final String error;
  GetProductErrorState(this.error);
}
