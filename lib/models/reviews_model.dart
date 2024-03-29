class Review {
  final String author;
  final String body;
  final String movieId;
  final double rating;

  Review({required this.author, required this.body, required this.movieId, required this.rating});

  static List<Review> allReviews = [
    Review(author: 'Candice Frederick', body: "With all the rampant think pieces questioning the probability of every science fiction film that comes out, it's comforting to across a movie that doesn't really claim to have any of the answers.", movieId: '1', rating: 6),
    Review(author: 'Maddy', body: 'You will never ever see a better movie', movieId: '1', rating: 6),
  ];

  static List<Review> fetchReviewFromMovieId(movieId){
    List<Review> listOfReviews = [];
    for(Review review in allReviews){
      if(review.movieId == movieId){
        listOfReviews.add(review);
      }
    }
    return listOfReviews;
  }
}