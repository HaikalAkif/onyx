import 'package:flutter/material.dart';
import '../styles/color.dart';

class FbPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: const Center(
        child: Text(
          'F&B Page',
          style: TextStyle(color: MyColors.black),
        ),
      ),
    );
  }
}
