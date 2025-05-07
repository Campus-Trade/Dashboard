abstract class ChangeProductState {}

class ChangeProductInitialState extends ChangeProductState {}

class ChangeProductLoadingState extends ChangeProductState {}

class ChangeProductSuccessState extends ChangeProductState {}

class ChangeProductErrorState extends ChangeProductState {
  final String error;
  ChangeProductErrorState(this.error);
}
