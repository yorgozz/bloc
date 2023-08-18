import 'package:display_name/data/models/propertyModel.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class FetchPropertiesEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class SelectPropertyEvent extends HomeEvent {
  final PropertyModel selectedProperty;

  SelectPropertyEvent(this.selectedProperty);

  @override
  List<Object> get props => [selectedProperty];
}
