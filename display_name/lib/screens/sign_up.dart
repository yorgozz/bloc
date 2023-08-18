import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:display_name/blocs/signUpBloc/sign_up_bloc_event.dart';
import 'package:display_name/blocs/signUpBloc/sign_up_bloc_bloc.dart';
import 'package:display_name/Navigation/custom_navigation.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Color(0XFF297BE6),
      ),
      body: Container(
        color: Color(0xFFF9F9F9),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 70),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Enter Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
                onChanged: (email) {
                  context.read<SignupBloc>().add(UpdateEmailEvent(email));
                },
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
                onChanged: (firstName) {
                  context
                      .read<SignupBloc>()
                      .add(UpdateFirstNameEvent(firstName));
                },
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
                onChanged: (lastName) {
                  context.read<SignupBloc>().add(UpdateLastNameEvent(lastName));
                },
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
                onChanged: (password) {
                  context.read<SignupBloc>().add(UpdatePasswordEvent(password));
                },
              ),
              SizedBox(height: 60),
              ElevatedButton(
                onPressed: () async {
                  context.read<SignupBloc>().add(PressSignUpEvent());
                  CustomNavigation.toDisplay();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0XFF297BE6),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontFamily: 'MontserratMedium'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
