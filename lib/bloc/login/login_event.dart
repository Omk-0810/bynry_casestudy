part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}
final class EmailChanged extends LoginEvent{
  EmailChanged(this.email);
  final String email;
}
final class PasswordChanged extends LoginEvent{
  PasswordChanged(this.password);
  final String password;
}
final class FormSubmit extends LoginEvent{

}
final class NavigateSignup extends LoginEvent{}
final class NavigateHome extends LoginEvent{}
