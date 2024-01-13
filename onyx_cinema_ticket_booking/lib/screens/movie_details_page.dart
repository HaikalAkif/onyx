import 'package:flutter/material.dart';
import '../styles/color.dart';
import '../models/movie.dart';
import '../models/date_slider.dart';
import '../models/premiere_time_slider.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;

  MovieDetailsPage({required this.movie});

  DateSlider dateSlider = DateSlider();

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  bool isCinemaExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Showtimes'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 5.0,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image.asset(
                widget.movie.imageUrl,
                fit: BoxFit.cover,
                height: 400.0,
                width: 120.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                widget.movie.title,
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Text(
              'Duration: 2h 30min | Language: English',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Select date',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: DateSlider(),
            ),
            const SizedBox(height: 30.0),
            ListTile(
              title: const Text(
                'Cinema A',
                style: TextStyle(
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
        ),
      ),
    );
  }
}
