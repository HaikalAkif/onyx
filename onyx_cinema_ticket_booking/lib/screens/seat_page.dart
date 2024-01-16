import 'package:flutter/material.dart';
import '../styles/color.dart';

class SeatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text(
          'Select Seat Page',
          style: TextStyle(color: MyColors.black),
        ),
      ),
    );
  }
}
