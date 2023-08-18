// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:display_name/data/repository/AuthRepo.dart';
import 'sign_in_bloc_event.dart';
import 'sign_in_bloc_state.dart';
import 'package:display_name/Navigation/custom_navigation.dart';

class SignInBloc extends Bloc<SignInBlocEvent, SignInBlocState> {
  SignInBloc() : super(SignInBlocState('null', 'null')) {
    on<UpdateEmailEvent>((event, emit) {
      emit(state.copyWith(email: event.newEmail));
    });

    on<UpdatePasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.newPassword));
    });

    on<SignInPressedEvent>((event, emit) async {
      final user = await AuthRepo()
          .loginUser(event.context, event.email, event.password);

      if (user != null) {
        CustomNavigation.toHome();
        print('successfulllllllllll login');
      } else {
        CustomNavigation.toSignIn();
        print(' nottttttttttttttttt successful login');
      }
    });
  }
}
