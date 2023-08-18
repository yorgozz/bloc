import 'spaceModel.dart';

class PropertyModel {
  String propertyId;
  String propertyName;
  List<SpaceModel> availableSpaces;

  PropertyModel({
    required this.propertyId,
    required this.propertyName,
    required this.availableSpaces,
  });

  // PropertyModel PropertyModelDefault() {
  //   return PropertyModel(propertyId: '', propertyName: '', availableSpaces: []);
  // }

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      propertyId: json['propertyId'],
      propertyName: json['propertyName'],
      availableSpaces: List<SpaceModel>.from(
        json['availableSpaces'].map((space) => SpaceModel.fromJson(space)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'propertyId': propertyId,
      'propertyName': propertyName,
      'availableSpaces':
          availableSpaces.map((space) => space.toJson()).toList(),
    };
  }
}
