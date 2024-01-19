import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../styles/color.dart';
import 'profile_page.dart';
import 'movie_details_page.dart';
import '../models/movie.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  void showSnackBar(BuildContext context, SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }

  Future<http.Response> getMovies(BuildContext context) async {
    return http.get(
      Uri.https('app.tgv.com.my', '/api/landing-page/v2/index.json'),
    );
  }

  // final List<Movie> nowShowingMovies = [
  //   Movie(
  //       title: 'The Godfather',
  //       imageUrl: 'lib/assets/godfather.jpeg',
  //       starRate: 4.9),
  //   Movie(
  //       title: 'The Godfather',
  //       imageUrl: 'lib/assets/godfather.jpeg',
  //       starRate: 4.9),
  //   Movie(
  //       title: 'The Godfather',
  //       imageUrl: 'lib/assets/godfather.jpeg',
  //       starRate: 4.9),
  // ];

  // final List<Movie> comingSoonMovies = [
  //   Movie(
  //       title: 'The Godfather',
  //       imageUrl: 'lib/assets/godfather.jpeg',
  //       starRate: 4.9),
  //   Movie(
  //       title: 'The Godfather',
  //       imageUrl: 'lib/assets/godfather.jpeg',
  //       starRate: 4.9),
  //   Movie(
  //       title: 'The Godfather',
  //       imageUrl: 'lib/assets/godfather.jpeg',
  //       starRate: 4.9),
  // ];

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
          child: FutureBuilder(
            future: getMovies(context),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Column(
                    children: [
                      Icon(
                        CupertinoIcons.exclamationmark_circle,
                        color: Colors.white,
                      ),
                      Text(
                        'Uh oh, something went wrong while loading our latest movies...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (snapshot.hasData) {
                final data = jsonDecode(snapshot.data!.body);

                final List<Movie> nowShowingMovies =
                    (data['nowShowingMovies'] as List<dynamic>)
                        .map(
                          (e) => Movie(
                            title: e['title'],
                            imageUrl:
                                'https://app.tgv.com.my${e['poster']['original']}',
                            starRate: 4.9,
                          ),
                        )
                        .toList();

                final List<Movie> comingSoonMovies =
                    (data['comingSoonMovies'] as List<dynamic>)
                        .map(
                          (e) => Movie(
                            title: e['title'],
                            imageUrl:
                                'https://app.tgv.com.my${e['poster']['original']}',
                            starRate: 4.9,
                          ),
                        )
                        .toList();

                return Column(
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
                      height: 246.0,
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        physics: const BouncingScrollPhysics(),
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
                      height: 246.0,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: comingSoonMovies.length,
                        itemBuilder: (context, index) {
                          return MovieCard(movie: comingSoonMovies[index]);
                        },
                      ),
                    ),
                  ],
                );
              }

              return const Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Please wait while we are loading our latest movies...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            },
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
      child: SizedBox(
        width: 160,
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
                  child: Image.network(
                    movie.imageUrl,
                    height: 200.0,
                    width: 180.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      background: null,
                      height: 1.25,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
