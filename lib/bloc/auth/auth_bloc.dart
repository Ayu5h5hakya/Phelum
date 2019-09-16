import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:phelum/bloc/auth/auth_event.dart';
import 'package:phelum/bloc/auth/auth_state.dart';
import 'package:phelum/data/firebase_user_repository.dart';
import 'package:phelum/model/booking.dart';

class AuthenticationBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseUserRepository _firebaseUserRepository;

  AuthenticationBloc({@required FirebaseUserRepository firebaseUserRepository})
      : _firebaseUserRepository = firebaseUserRepository;

  @override
  AuthState get initialState => Uninitializaed();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is ConfirmBooking) {
      yield* _mapConfirmingBookingToState(event.booking);
    }
  }

  Stream<AuthState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _firebaseUserRepository.isAuthenticated();
      if (isSignedIn) {
        final name = await _firebaseUserRepository.getUserId();
        yield Authenticated(name);
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthState> _mapLoggedInToState() async* {
    yield Authenticated(await _firebaseUserRepository.getUserId());
  }

  Stream<AuthState> _mapConfirmingBookingToState(Booking booking) async* {
    try{
      await _firebaseUserRepository.confirmBooking(booking);
      yield ConfirmationComplete();
    }catch(_){

    }
  }
}
