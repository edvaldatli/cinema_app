import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'models/movie_model.dart';
import 'models/theater_model.dart';
import 'models/shows_model.dart';
import 'models/reviews_model.dart';

void main() {
  runApp(CinemaApp());
}

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
);

_showTicketBoughtNotification(BuildContext context) {
  final snackBar = SnackBar(
    backgroundColor: Colors.green,
    content: const Text('Ticket purchased successfully!'),
    duration: const Duration(seconds: 3),
    action: SnackBarAction(
      label: 'Close',
      onPressed: () {
        // This will hide the current SnackBar.
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void _handleTicketPurchase(BuildContext context) {
  _showTicketBoughtNotification(context);
}

void _showBookingModal(
    BuildContext context, String movieTitle, String showTime, String theater) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // To wrap the content's height
          children: [
            Text(
              movieTitle,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text('Time: $showTime'),
            Text('Theater: $theater'),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                  onPressed: () {
                    _handleTicketPurchase(context);
                    Navigator.pop(context); // Close the modal
                  },
                  child: const Text('Book'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle cancellation
                    Navigator.pop(context); // Close the modal
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Color for the cancel button
                  ),
                  child: const Text('Cancel'),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}

List<Movie> allMovies = Movie.getAllMovies();
List<Theater> theaters = Theater.getAllTheaters();
List<Show> allShows = Show.getAllShows();

class CinemaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cinema App',
      theme: darkTheme,
      home: MovieListScreen(),
    );
  }
}

class MovieListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies playing in our Cinema')),
      body: MovieList(),
    );
  }

  GridView MovieList() {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: allMovies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MovieDetailScreen(movie: allMovies[index]),
              ),
            );
          },
          child: MovieItem(index),
        );
      },
    );
  }

  Column MovieItem(int index) {
    return Column(
      children: [
        Container(
          child: Image.network(allMovies[index].imgURL,
              fit: BoxFit.cover, height: 200),
        ),
        const SizedBox(height: 4.0),
        Text(
          allMovies[index].title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(allMovies[index].genre)
      ],
    );
  }
}

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    List<Show> movieShows =
        allShows.where((show) => show.movie.id == movie.id).toList();

    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: MovieDetailContainer(movieShows),
        ),
      ),
    );
  }

  Column MovieDetailContainer(List<Show> movieShows) {
    final movieReviews = Review.fetchReviewFromMovieId(movie.id);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top section with image and title
        MovieHeader(),
        const SizedBox(height: 24),

        if (movieShows.isEmpty == false)
          ShowtimeContainer(movieShows)
        else
          const Text('No shows are currently scheduled',
              style: TextStyle(
                fontSize: 22,
              )),

        const SizedBox(height: 24.0),
        AboutContainer(),
        const SizedBox(height: 24.0),
        TrailerContainer(),
        const SizedBox(height: 24.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reviews:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 200,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: Colors.grey[1000],
              ),
              child: Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movieReviews.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 170, // width of individual review container
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey[1000],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${movieReviews[index].author}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  'Rating: 6.5',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '${movieReviews[index].body}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        )
      ],
    );
  }

  Column TrailerContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Trailer:",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: movie.trailerURL,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
              mute: false,
            ),
          ),
        ),
      ],
    );
  }

  Column AboutContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About:',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          movie.description,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Column ShowtimeContainer(List<Show> movieShows) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Showtimes:',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 120,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 6.0,
            ),
            itemCount: movieShows.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () {
                  _showBookingModal(
                      context,
                      movieShows[index].movie.title,
                      DateFormat('HH:mm').format(movieShows[index].showTime),
                      movieShows[index].theater.title);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black87),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          DateFormat('HH:mm')
                              .format(movieShows[index].showTime),
                          style: const TextStyle(fontSize: 22)),
                      Text(movieShows[index].theater.title,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white54))
                    ]),
              );
            },
          ),
        ),
      ],
    );
  }

  Row MovieHeader() {
    return Row(
      children: [
        Image.network(
          movie.imgURL,
          width: 120,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6.0),
              Text(
                movie.genre,
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
              const SizedBox(height: 6.0),
              Text(
                "${movie.runTime.toString()} minutes",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/imdb-icon.png', height: 30),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(movie.rating.toString(),
                        style:
                            TextStyle(fontSize: 16, color: Colors.grey[600])),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
