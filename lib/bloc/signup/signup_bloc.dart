import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:bynry_casestudy/features/login/login_screen.dart';
import 'package:bynry_casestudy/features/repos/authentication/auth.dart';
import 'package:bynry_casestudy/features/signup/verify.dart';
import 'package:meta/meta.dart';


part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(this.repo) : super( SignupState()) {

   on<EmailChanged>(_emailChanged);
   on<PasswordChanged>(_passwordChanged);
   on<FormSubmit>(_formSubmit);
   on<VerifyClicked>(_verifyClicked);

  }
  final Repo repo;
  void _emailChanged (EmailChanged event , Emitter<SignupState> emit)
  {
    final newValueEmail=event.email;
    final newState=state.copyWith(email: newValueEmail);
    emit(newState);

  }

  void _passwordChanged (PasswordChanged event , Emitter<SignupState> emit)
  {
    final newValuePassword=event.password;
    emit(state.copyWith(password: newValuePassword));


  }

  Future<void> _formSubmit (FormSubmit event , Emitter<SignupState> emit)
  async {
    final email=state.email;
    final password=state.password;
    final user= await repo.createUserWithUsernamePassword(email, password);
   print("user:$user");
    if(user!=null){
      await repo.sendEmailVerificationLink(user);
      emit(state.copyWith(status: FormStatus.success));
      await FirebaseAuth.instance.currentUser!.reload();
      Get.to(verify());

    }
    else{
      emit(state.copyWith(status: FormStatus.error));

    }

  }



  Future<FutureOr<void>> _verifyClicked(VerifyClicked event, Emitter<SignupState> emit) async {
    await FirebaseAuth.instance.currentUser!.reload();
    print('cliked');
    Get.off(LoginScreen());
  }
}


