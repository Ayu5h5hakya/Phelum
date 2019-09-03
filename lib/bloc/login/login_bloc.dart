import 'package:flutter/widgets.dart';
import 'package:phelum/bloc/login/login_event.dart';
import 'package:phelum/bloc/login/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:phelum/data/firebase_user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  FirebaseUserRepository firebaseUserRepository;

  LoginBloc({@required this.firebaseUserRepository});

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
          email: event.email, password: event.password);
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginState.loading();
    try {
      await firebaseUserRepository.authenticate(email, password);
      yield LoginState.success();
    } catch (value) {
      print(value);
      yield LoginState.failure();
    }
  }
}
