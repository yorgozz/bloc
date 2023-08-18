import 'package:flutter/material.dart';
import 'approutes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class CustomNavigation {
  static void toSignIn() {
    navigatorKey.currentState?.pushNamed(AppRoutes.signin);
  }

  static void toHome() {
    navigatorKey.currentState?.pushNamed(AppRoutes.home);
  }

  static void toSignup() {
    navigatorKey.currentState?.pushNamed(AppRoutes.signup);
  }

  static void toDisplay() {
    navigatorKey.currentState?.pushNamed(AppRoutes.display);
  }

  static void back(BuildContext context) {
    navigatorKey.currentState?.pop();
  }
}
