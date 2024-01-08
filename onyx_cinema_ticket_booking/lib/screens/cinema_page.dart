import 'package:flutter/material.dart';
import '../styles/color.dart';

class CinemaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Cinema Page',
          style: TextStyle(color: MyColors.black),
        ),
      ),
    );
  }
}
