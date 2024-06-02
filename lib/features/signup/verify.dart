import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bynry_casestudy/bloc/signup/signup_bloc.dart';

import '../repos/authentication/auth.dart';

class verify extends StatelessWidget {

  const verify({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(Repo()),
      child: _verify(),
    );
  }
}

class _verify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
              'open your email and click on the link provided to verify email and reload this page'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SignupBloc>().add(VerifyClicked());
        },
        child: Icon(Icons.restart_alt_rounded),
      ),
    );
  }

}

Repo? repo;
final user = FirebaseAuth.instance.currentUser;


