class Movie {
  final String id;
  final String title;
  final String genre;
  final String ageRestriction;
  final String imgURL;
  final String description;
  final int runTime;
  final String trailerURL;
  final double rating;

  Movie(
      {required this.id,
      required this.title,
      required this.ageRestriction,
      required this.imgURL,
      required this.description,
      required this.genre,
      required this.runTime,
      required this.trailerURL,
      required this.rating
    });

  static List<Movie> movies = [
    Movie(
        id: '1',
        title: 'Interstellar',
        ageRestriction: '12',
        imgURL:
            'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg',
        description:
            'When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.',
        genre: 'Sci/fi',
        runTime: 169,
        trailerURL: 'zSWdZVtXT7E',
        rating: 8.7),
    Movie(
        id: '2',
        title: 'Inception',
        ageRestriction: '12',
        imgURL:
            'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg',
        description:
            'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.',
        genre: 'Action',
        runTime: 148,
        trailerURL: '5EiV_HXIIGs',
        rating: 8.8),
    Movie(
        id: '3',
        title: 'Mission Impossible: Dead Reckoning',
        ageRestriction: '12',
        imgURL:
            'https://m.media-amazon.com/images/M/MV5BYzFiZjc1YzctMDY3Zi00NGE5LTlmNWEtN2Q3OWFjYjY1NGM2XkEyXkFqcGdeQXVyMTUyMTUzNjQ0._V1_QL75_UY281_CR1,0,190,281_.jpg',
        description:
            'Ethan Hunt and his IMF team must track down a dangerous weapon before it falls into the wrong hands.',
        genre: 'Action',
        runTime: 163,
        trailerURL: 'avz06PDqDbM',
        rating: 7.8),
    Movie(
        id: '4',
        title: 'Mamma Mia!',
        ageRestriction: '3',
        imgURL:
            'https://m.media-amazon.com/images/M/MV5BMTA2MDU0MjM0MzReQTJeQWpwZ15BbWU3MDYwNzgwNzE@._V1_.jpg',
        description:
            'The story of a bride-to-be trying to find her real father told using hit songs by the popular 1970s group ABBA.',
        genre: 'Comedy / Musical',
        runTime: 108,
        trailerURL: '8RBNHdG35WY',
        rating: 6.5),
    Movie(
        id: '5',
        title: 'The Nun II',
        ageRestriction: '16',
        imgURL:
            'https://m.media-amazon.com/images/M/MV5BNmE5MmM2ZGEtNTVlNC00M2Q3LTliMjMtMzg5YjUyMjliZWIzXkEyXkFqcGdeQXVyMTAxNzQ1NzI@._V1_.jpg',
        description:
            '1956 - France. A priest is murdered. An evil is spreading. The sequel to the worldwide smash hit follows Sister Irene as she once again comes face-to-face with Valak, the demon nun.',
        genre: 'Horror',
        runTime: 110,
        trailerURL: 'QF-oyCwaArU',
        rating: 5.7),
    Movie(
        id: '6',
        title: 'Gran Turismo',
        ageRestriction: '3',
        imgURL:
            'https://m.media-amazon.com/images/M/MV5BMTI1YjFmN2UtOWZhOC00MjkwLTg2ZjgtNDQ5NDQ3YWNmNGRkXkEyXkFqcGdeQXVyMTAxNzQ1NzI@._V1_.jpg',
        description:
            'Based on the unbelievable, inspiring true story of a team of underdogs - a struggling, working-class gamer, a failed former race car driver, and an idealistic motorsport exec - who risk it all to take on the most elite sport in the world.',
        genre: 'Action / Adventure',
        runTime: 134,
        trailerURL: 'GVPzGBvPrzw',
        rating: 7.2)
  ];

  static List<Movie> getAllMovies() {
    return movies;
  }
}
