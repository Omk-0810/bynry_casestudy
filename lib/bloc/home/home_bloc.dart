import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:bynry_casestudy/features/chatBot/chatbot.dart';
import 'package:bynry_casestudy/features/login/login_screen.dart';
import 'package:meta/meta.dart';

import '../../features/signup/verify.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(NavigationState(0)) {
    on<NavigationClicked>(_NavigationClicked) ;
    on<LoadUsername>(_onLoadUsername);
    on<LogoutClicked>(_LogoutClicked) ;
    on<ChatbotClicked>(_ChatbotClicked);


  }

  FutureOr<void> _NavigationClicked(NavigationClicked event, Emitter<HomeState> emit) {
    if (state is NavigationState) {
      emit(NavigationState(event.index));
    } else {
      emit(NavigationState(event.index));
    }
  }

  FutureOr<void> _onLoadUsername(LoadUsername event, Emitter<HomeState> emit) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String? username=user.email;

      emit(UsernameLoaded(username!));
    } else {
      emit(HomeInitial(0));
    }
  }

  Future<void> _LogoutClicked(LogoutClicked event, Emitter<HomeState> emit) async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.snackbar("Logged Out!", "");
      Get.off(LoginScreen());
    } catch (error) {
      Get.snackbar("Logout Error", error.toString());
    }
  }

  FutureOr<void> _ChatbotClicked(ChatbotClicked event, Emitter<HomeState> emit) {
    Get.to(ChatBot());
  }
}

