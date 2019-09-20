import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phelum/bloc/profile/profile_bloc.dart';
import 'package:phelum/bloc/profile/profile_event.dart';
import 'package:phelum/bloc/profile/profile_state.dart';
import 'package:phelum/colors.dart';
import 'package:phelum/model/booking.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileBloc profileBloc;
  ProfileScreen({this.profileBloc});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileBloc>(context)..dispatch(LoadProfile());
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProfileLoaded) {
          return Scaffold(
              backgroundColor: midnightblue,
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
              body: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            state.userProfile.body.email,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            state.userProfile.body.address,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      CircleAvatar(
                        child: Image.asset('assets/images/fake.jpeg'),
                      )
                    ],
                  ),
                  Expanded(
                    child:
                        _getConfirmationsList(state.userProfile.body.bookings),
                  )
                ],
              ));
        }
      },
    );
  }

  Widget _getConfirmationsList(List<Booking> previousBookings) {
    return ListView.builder(
      itemCount: previousBookings.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            previousBookings.elementAt(index).movieName,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            previousBookings.elementAt(index).movieDate +
                " | " +
                previousBookings.elementAt(index).movieTime,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
