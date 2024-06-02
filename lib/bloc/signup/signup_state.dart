part of 'signup_bloc.dart';

enum FormStatus{
  initial,
  pending,
  success,
  error,

}


@immutable
final class SignupState {

  final String email;
  final String password;
  final FormStatus status;
  final String? errorMsg;


  SignupState({ this.email='',  this.password='', this.status=FormStatus.initial, this.errorMsg,
  }
      );

  SignupState copyWith({
    String? email,
    String? password,
    FormStatus? status,
    String? errorMsg,



  })=>SignupState(email: email ?? this.email, password: password ?? this.password, status: status  ?? this.status, errorMsg: errorMsg  ?? this.errorMsg);

}

