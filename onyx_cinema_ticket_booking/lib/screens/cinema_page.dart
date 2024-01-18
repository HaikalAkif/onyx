import 'package:flutter/material.dart';
import '../styles/color.dart';

class CinemaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title: const Text(
          'Cinemas',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: MyColors.primary,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: TextField(
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: MyColors.white,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: MyColors.white,
                      ),
                      hintText: 'Search a cinema',
                      hintStyle: TextStyle(
                        fontSize: 18.0,
                        color: MyColors.white.withOpacity(0.7),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Cinema Nearby',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: MyColors.white,
                  ),
                ),
                const SizedBox(height: 20.0),
                CinemaSlider(),
                const SizedBox(height: 32.0),
                const Text(
                  'All Cinemas',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: MyColors.white,
                  ),
                ),
                const SizedBox(height: 10.0),
                _buildCinemaTile('Cinema A', true),
                const Divider(color: MyColors.white),
                _buildCinemaTile('Cinema B', false),
                const Divider(color: MyColors.white),
                _buildCinemaTile('Cinema C', false),
                const Divider(color: MyColors.white),
                _buildCinemaTile('Cinema D', false),
                const Divider(color: MyColors.white),
                _buildCinemaTile('Cinema E', false),
                const Divider(color: MyColors.white),
                _buildCinemaTile('Cinema F', false),
                const Divider(color: MyColors.white),
                _buildCinemaTile('Cinema G', false),
                const Divider(color: MyColors.white),
                _buildCinemaTile('Cinema H', false),
                const Divider(color: MyColors.white),
                _buildCinemaTile('Cinema I', false),
                const Divider(color: MyColors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCinemaTile(String cinemaName, bool isFavorite) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: MyColors.white,
          ),
          onPressed: () {},
        ),
        Text(
          cinemaName,
          style: const TextStyle(
            fontSize: 18.0,
            color: MyColors.white,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_forward,
          color: MyColors.white,
        ),
      ],
    );
  }
}

class CinemaSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 212.0,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return CinemaCard(
            cinemaName: 'Cinema $index',
            isFavorite: false,
          );
        },
      ),
    );
  }
}

class CinemaCard extends StatelessWidget {
  final String cinemaName;
  final bool isFavorite;

  CinemaCard({required this.cinemaName, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120.0,
            width: 160.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/cinema.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cinemaName,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red, // Customize favorite icon color
                      ),
                      onPressed: () {},
                    ),
                    const Text(
                      'Add to Favorites',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
