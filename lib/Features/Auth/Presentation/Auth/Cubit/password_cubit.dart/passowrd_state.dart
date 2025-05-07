sealed class PassowrdState {}

final class PassowrdInitial extends PassowrdState {}

final class PassowrdLoading extends PassowrdState {}

final class PassowrdSuccess extends PassowrdState {}

final class PassowrdFailure extends PassowrdState {
  final String message;

  PassowrdFailure({required this.message});
}
