import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:bynry_casestudy/bloc/login/login_bloc.dart';

import '../repos/authentication/auth.dart';
import '../repos/authentication/login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => LoginBloc(LoginRepo() ),
  child: _Login(),
);
  }
}

class _Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[700],

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                  top: 50, left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back!',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Log into your account',
                    style: TextStyle(color: Colors.white),
                  ),

                ],
              ),
            ),
            Stack(
                children:[
                  Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        height: 550,
                        decoration: BoxDecoration(
                            color: Colors.grey[350],
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(14),
                                topLeft: Radius.circular(14))),
                      ),
                    ],),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80,left: 20,right: 20),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          height: 300,
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                          child: Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  onChanged:(value)=>context.read<LoginBloc>().add(EmailChanged(value)),
                                  decoration: const InputDecoration(
                                    hintText:'Enter the Email ID' ,),
                                ),

                                TextField(
                                  onChanged:(value)=>context.read<LoginBloc>().add(PasswordChanged(value)),
                                  obscureText: true,
                                  decoration: const InputDecoration(hintText:'Password' ),
                                ),
                                const SizedBox(height: 15,),

                                ElevatedButton(onPressed: (){
                                  context.read<LoginBloc>().add(FormSubmit());
                                }, child: const Text("LOGIN",style: TextStyle(color: Colors.white),),

                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffff7043),
                                    fixedSize: const Size(1000, 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),elevation: 5,),),


                              ],


                            ),
                          ),

                        ),

                      ),
                      Row(

                        children: [
                          const Spacer(),
                          const Text("Don't have an account?"),
                          TextButton(onPressed: (){
                            context.read<LoginBloc>().add(NavigateSignup());
                          },
                              child: const Text("Sign up",style: TextStyle(color: Colors.deepPurple),)),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),


                ]
            ),


          ],
        ),
      ),


    );
  }

}
