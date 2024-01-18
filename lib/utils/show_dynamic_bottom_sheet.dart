import 'package:flutter/material.dart';

void showCustomBottomSheet(BuildContext context, GlobalKey key, Widget widget) {
  final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
  final componentPosition = renderBox.localToGlobal(Offset.zero);

  double sheetHeight =
      MediaQuery.of(context).size.height - componentPosition.dy;

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: sheetHeight,
        padding: const EdgeInsets.all(12.0),
        color: Colors.white,
        child: widget,
      );
    },
  );
}
