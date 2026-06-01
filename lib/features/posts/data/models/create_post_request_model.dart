class CreatePostRequestModel{
  final String title;
  final String description;
  final String category;
  final List <String> tags;

  CreatePostRequestModel({
    required this.title,
    required this.description,
    required this.category,
    required this.tags,
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'category': category,
    'tags': tags,
  };

}