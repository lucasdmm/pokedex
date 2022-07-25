import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../shared/models/pokemon.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final List<Pokemon> list;
  FilterBloc({required this.list}) : super(FilterInitialState()) {
    on<FilterLoadEvent>((event, emit) {
      emit(FilterSuccessState(list: list));
    });

    on<TextFilterUpdatedEvent>((event, emit) async {
      emit(FilterSuccessState(
          list: list
              .where((pkm) => pkm.name.contains(event.query.toLowerCase()))
              .toList()));
    });
  }
}
