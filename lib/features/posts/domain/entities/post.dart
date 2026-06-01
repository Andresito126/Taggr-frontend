class Post{
  final String id;
  final String userId;
  final String title;
  final String description;
  final String category;
  final List<String> tags;
  // final String? imageUrl;


  Post({
  required this.id,
  required this.userId,
  required this.title,
  required this.description,
  required this.category,
  required this.tags,
  // this.imageUrl
});
}

