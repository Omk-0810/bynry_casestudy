part of 'login_bloc.dart';

enum FormStatus{
  initial,
  pending,
  success,
  error,
}

@immutable
final class LoginState {

  final String email;
  final String password;
  final FormStatus status;
  final String? errorMsg;

  LoginState({ this.email='',  this.password='', this.status=FormStatus.initial, this.errorMsg}
      );

  LoginState copyWith({
    String? email,
    String? password,
    FormStatus? status,
    String? errorMsg,


  })=>LoginState(email: email ?? this.email, password: password ?? this.password, status: status  ?? this.status, errorMsg: errorMsg  ?? this.errorMsg);

}

