part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;

  SignUpInitial({required this.name, required this.email, required this.phoneNumber, required this.password});

  // SignUpInitial(this.name, this.email, this.phoneNumber, this.password);


}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class SignUpFailed extends SignUpState {
  final String error;

  SignUpFailed({required this.error});

}

