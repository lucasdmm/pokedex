part of 'filter_bloc.dart';

abstract class FilterState extends Equatable {
  const FilterState();
  @override
  List<Object?> get props => [];
}

class FilterLoading extends FilterState {}

class FilterLoaded extends FilterState {
  const FilterLoaded({required this.filter});
  final Filter filter;
  @override
  List<Object?> get props => [filter];
}
