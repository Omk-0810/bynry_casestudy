part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

final class EmailChanged extends SignupEvent{
  EmailChanged(this.email);
  final String email;
}
final class PasswordChanged extends SignupEvent{
  PasswordChanged(this.password);
  final String password;
}
final class FormSubmit extends SignupEvent{

}

final class VerifyClicked extends SignupEvent{

}


