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
    Show(id: '1', theater: Theater.theaters[1], movie: Movie.movies[1], showTime: DateTime.now().add(Duration(hours: 8)), ticketsSold: 139)
  ];

  static List<Show> getAllShows(){
    return shows;
  }
}
