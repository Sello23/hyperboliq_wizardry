class MyImage {
  const MyImage({
    required this.image,
    required this.sourceName,
  });

  final String image;
  final String sourceName;

  // fromJson factory constructor
  factory MyImage.fromJson(Map<String, dynamic> json) {
    return MyImage(
      image: json['image'] as String,
      sourceName: json['sourceName'] as String,
    );
  }

  // toJson method
  Map<String, dynamic> toJson([String? name]) {
    return {
      'image': 'assets/images/houses/${name?.toLowerCase()}_background.jpg',
      'sourceName': sourceName,
    };
  }
}
