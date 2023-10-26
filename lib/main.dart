import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/movie_model.dart';
import 'models/theater_model.dart';
import 'models/shows_model.dart';

void main() {
  runApp(CinemaApp());
}

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
);


_showTicketBoughtNotification(BuildContext context) {
  final snackBar = SnackBar(
    content: Text('Ticket purchased successfully!'),
    duration: Duration(seconds: 3),
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
  // Handle the purchase...

  // Show the notification
  _showTicketBoughtNotification(context);
}



void _showBookingModal(
    BuildContext context, String movieTitle, String showTime, String theater) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // To wrap the content's height
          children: [
            Text(
              movieTitle,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Time: $showTime'),
            Text('Theater: $theater'),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _handleTicketPurchase(context);
                    Navigator.pop(context); // Close the modal
                  },
                  child: Text('Confirm'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle cancellation
                    Navigator.pop(context); // Close the modal
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Color for the cancel button
                  ),
                  child: Text('Cancel'),
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
      padding: EdgeInsets.all(8.0),
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
        Expanded(
          child: Image.network(allMovies[index].imgURL, fit: BoxFit.cover),
        ),
        SizedBox(height: 4.0),
        Text(
          allMovies[index].title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
      appBar: AppBar(title: Text(movie.title)), // Optional
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items to the start
          children: [
            // Top section with image and title
            MovieHeader(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Showtimes",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // Assuming movieShows is a list of your movie showtimes.
            // This is for your grid section.
            ShowTimeButtons(movieShows),
            SizedBox(height: 24.0), // Some spacing
            // Movie details section
            Text(
              movie
                  .description, // Assuming your Movie class has a 'description' field
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24.0), // Some spacing
            // Trailer section (consider using a plugin/package to embed videos)
            Text("Trailer:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            // Embed the video player here
          ],
        ),
      ),
    );
  }

  Container ShowTimeButtons(List<Show> movieShows) {
    return Container(
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
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text(
                DateFormat('HH:mm').format(movieShows[index].showTime),
                style: TextStyle(fontSize: 22)),
              Text(
                movieShows[index].theater.title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54
                )
              )
            ]),
          );
        },
      ),
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
        SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6.0),
              Text(
                movie.genre,
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
              SizedBox(height: 6.0),
              Text(
                "${movie.runTime.toString()} minutes",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
