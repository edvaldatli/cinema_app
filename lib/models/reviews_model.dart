class Review {
  final String author;
  final String body;
  final String movieId;
  final double rating;

  Review({required this.author, required this.body, required this.movieId, required this.rating});

  static List<Review> allReviews = [
    Review(author: 'John', body: 'This movie is extremely good', movieId: '1', rating: 6),
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