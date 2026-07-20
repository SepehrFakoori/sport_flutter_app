class Review {
  final int id;
  final String author;
  final int rating;
  final String comment;
  final DateTime createdAt;

  const Review({
    required this.id,
    required this.author,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });
}
