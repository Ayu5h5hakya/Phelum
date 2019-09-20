import 'package:flutter/cupertino.dart';
import 'package:bloc/bloc.dart';
import 'package:phelum/bloc/profile/profile_event.dart';
import 'package:phelum/data/firebase_user_repository.dart';

import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FirebaseUserRepository firebaseUserRepository;

  ProfileBloc({@required this.firebaseUserRepository});

  @override
  ProfileState get initialState => ProfileLoading();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is LoadProfile) {
      yield* _mapLoadProfileToState();
    }
  }

  Stream<ProfileState> _mapLoadProfileToState() async* {
    try {
      final profile = await firebaseUserRepository.getUserProfile();
      yield ProfileLoaded(profile);
    } catch (_) {
      yield ProfileNotLoaded();
    }
  }
}
