import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckoutButton extends StatelessWidget {
  final double price;
  final Function onCheckout;
  CheckoutButton({this.price, this.onCheckout});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCheckout,
      child: ListTile(
        title: Text(
          'Checkout',
        ),
        trailing: Text('\$$price'),
      ),
    );
  }
}
