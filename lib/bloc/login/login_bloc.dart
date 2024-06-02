import 'dart:async';
import 'dart:core';
import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:bynry_casestudy/features/home/home.dart';
import 'package:bynry_casestudy/features/signup/signup_screen.dart';
import 'package:meta/meta.dart';

import '../../features/repos/authentication/login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginRepo) : super(LoginState()) {

    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<FormSubmit>(_formSubmit);
    on<NavigateSignup>(_navigateSignup);
    on<NavigateHome>(_navigateHome);

  }
  final LoginRepo loginRepo;
  void _emailChanged (EmailChanged event , Emitter<LoginState> emit)
  {
    final newValueEmail=event.email;
    final newState=state.copyWith(email: newValueEmail);
    emit(newState);

  }

  void _passwordChanged (PasswordChanged event , Emitter<LoginState> emit)
  {
    final newValuePassword=event.password;
    emit(state.copyWith(password: newValuePassword));


  }

  Future<void> _formSubmit (FormSubmit event , Emitter<LoginState> emit)
  async {
    final email=state.email;
    final password=state.password;
    try {
      final userCredential = await loginRepo.loginWithEmailAndPassword(email, password);
      final user = userCredential?.user;
      if (user != null) {
        await user.reload();
        bool isVerified = user.emailVerified;
        if (isVerified) {
          add(NavigateHome());
          emit(state.copyWith(status: FormStatus.success));
        } else {
          Get.snackbar("Email not verified", 'Verify email and try again later');
        }
      }
    } catch (error) {
      Get.snackbar("Login Error", error.toString());
    }
  }


  FutureOr<void> _navigateSignup(NavigateSignup event, Emitter<LoginState> emit) {
    Get.to(SignupScreen());
  }


  FutureOr<void> _navigateHome(NavigateHome event, Emitter<LoginState> emit) {
    Get.to(HomeScreen());
  }
}
