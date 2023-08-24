import 'package:bloc/bloc.dart';
import 'package:display_name/blocs/signUpBloc/sign_up_bloc_event.dart';
import 'package:display_name/blocs/signUpBloc/sign_up_bloc_state.dart';
import 'package:display_name/data/repository/AuthRepo.dart';

import '../../data/enum/signupEnum.dart';

class SignupBloc extends Bloc<SignupBlocEvent, SignupBlocState> {
  SignupBloc()
      : super(SignupBlocState(
            email: '',
            password: '',
            firstName: '',
            lastName: '',
            signupStatus: SignupStatus.unknown,
            error: '')) {
    on<UpdateEmailEvent>((event, emit) {
      emit(state.copyWith(
          email: event.newEmail, signupStatus: SignupStatus.unknown));
    });

    on<UpdateFirstNameEvent>((event, emit) {
      emit(state.copyWith(
          firstName: event.newFirstName, signupStatus: SignupStatus.unknown));
    });

    on<UpdateLastNameEvent>((event, emit) {
      emit(state.copyWith(
          lastName: event.newLastName, signupStatus: SignupStatus.unknown));
    });

    on<UpdatePasswordEvent>((event, emit) {
      emit(state.copyWith(
          password: event.newPassword, signupStatus: SignupStatus.unknown));
    });

    on<PressSignUpEvent>((event, emit) async {
      String errorr = await AuthRepo().registerUser(
        state.email,
        state.password,
        state.firstName,
        state.lastName,
      );
      if (errorr == '') {
        emit(state.copyWith(signupStatus: SignupStatus.authenticated));
      } else {
        emit(state.copyWith(
            signupStatus: SignupStatus.unauthenticated, error: errorr));
      }
    });
  }
}
