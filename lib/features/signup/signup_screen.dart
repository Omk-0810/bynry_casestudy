import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/signup/signup_bloc.dart';
import '../repos/authentication/auth.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
  create: (context) => SignupBloc(Repo()),
  child: _Login(),
);
  }
}
class _Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[700],

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          child: Column(
            children: [
              SizedBox(child: Spacer(),height: 20,),
              Text('Create an Account',style: TextStyle(fontSize: 20,color: Colors.white),),
              SizedBox(height: 30,),

              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged:(value)=>context.read<SignupBloc>().add(EmailChanged(value)) ,
                        decoration: InputDecoration(labelText: 'Email',
                        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20)
                        ),
                       
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        onChanged:(value)=>context.read<SignupBloc>().add(PasswordChanged(value)) ,
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Password',
                            contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20)
                        ),

                      ),
                      SizedBox(height: 30),

                      ElevatedButton(onPressed: () {
                          context.read<SignupBloc>().add(FormSubmit());
                      }, child: const Text("SIGNUP",style: TextStyle(color: Colors.white),),

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

            ],
          ),
        ),
      ),


    );


  }

}
