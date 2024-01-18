import 'package:flutter/material.dart';
import '../styles/color.dart';

class TicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text(
          'My Ticket Page',
          style: TextStyle(color: MyColors.black),
        ),
      ),
    );
  }
}
