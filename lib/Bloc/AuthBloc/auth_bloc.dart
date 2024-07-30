import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../DatabaseHelper/repository.dart';
import '../../Models/users.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Repository repository;
  AuthBloc(this.repository) : super(AuthInitial()) {

    on<LoginEvent>((event, emit) async{
      emit(Loading());
      try{
        Future.delayed(const Duration(seconds: 2));
        final authenticated = await repository.authenticate(
            Users(
                username: event.username,
                password: event.password));

        if(authenticated){
          Users usr = await repository.getLoggedIn(event.username);
          emit(Authenticated(usr));
        }else{
          emit(const ErrorState("Username or password is incorrect"));
        }
      }catch(e){
        emit(ErrorState(e.toString()));
      }
    });

    on<RegisterEvent>((event,emit)async{
      emit(Loading());
      try{
        Future.delayed(const Duration(seconds: 2));
        final res = await repository.registerUser(
            Users(
                fullName: event.users.fullName,
                email: event.users.email,
                username: event.users.username,
                password: event.users.password,
            ));

        if(res>0){
          Users usr = await repository.getLoggedIn(event.users.username);
          emit(SuccessRegister());
          // emit(Authenticated(usr));
        }else if (res == 0){
          emit(ErrorState("User ${event.users.username} already exist"));
        }
      }catch(e){
        emit(ErrorState(e.toString()));
      }

    });

    on<LogoutEvent>((event,emit){
      emit(LogoutState());
    });
  }
}
