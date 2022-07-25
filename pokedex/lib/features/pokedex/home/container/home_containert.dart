import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/pokedex/details/container/detail_container.dart';
import 'package:pokedex/shared/errors/failiure.dart';
import 'package:pokedex/shared/repo/pokemon_repository.dart';

import '../../../../shared/models/pokemon.dart';
import '../../../../shared/widgets/poke_error_widget.dart';
import '../blocs/generation/generation_bloc.dart';
import '../pages/home_page.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({
    super.key,
    required this.onPokeTap,
    required this.repo,
  });
  final Function(String, DetailArguments) onPokeTap;
  final IPokemonRepository repo;

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  late GenerationBloc bloc;
  Future<List<Pokemon>> at(IPokemonRepository repo) async => repo.getAllPkm();
  @override
  void initState() {
    super.initState();
    // at(widget.repo);
    bloc = GenerationBloc();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerationBloc, GenerationState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is GenerationInitialState) {
            bloc.add(const AllGenerationEvent());
          }
          if (state is GenerationSuccessState && state.pokemons!.isNotEmpty) {
            return BlocBuilder<GenerationBloc, GenerationState>(
              bloc: bloc,
              builder: (context, state) {
                return HomePage(
                  onPokeTap: widget.onPokeTap,
                  bloc: bloc,
                  list: bloc.state.pokemons!,
                );
              },
            );
          }

          if (state is GenerationErrorState) {
            return PokeErrorWidget(
              errorMessage: (state as Failiure).message!,
            );
          }
          return Container();
        });
  }
}
