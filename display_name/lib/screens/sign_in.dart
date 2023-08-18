import 'package:display_name/Navigation/custom_navigation.dart';
import 'package:display_name/blocs/signInBloc/sign_in_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/signInBloc/sign_in_bloc_event.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF9F9F9),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'images/Group 10961.png',
                  ),
                  SizedBox(height: 16),
                  Text(
                    'You need to login to complete the booking process',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'MontserratRegular',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF323E48),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
              TextField(
                onChanged: (email) {
                  context.read<SignInBloc>().add(UpdateEmailEvent(email));
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                onChanged: (password) {
                  context.read<SignInBloc>().add(UpdatePasswordEvent(password));
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: Color(0XFF297BE6),
                      decoration: TextDecoration.underline,
                      fontFamily: 'MontserratRegular',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<SignInBloc>().add(SignInPressedEvent(
                        context,
                        context.read<SignInBloc>().state.email,
                        context.read<SignInBloc>().state.password,
                      ));
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0XFF297BE6),
                ),
                child: Text(
                  'Sign In',
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?",
                style: TextStyle(fontFamily: 'MontserratSemiBold')),
            SizedBox(width: 5),
            InkWell(
              onTap: () {
                CustomNavigation.toSignup();
              },
              child: Text(
                "SIGN UP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 44, 37, 255),
                  fontFamily: 'MontserratSemiBold',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
