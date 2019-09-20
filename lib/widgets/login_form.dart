import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phelum/bloc/auth/auth_bloc.dart';
import 'package:phelum/bloc/auth/auth_event.dart';
import 'package:phelum/bloc/login/login_bloc.dart';
import 'package:phelum/bloc/login/login_event.dart';
import 'package:phelum/bloc/login/login_state.dart';
import 'package:phelum/colors.dart';
import 'package:phelum/widgets/login_button.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  LoginBloc loginBloc;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
    emailController.addListener(_onEmailChanged);
    passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).dispatch(LoggedIn());
        }
        if (state.isFailure) {
          _showError();
        }
        if (state.isSubmitting) {
          _showProgress();
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return _getLoginFormBody();
        },
      ),
    );
  }

  void _onFormSubmitted() {
    loginBloc.dispatch(
      LoginWithCredentialsPressed(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }

  void _onEmailChanged() {
    print(emailController.text);
  }

  void _onPasswordChanged() {
    print(passwordController.text);
  }

  Widget _getLoginFormBody() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Form(
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white)),
              autovalidate: true,
              autocorrect: true,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock, color: Colors.white),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white)),
              obscureText: true,
              autocorrect: false,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  LoginButton(
                    onPressed: () {
                      _onFormSubmitted();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showProgress() {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Logging In...'),
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
  }

  void _showError() {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[Text('Login Failure'), Icon(Icons.error)],
        ),
        backgroundColor: Colors.red,
      ));
  }
}
