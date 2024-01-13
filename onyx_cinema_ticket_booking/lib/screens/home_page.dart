import 'package:flutter/material.dart';
import '../styles/color.dart';
import 'profile_page.dart';
import 'movie_details_page.dart';
import '../models/movie.dart';

class HomePage extends StatelessWidget {
  final List<Movie> nowShowingMovies = [
    Movie(
        title: 'The Godfather',
        imageUrl: 'lib/assets/godfather.jpeg',
        starRate: 4.9),
    Movie(
        title: 'The Godfather',
        imageUrl: 'lib/assets/godfather.jpeg',
        starRate: 4.9),
    Movie(
        title: 'The Godfather',
        imageUrl: 'lib/assets/godfather.jpeg',
        starRate: 4.9),
  ];

  final List<Movie> comingSoonMovies = [
    Movie(
        title: 'The Godfather',
        imageUrl: 'lib/assets/godfather.jpeg',
        starRate: 4.9),
    Movie(
        title: 'The Godfather',
        imageUrl: 'lib/assets/godfather.jpeg',
        starRate: 4.9),
    Movie(
        title: 'The Godfather',
        imageUrl: 'lib/assets/godfather.jpeg',
        starRate: 4.9),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title: Row(
          children: [
            GestureDetector(
              child: Image.asset(
                'lib/assets/onyxLogo.png',
                height: 36.0,
                width: 36.0,
                color: MyColors.second,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 20.0),
            const Text(
              'Onyx',
              style: TextStyle(color: MyColors.second),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: MyColors.second,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                style: const TextStyle(
                  fontSize: 18.0,
                  color: MyColors.white,
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: MyColors.white,
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: 18.0,
                    color: MyColors.white.withOpacity(0.7),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: MyColors.white,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.3),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Now Showing',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: MyColors.white),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: nowShowingMovies.length,
                  itemBuilder: (context, index) {
                    return MovieCard(movie: nowShowingMovies[index]);
                  },
                ),
              ),
              const SizedBox(height: 32.0),
              const Text(
                'Coming Soon',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: MyColors.white),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: comingSoonMovies.length,
                  itemBuilder: (context, index) {
                    return MovieCard(movie: comingSoonMovies[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: MyColors.primary,
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.second,
        onPressed: () {},
        elevation: 5.0,
        child: const Icon(Icons.local_offer),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsPage(movie: movie),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(right: 16.0),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  movie.imageUrl,
                  height: 160.0,
                  width: 120.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    background: null,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
