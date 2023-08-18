import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:display_name/Navigation/custom_navigation.dart';

class Burger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final currentUserProvider = Provider.of<CurrentUserProvider>(context);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF3C4955),
            ),
            child: currentUserProvider.currentUser != null
                ? Column(
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
                        '${currentUserProvider.currentUser!.firstName} ${currentUserProvider.currentUser!.lastName}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                : Text(
                    'Welcome \n Guest',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
          StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              bool isUserLoggedIn = snapshot.hasData;

              return Column(
                children: [
                  if (isUserLoggedIn)
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
                          // FirebaseAuth.instance.signOut();
                          // Provider.of<CurrentUserProvider>(context,
                          //         listen: false)
                          //     .annulCurrentUser();
                          // CustomNavigation.back(context);
                        },
                      ),
                    )
                  else
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
                          color: isUserLoggedIn
                              ? Color(0xFF323E48)
                              : Color.fromARGB(70, 83, 81, 81),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
