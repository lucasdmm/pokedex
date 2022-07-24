// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:pokedex/shared/models/generation.dart';

class GenerationFilter extends Equatable {
  const GenerationFilter({required this.generation, required this.isActive});

  final Generation generation;
  final bool isActive;

  GenerationFilter copyWith({
    Generation? generation,
    bool? isActive,
  }) {
    return GenerationFilter(
      generation: generation ?? this.generation,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object?> get props => [generation, isActive];
}
