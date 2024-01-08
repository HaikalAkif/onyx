import 'package:flutter/material.dart';
import '../styles/color.dart';

class QrCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text(
          'QR Code Page',
          style: TextStyle(color: MyColors.black),
        ),
      ),
    );
  }
}
