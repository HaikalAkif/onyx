import 'package:flutter/material.dart';
import '../styles/color.dart';
import './seat_page.dart';
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
  bool isDetailsVisible = false;

  Movie selectedMovie = Movie(
    title: 'The Godfather',
    imageUrl: 'lib/assets/godfather.jpeg',
    starRate: 4.9,
  );

  String selectedDate = 'SUN\n14 Jan';
  String selectedCinema = 'Cinema A';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isDetailsVisible) {
          setState(() {
            isDetailsVisible = false;
          });
        }
      },
      child: Scaffold(
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
              const Divider(),
              ListTile(
                title: const Text(
                  'Cinema C',
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
              const Divider(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isDetailsVisible = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.second,
                  foregroundColor: MyColors.black,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text(
                  'Continue',
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: buildDetailsContainer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget buildDetailsContainer() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDetailsVisible = !isDetailsVisible;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height:
            isDetailsVisible ? MediaQuery.of(context).size.height * 0.6 : 0.0,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                selectedMovie.imageUrl,
                height: 300.0,
                width: 180.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              selectedMovie.title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: MyColors.black,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Date: $selectedDate',
              style: const TextStyle(
                fontSize: 16.0,
                color: MyColors.black,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Cinema: $selectedCinema',
              style: const TextStyle(
                fontSize: 16.0,
                color: MyColors.black,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeatPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.primary,
                  foregroundColor: MyColors.white),
              child: const Text(
                'Select Seat',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
