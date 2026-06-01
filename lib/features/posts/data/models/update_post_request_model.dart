class UpdatePostRequestModel {
  
  final String title;
  final String description;
  final String category;
  final List <String> tags;

  UpdatePostRequestModel({
    required this.title,
    required this.description,
    required this.category,
    required this.tags,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'category': category,
      'tags': tags,
    };
  }
}