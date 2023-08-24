import 'package:equatable/equatable.dart';

abstract class ModalEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class IncrementAdultEvent extends ModalEvent {}

class DecrementAdultEvent extends ModalEvent {}

class IncrementChildrenEvent extends ModalEvent {}

class DecrementChildrenEvent extends ModalEvent {}

class UpdateChildAgeEvent extends ModalEvent {
  final int childIndex;
  final String newAge;

  UpdateChildAgeEvent(this.childIndex, this.newAge);

  @override
  List<Object> get props => [childIndex, newAge];
}

class ClearEvent extends ModalEvent {}
