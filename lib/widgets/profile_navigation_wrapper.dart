import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phelum/bloc/auth/auth_bloc.dart';
import 'package:phelum/bloc/auth/auth_state.dart';
import 'package:phelum/data/seat_repository.dart';
import 'package:phelum/model/booking.dart';
import 'package:phelum/screens/profile.dart';
import 'package:phelum/screens/seat_reservation.dart';
import 'package:phelum/widgets/login_form.dart';

class ProfileavigationWrapper extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return ProfileScreen();
        } else {
          return LoginForm();
        }
      },
    );
  }
}
