import 'package:display_name/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:display_name/screens/display_screen.dart';
import 'package:display_name/screens/sign_up.dart';
import 'package:display_name/screens/sign_in.dart';

class AppRoutes {
  static const String home = '/home';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String display = '/display';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePageScreen());
      case signin:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case display:
        return MaterialPageRoute(builder: (_) => DisplayScreen());
      default:
        return null;
    }
  }
}
