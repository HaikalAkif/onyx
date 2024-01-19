import 'package:flutter/material.dart';
import 'package:onyx/models/premiere_time_slider.dart';
import 'package:onyx/styles/color.dart';

class CinemaSelector extends StatefulWidget {
  const CinemaSelector({
    super.key,
    required this.cinemaName,
  });

  final String cinemaName;

  @override
  State<CinemaSelector> createState() => _CinemaSelectorState();
}

class _CinemaSelectorState extends State<CinemaSelector> {
  bool isCinemaExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            widget.cinemaName,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          trailing: IconButton(
            icon: Icon(isCinemaExpanded ? Icons.remove : Icons.add),
            color: MyColors.white,
            onPressed: () {
              setState(() {
                isCinemaExpanded = !isCinemaExpanded;
              });
            },
          ),
        ),
        if (isCinemaExpanded)
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PremiereTimeSlider(),
              ],
            ),
          ),
      ],
    );
  }
}
