import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phelum/bloc/auth/auth_bloc.dart';
import 'package:phelum/bloc/auth/auth_event.dart';
import 'package:phelum/bloc/auth/auth_state.dart';

class ProfileScreen extends StatelessWidget {
  AuthenticationBloc _authenticationBloc;
  @override
  Widget build(BuildContext context) {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context)..dispatch(LoadProfile());
    return BlocBuilder<AuthenticationBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
          ),
          body: Text('data'),
        );
      },
    );
  }
}
