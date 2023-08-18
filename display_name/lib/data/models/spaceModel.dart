class SpaceModel {
  String spaceId;
  String propertyName;
  String spaceTitle;
  String spaceDescription;
  double spaceRating;
  int spacePrice;
  List<String> spaceImages;

  SpaceModel({
    required this.spaceId,
    required this.propertyName,
    required this.spaceTitle,
    required this.spaceDescription,
    required this.spaceRating,
    required this.spacePrice,
    required this.spaceImages,
  });

  factory SpaceModel.fromJson(Map<String, dynamic> json) {
    return SpaceModel(
      spaceId: json['spaceId'],
      propertyName: json['propertyName'],
      spaceTitle: json['spaceTitle'],
      spaceDescription: json['spaceDescription'],
      spaceRating: json['spaceRating'].toDouble(),
      spacePrice: json['spacePrice'],
      spaceImages: List<String>.from(json['spaceImages']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'spaceId': spaceId,
      'propertyName': propertyName,
      'spaceTitle': spaceTitle,
      'spaceDescription': spaceDescription,
      'spaceRating': spaceRating,
      'spacePrice': spacePrice,
      'spaceImages': spaceImages,
    };
  }
}
