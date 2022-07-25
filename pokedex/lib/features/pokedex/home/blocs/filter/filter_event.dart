part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {}

class FilterLoadEvent extends FilterEvent {
  @override
  List<Object?> get props => [];
}

class FilterLoadGenerationEvent extends FilterEvent {
  @override
  List<Object?> get props => [];
}

class TextFilterUpdatedEvent extends FilterEvent {
  TextFilterUpdatedEvent(
      {required this.query, required this.list, this.generation});
  final String query;
  final List<Pokemon> list;
  final String? generation;

  @override
  List<Object?> get props => [query, list, generation];
}

class FilterErrorEvent extends FilterEvent {
  FilterErrorEvent({required this.errorMessage});
  final String errorMessage;

  @override
  List<Object?> get props => throw UnimplementedError();
}
