part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {}

class FilterLoadEvent extends FilterEvent {
  FilterLoadEvent({required this.filter});
  String filter;

  @override
  List<Object?> get props => [];
}

class GenerationFilterUpdatedEvent extends FilterEvent {
  GenerationFilterUpdatedEvent({required this.genarationFilter});
  final GenerationFilter genarationFilter;

  @override
  List<Object?> get props => [genarationFilter];
}

class TextFilterUpdatedEvent extends FilterEvent {
  TextFilterUpdatedEvent({required this.query});
  final TextFilter query;

  @override
  List<Object?> get props => [query];
}
