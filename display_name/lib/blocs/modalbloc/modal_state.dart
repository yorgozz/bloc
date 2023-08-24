import 'package:equatable/equatable.dart';

class ModalState extends Equatable {
  final int adultcount;
  final int childrencount;
  final List<String> childrenage;
  final List<String> childrenSelectedAges;
  final bool confirmage;

  ModalState(
      {required this.adultcount,
      required this.childrencount,
      required this.childrenage,
      required this.childrenSelectedAges,
      required this.confirmage});

  @override
  List<Object> get props => [
        adultcount,
        childrencount,
        childrenage,
        confirmage,
        childrenSelectedAges
      ];

  ModalState copyWith(
      {int? adultcount,
      int? childrencount,
      List<String>? childrenage,
      List<String>? childrenSelectedAges,
      bool? confirmage}) {
    return ModalState(
        adultcount: adultcount ?? this.adultcount,
        childrencount: childrencount ?? this.childrencount,
        childrenage: childrenage ?? this.childrenage,
        childrenSelectedAges: childrenSelectedAges ?? this.childrenSelectedAges,
        confirmage: confirmage ?? this.confirmage);
  }
}
