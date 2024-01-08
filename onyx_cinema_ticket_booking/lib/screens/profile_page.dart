import 'package:flutter/material.dart';
import '../styles/color.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Center(
        child: Text(
          'Profile Page',
          style: TextStyle(color: MyColors.black),
        ),
      ),
    );
  }
}
