import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phelum/bloc/profile/profile_bloc.dart';
import 'package:phelum/bloc/profile/profile_event.dart';
import 'package:phelum/bloc/profile/profile_state.dart';
import 'package:phelum/colors.dart';
import 'package:phelum/model/booking.dart';
import 'package:phelum/widgets/profile_divider.dart';

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
          return Column(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/fake.jpeg'),
                radius: 50,
              ),
              ProfileDivider(
                color: Colors.white,
                thickness: 2.0,
              ),
              Text(
                state.userProfile.body.email,
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                state.userProfile.body.address,
                style: TextStyle(fontSize: 15.0),
              ),
              Expanded(
                child: _getConfirmationsList(state.userProfile.body.bookings),
              )
            ],
          );
        }
      },
    );
  }

  Widget _getConfirmationsList(List<Booking> previousBookings) {
    return ListView.builder(
      itemCount: previousBookings.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
          margin: EdgeInsets.all(10.0),
          child: ListTile(
            title: Text(
              previousBookings.elementAt(index).movieName,
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              previousBookings.elementAt(index).movieDate +
                  " | " +
                  previousBookings.elementAt(index).movieTime,
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
