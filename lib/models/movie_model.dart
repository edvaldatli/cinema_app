class Movie {
  final int id;
  final String title;
  final String genre;
  final String ageRestriction;
  final String imgURL;
  final String description;
  final int runTime;
  
  Movie({required this.id, required this.title, required this.ageRestriction, required this.imgURL, required this.description, required this.genre, required this.runTime});

  static List<Movie> movies = [
    Movie(id: 1, title: 'Interstellar', ageRestriction: '12', imgURL: 'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', description: 'A man stuck somewhere in space', genre: 'Sci/fi', runTime: 169),
    Movie(id: 2, title: 'Inception', ageRestriction: '12', imgURL: 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg', description: 'Something about dreams? Complicated', genre: 'Action', runTime: 148),
    Movie(id: 3, title: 'Mission Impossible: Dead Reckoning', ageRestriction: '12', imgURL: 'https://m.media-amazon.com/images/M/MV5BYzFiZjc1YzctMDY3Zi00NGE5LTlmNWEtN2Q3OWFjYjY1NGM2XkEyXkFqcGdeQXVyMTUyMTUzNjQ0._V1_QL75_UY281_CR1,0,190,281_.jpg', description: 'A small man blowing shit up', genre: 'Action', runTime: 163),
  ];

  static List<Movie> getAllMovies(){
    return movies;
  }
}