import 'package:display_name/blocs/authenticationBloc/authentication_bloc.dart';
import 'package:display_name/blocs/homeBloc/home_bloc.dart';
import 'package:display_name/blocs/modalbloc/modal_bloc.dart';
import 'package:display_name/blocs/signInBloc/sign_in_bloc.dart';
import 'package:display_name/blocs/signUpBloc/sign_up_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Navigation/approutes.dart';
import 'Navigation/custom_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignupBloc>(create: (context) => SignupBloc()),
        BlocProvider<SignInBloc>(create: (context) => SignInBloc()),
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
        BlocProvider<AuthenticationBlocBloc>(
            create: (context) => AuthenticationBlocBloc()),
        BlocProvider<ModalBloc>(create: (context) => ModalBloc()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: AppRoutes.home,
      ),
    );
  }
}
