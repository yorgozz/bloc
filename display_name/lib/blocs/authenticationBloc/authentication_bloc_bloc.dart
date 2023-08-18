import 'package:bloc/bloc.dart';
import 'package:display_name/data/repository/UserRepo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'authentication_bloc_event.dart';
part 'authentication_bloc_state.dart';

class AuthenticationBlocBloc
    extends Bloc<AuthenticationBlocEvent, AuthenticationBlocState> {
  AuthenticationBlocBloc() : super(AuthenticationBlocInitial()) {
    on<GetCurrentUserEvent>((event, emit) {
      UserRepo().fetchCurrentUserDetails();
    });
  }
}
