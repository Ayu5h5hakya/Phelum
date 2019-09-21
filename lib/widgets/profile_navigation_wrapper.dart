import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phelum/bloc/auth/auth_bloc.dart';
import 'package:phelum/bloc/auth/auth_state.dart';
import 'package:phelum/bloc/profile/profile_bloc.dart';
import 'package:phelum/data/firebase_user_repository.dart';
import 'package:phelum/data/seat_repository.dart';
import 'package:phelum/model/booking.dart';
import 'package:phelum/screens/profile.dart';
import 'package:phelum/screens/seat_reservation.dart';
import 'package:phelum/widgets/login_form.dart';

import '../colors.dart';

class ProfileavigationWrapper extends StatelessWidget {
  static const routeName = '/profile';
  final FirebaseUserRepository userRepository;

  ProfileavigationWrapper({this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          backgroundColor: midnightblue,
          body: _getWrapperBody(state),
        );
      },
    );
  }

  Widget _getWrapperBody(AuthState state) {
    if (state is Authenticated) {
      return BlocProvider<ProfileBloc>(
        builder: (context) =>
            ProfileBloc(firebaseUserRepository: userRepository),
        child: ProfileScreen(),
      );
    } else {
      return LoginForm();
    }
  }
}
