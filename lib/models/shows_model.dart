import 'theater_model.dart';
import 'movie_model.dart';

class Show {
  final String id;
  final Theater theater;
  final Movie movie;
  final DateTime showTime;
  final int ticketsSold;

  Show({
    required this.id,
    required this.theater,
    required this.movie,
    required this.showTime,
    required this.ticketsSold,
  });

  static List<Show> shows = [
    Show(id: '1', theater: Theater.theaters[1], movie: Movie.movies[1], showTime: DateTime.now().add(Duration(hours: 8)), ticketsSold: 139),
    Show(id: '2', theater: Theater.theaters[2], movie: Movie.movies[0], showTime: DateTime.now().add(Duration(hours: 4)), ticketsSold: 190),
    Show(id: '3', theater: Theater.theaters[0], movie: Movie.movies[0], showTime: DateTime.now().add(Duration(hours: 3)), ticketsSold: 140),
    Show(id: '4', theater: Theater.theaters[3], movie: Movie.movies[0], showTime: DateTime.now().add(Duration(hours: 2)), ticketsSold: 69)
  ];

  static List<Show> getAllShows(){
    return shows;
  }
}
