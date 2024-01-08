import 'package:flutter/material.dart';
import '../styles/color.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.primary,
      child: const Center(
        child: Text(
          'Movies Page',
          style: TextStyle(color: MyColors.white),
        ),
      ),
    );
  }
}
