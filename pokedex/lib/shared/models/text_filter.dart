// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TextFilter extends Equatable {
  const TextFilter({required this.query});

  final String query;

  TextFilter copyWith({
    String? query,
  }) {
    return TextFilter(
      query: query ?? this.query,
    );
  }

  @override
  List<Object?> get props => [query];
}
