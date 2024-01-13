import 'package:flutter/material.dart';
import '../styles/color.dart';

class PremiereTimeSlider extends StatefulWidget {
  @override
  _PremiereTimeSliderState createState() => _PremiereTimeSliderState();
}

class _PremiereTimeSliderState extends State<PremiereTimeSlider> {
  List<Map<String, String>> premiereDetails = [
    {'time': '10:00AM', 'type': '3D'},
    {'time': '15:00PM', 'type': '2D'},
    {'time': '19:00PM', 'type': 'IMAX'},
  ];

  int selectedPremiereIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: premiereDetails.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedPremiereIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: index == selectedPremiereIndex
                    ? MyColors.second
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: MyColors.second,
                  width: 2.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    premiereDetails[index]['time']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    premiereDetails[index]['type']!,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
