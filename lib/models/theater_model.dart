import 'movie_model.dart';

class Theater{
  final String id;
  final String title;
  final int seats;

  Theater({required this.id, required this.title, required this.seats});

  static List<Theater> theaters = [
    Theater(id: '1', title: 'Borg' ,seats: 150),
    Theater(id: '2', title: 'Litli Salur',seats: 278),
    Theater(id: '3', title: 'Stóri Salur', seats: 310)
  ];

  static List<Theater> getAllTheaters(){
    return theaters;
  }
}