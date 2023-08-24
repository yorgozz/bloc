import 'package:bloc/bloc.dart';
import 'package:display_name/blocs/homeBloc/home_bloc_event.dart';
import 'package:display_name/blocs/homeBloc/home_bloc_state.dart';
import '../../data/repository/PropertyRepo.dart';
import 'package:display_name/data/models/propertyModel.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(HomeState(
            properties: [],
            selectedProperty: PropertyModel(
              availableSpaces: [],
              propertyId: '',
              propertyName: '',
            ))) {
    on<FetchPropertiesEvent>((event, emit) async {
      try {
        final PropertyRepo propertyService = PropertyRepo();
        final properties = await propertyService.getAllAvailableProperties();
        emit(state.copyWith(
            properties: properties, selectedProperty: properties[0]));
      } catch (e) {
        print('error getting proprties');
      }
    });

    on<SelectPropertyEvent>((event, emit) {
      emit(state.copyWith(selectedProperty: event.selectedProperty));
    });
  }
}
