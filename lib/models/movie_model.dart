class Movie {
  final int id;
  final String title;
  final String genre;
  final String ageRestriction;
  final String imgURL;
  final String description;
  final int runTime;

  Movie(
      {required this.id,
      required this.title,
      required this.ageRestriction,
      required this.imgURL,
      required this.description,
      required this.genre,
      required this.runTime});

  static List<Movie> movies = [
    Movie(
        id: 1,
        title: 'Interstellar',
        ageRestriction: '12',
        imgURL:
            'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg',
        description: 'When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.',
        genre: 'Sci/fi',
        runTime: 169),
    Movie(
        id: 2,
        title: 'Inception',
        ageRestriction: '12',
        imgURL:
            'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg',
        description: 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.',
        genre: 'Action',
        runTime: 148),
    Movie(
        id: 3,
        title: 'Mission Impossible: Dead Reckoning',
        ageRestriction: '12',
        imgURL:
            'https://m.media-amazon.com/images/M/MV5BYzFiZjc1YzctMDY3Zi00NGE5LTlmNWEtN2Q3OWFjYjY1NGM2XkEyXkFqcGdeQXVyMTUyMTUzNjQ0._V1_QL75_UY281_CR1,0,190,281_.jpg',
        description: 'Ethan Hunt and his IMF team must track down a dangerous weapon before it falls into the wrong hands.',
        genre: 'Action',
        runTime: 163),
  ];

  static List<Movie> getAllMovies() {
    return movies;
  }
}
