import 'package:display_name/blocs/authenticationBloc/authentication_bloc.dart';
import 'package:display_name/blocs/authenticationBloc/authentication_bloc_state.dart';
import 'package:display_name/data/enum/authenticationEnum.dart';
import 'package:display_name/data/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:display_name/Navigation/custom_navigation.dart';

class Burger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<AuthenticationBlocBloc, AuthenticationBlocState>(
        builder: (context, state) {
          if (state.authenticationstatus == AuthStatus.authenticated) {
            return buildAuthenticatedDrawer(state.currUser, context);
          } else {
            return buildGuestDrawer(context);
          }
        },
      ),
    );
  }

  Widget buildAuthenticatedDrawer(UserModel user, BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xFF3C4955),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome,',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                '${user.firstName} ${user.lastName}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Color.fromARGB(255, 255, 255, 255),
          child: ListTile(
            title: Text(
              'Sign Out',
              style: TextStyle(
                color: Color(0XFF323E48),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () {
              context.read<AuthenticationBlocBloc>().add(SignOutUserEvent());
              CustomNavigation.toHome();
            },
          ),
        ),
        SizedBox(height: 5),
        Container(
          color: Color.fromARGB(255, 255, 252, 252),
          child: ListTile(
            title: Text(
              'Profile',
              style: TextStyle(
                color: Color(0xFF323E48),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget buildGuestDrawer(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xFF3C4955),
          ),
          child: Text(
            'Welcome \n Guest',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          color: Color.fromARGB(255, 255, 255, 255),
          child: ListTile(
            title: Text(
              'Sign In',
              style: TextStyle(
                color: Color(0XFF323E48),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () {
              CustomNavigation.toSignIn();
            },
          ),
        ),
        SizedBox(height: 5),
        Container(
          color: Color.fromARGB(255, 255, 252, 252),
          child: ListTile(
            title: Text(
              'Profile',
              style: TextStyle(
                color: Color.fromARGB(70, 83, 81, 81),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
