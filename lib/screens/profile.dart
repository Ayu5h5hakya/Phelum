import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phelum/bloc/auth/auth_bloc.dart';
import 'package:phelum/bloc/auth/auth_state.dart';
import 'package:phelum/bloc/login/login_bloc.dart';
import 'package:phelum/bloc/login/login_state.dart';
import 'package:phelum/colors.dart';
import 'package:phelum/widgets/left_triangle_clipper.dart';
import 'package:phelum/widgets/login_form.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: wetasphalt,
        ),
        BlocBuilder<AuthenticationBloc, AuthState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return Text('done');
            } else {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                backgroundColor: Colors.transparent,
                body: LoginForm(),
              );
            }
          },
        )
      ],
    );
  }
}
/*
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state){
            return LoginForm();
          },
        )
*/
/* 
        Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 45.0),
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/fake.jpeg'))),
              ),
            ),
          ],
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            margin: EdgeInsets.only(top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Aaron Sterling',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Text('Shankhamul, New Baneshwor',
                          style: TextStyle(fontSize: 12, color: Colors.white))
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Text(
                    'Movie Data Preference',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Director',
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Checkbox(
                          value: false,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Producer',
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Checkbox(
                          value: false,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Cast',
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Checkbox(
                          value: false,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Budget',
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Checkbox(value: false,),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )*/
