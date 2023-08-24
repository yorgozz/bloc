// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:display_name/data/repository/AuthRepo.dart';
import '../../data/enum/signinEnum.dart';
import 'sign_in_bloc_event.dart';
import 'sign_in_bloc_state.dart';

class SignInBloc extends Bloc<SignInBlocEvent, SignInBlocState> {
  SignInBloc()
      : super(SignInBlocState(
            email: '',
            password: '',
            signinStatus: SigninStatus.unknown,
            error: '')) {
    on<UpdateEmailEvent>((event, emit) {
      emit(state.copyWith(
          email: event.newEmail, signinStatus: SigninStatus.unknown));
    });

    on<UpdatePasswordEvent>((event, emit) {
      emit(state.copyWith(
          password: event.newPassword, signinStatus: SigninStatus.unknown));
    });

    on<SignInPressedEvent>((event, emit) async {
      String errorr = await AuthRepo().loginUser(state.email, state.password);
      if (errorr == '') {
        emit(state.copyWith(signinStatus: SigninStatus.authenticated));
        print('successfulllllllllll login');
      } else {
        emit(state.copyWith(
            signinStatus: SigninStatus.unauthenticated, error: errorr));
      }
    });
  }
}
