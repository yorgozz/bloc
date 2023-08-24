import 'package:bloc/bloc.dart';
import 'package:display_name/data/enum/authenticationEnum.dart';
import 'package:display_name/data/models/userModel.dart';
import 'package:display_name/data/repository/AuthRepo.dart';
import 'package:display_name/data/repository/UserRepo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'authentication_bloc_state.dart';

part 'authentication_bloc_event.dart';

class AuthenticationBlocBloc
    extends Bloc<AuthenticationBlocEvent, AuthenticationBlocState> {
  AuthenticationBlocBloc() : super(AuthenticationBlocState()) {
    on<GetCurrentUserEvent>((event, emit) async {
      UserModel? currentUser = await UserRepo().fetchCurrentUserDetails();
      print('here25 ${currentUser.toString()}');
      if (currentUser!.firstName != '') {
        emit(state.copywith(
            usr: currentUser, authenticationstatus: AuthStatus.authenticated));
      } else {
        emit(state.copywith(
          usr: currentUser,
          authenticationstatus: AuthStatus.unauthenticated,
        ));
      }
    });

    on<SignOutUserEvent>((event, emit) async {
      AuthRepo().signout();
      emit(this.state.copywith(
            usr: UserModel.empty,
            authenticationstatus: AuthStatus.unauthenticated,
          ));
    });
  }
}
