import 'package:display_name/blocs/modalbloc/modal_event.dart';
import 'package:display_name/blocs/modalbloc/modal_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModalBloc extends Bloc<ModalEvent, ModalState> {
  ModalBloc()
      : super(ModalState(
            adultcount: 1,
            childrencount: 0,
            childrenage: [
              '0',
              '1',
              '2',
              '3',
              '4',
              '5',
              '6',
              '7',
              '8',
              '9',
              '10',
              '11',
              '12'
            ],
            childrenSelectedAges: [],
            confirmage: false)) {
    on<IncrementAdultEvent>((event, emit) async {
      int count1 = state.adultcount + 1;
      emit(state.copyWith(adultcount: count1));
    });
    on<DecrementAdultEvent>((event, emit) async {
      int count2 = state.adultcount - 1;
      if (count2 > 1) {
        emit(state.copyWith(adultcount: count2));
      } else {
        emit(state.copyWith(adultcount: 1));
      }
    });
    on<IncrementChildrenEvent>((event, emit) async {
      int count3 = state.childrencount + 1;
      List<String> newlistages = [...state.childrenSelectedAges];
      newlistages.add('0');
      emit(state.copyWith(
          childrencount: count3, childrenSelectedAges: newlistages));
    });
    on<DecrementChildrenEvent>((event, emit) async {
      int count4 = state.childrencount - 1;
      List<String> newlistages = [...state.childrenSelectedAges];

      if (count4 > 0) {
        newlistages.removeLast();
        emit(state.copyWith(
            childrencount: count4, childrenSelectedAges: newlistages));
      } else {
        emit(state.copyWith(childrencount: 0));
      }
    });
    on<ClearEvent>((event, emit) async {
      emit(state.copyWith(
          adultcount: 1,
          childrencount: 0,
          childrenage: [
            '0',
            '1',
            '2',
            '3',
            '4',
            '5',
            '6',
            '7',
            '8',
            '9',
            '10',
            '11',
            '12'
          ],
          childrenSelectedAges: [],
          confirmage: false));
    });
    on<UpdateChildAgeEvent>((event, emit) async {
      List<String> updatedSelectedAges = [...state.childrenSelectedAges];
      updatedSelectedAges[event.childIndex] = event.newAge;
      print('brl bloc: ${updatedSelectedAges}');

      emit(state.copyWith(childrenSelectedAges: updatedSelectedAges));
      print('after ${state.childrenSelectedAges}');
    });
  }
}
