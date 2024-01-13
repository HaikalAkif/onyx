import 'package:flutter/material.dart';
import '../styles/color.dart';

class DateSlider extends StatefulWidget {
  @override
  _DateSliderState createState() => _DateSliderState();
}

class _DateSliderState extends State<DateSlider> {
  List<String> dates = [
    'SAT\n13 Jan',
    'SUN\n14 Jan',
    'MON\n15 Jan',
    'TUE\n16 Jan',
    'WED\n17 Jan',
    'THU\n18 Jan',
    'FRI\n19 Jan',
  ];

  int selectedDateIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDateIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: index == selectedDateIndex
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
                  if (dates[index].split('\n').length >= 1)
                    Text(
                      dates[index].split('\n')[0],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  if (dates[index].split('\n').length >= 2)
                    Text(
                      dates[index].split('\n')[1],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  if (dates[index].split('\n').length >= 3)
                    Text(
                      dates[index].split('\n')[2],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
