import 'package:bloc/bloc.dart';
import 'package:display_name/blocs/signUpBloc/sign_up_bloc_event.dart';
import 'package:display_name/blocs/signUpBloc/sign_up_bloc_state.dart';
import 'package:display_name/data/repository/AuthRepo.dart';

class SignupBloc extends Bloc<SignupBlocEvent, SignupBlocState> {
  SignupBloc() : super(SignupBlocState('null', 'null', 'null', 'null')) {
    on<UpdateEmailEvent>((event, emit) {
      emit(state.copyWith(email: event.newEmail));
    });

    on<UpdateFirstNameEvent>((event, emit) {
      emit(state.copyWith(firstName: event.newFirstName));
    });

    on<UpdateLastNameEvent>((event, emit) {
      emit(state.copyWith(lastName: event.newLastName));
    });

    on<UpdatePasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.newPassword));

      on<PressSignUpEvent>((event, emit) async {
        await AuthRepo().registerUser(
          state.email,
          state.password,
          state.firstName,
          state.lastName,
        );
      });
    });
  }
}
