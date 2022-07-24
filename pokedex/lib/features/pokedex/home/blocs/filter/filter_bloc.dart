import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/shared/models/generation_filter.dart';
import 'package:pokedex/shared/models/text_filter.dart';

import '../../../../../shared/models/filter.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterLoading()) {
    on<FilterEvent>((event, emit) {});
  }
}
