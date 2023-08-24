import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:display_name/blocs/signUpBloc/sign_up_bloc.dart';
import 'package:display_name/blocs/signUpBloc/sign_up_bloc_state.dart';
import 'package:display_name/Navigation/custom_navigation.dart';

class DisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        backgroundColor: Color.fromARGB(255, 4, 4, 4),
      ),
      body: Center(
        child: BlocBuilder<SignupBloc, SignupBlocState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Entered Email:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(state.email),
                  SizedBox(height: 16),
                  Text(
                    'Entered Password:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(state.password),
                  SizedBox(height: 16),
                  Text(
                    'Entered First Name:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(state.firstName),
                  SizedBox(height: 16),
                  Text(
                    'Entered Last Name:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(state.lastName),
                  SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      CustomNavigation.toSignIn();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Text(
                      'Go to Sign In Page',
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
