import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phelum/bloc/auth/auth_bloc.dart';
import 'package:phelum/bloc/auth/auth_event.dart';
import 'package:phelum/bloc/auth/auth_state.dart';
import 'package:phelum/data/seat_repository.dart';
import 'package:phelum/model/booking.dart';
import 'package:phelum/widgets/checkout_btn.dart';
import 'package:phelum/widgets/screen_label.dart';
import 'package:phelum/widgets/seat_arrangement.dart';
import 'package:phelum/widgets/seat_legend.dart';
import 'package:phelum/widgets/ticket_dialog.dart';

import '../colors.dart';

class SeatReservationBooking extends StatelessWidget {
  static const routeName = '/seat_reservation_booking';
  ValueNotifier<double> totalPrice = ValueNotifier(0.0);
  List<int> seats = [];
  final SeatRepository seatRepository;
  final Booking booking;
  AuthenticationBloc _authenticationBloc;
  SeatReservationBooking({this.seatRepository, this.booking});

  @override
  Widget build(BuildContext context) {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    return BlocListener<AuthenticationBloc, AuthState>(
      listener: (context, state) {
        if (state is ConfirmingBooking) {
          Opacity(
            opacity: 0.5,
            child: Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        if (state is ConfirmationComplete) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('seat'),
        ),
        backgroundColor: wetasphalt,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          booking.movieName,
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          booking.cinemaName,
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(booking.movieTime,
                            style: TextStyle(fontSize: 15))
                      ],
                    ),
                  ),
                  Opacity(
                    opacity: 0.15,
                    child: Image.network(
                      booking.moviePoster,
                    ),
                  ),
                ],
              ),
              Container(
                child: SeatingArrangement(
                  seatRepository: seatRepository,
                  onSeatSelected: (index, price) {
                    totalPrice.value = totalPrice.value + price;
                    seats.add(index);
                  },
                ),
                margin: EdgeInsets.all(13.0),
                width: double.infinity,
                height: 270,
              ),
              SeatingLegend(),
              ScreenLabel(),
              Container(
                  margin: EdgeInsets.all(5.0),
                  color: Colors.blueAccent,
                  child: ValueListenableBuilder<double>(
                    valueListenable: totalPrice,
                    builder: (context, value, child) {
                      return CheckoutButton(
                        price: value,
                        onCheckout: () {
                          if (totalPrice.value != 0.0) {
                            booking.seats = seats.fold("", (p, c) {
                              if (p.isEmpty)
                                return c.toString();
                              else
                                return p + "," + c.toString();
                            });
                            booking.price = totalPrice.value.toString();
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => TicketDialog(
                                      booking: booking,
                                      onConfirmationClicked: () {
                                        _authenticationBloc.dispatch(
                                            ConfirmBooking(booking: booking));
                                      },
                                    ));
                          }
                        },
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
