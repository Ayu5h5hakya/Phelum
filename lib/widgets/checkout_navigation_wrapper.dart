import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phelum/bloc/auth/auth_bloc.dart';
import 'package:phelum/bloc/auth/auth_state.dart';
import 'package:phelum/data/seat_repository.dart';
import 'package:phelum/model/booking.dart';
import 'package:phelum/screens/login.dart';
import 'package:phelum/screens/seat_reservation.dart';

class CheckoutavigationWrapper extends StatelessWidget {
  static const routeName = '/checkoutNav';
  final SeatRepository seatRepository;
  final Booking booking;
  CheckoutavigationWrapper({this.seatRepository, this.booking});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return SeatReservationBooking(seatRepository: seatRepository, booking: booking,);
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
