import 'package:display_name/data/models/propertyModel.dart';

class HomeState {
  final List<PropertyModel> properties;
  final PropertyModel selectedProperty;

  HomeState({
    required this.properties,
    required this.selectedProperty,
  });

  HomeState copyWith({
    List<PropertyModel>? properties,
    PropertyModel? selectedProperty,
  }) {
    return HomeState(
      properties: properties ?? this.properties,
      selectedProperty: selectedProperty ?? this.selectedProperty,
    );
  }

  List<Object?> get props => [properties, selectedProperty];
}
