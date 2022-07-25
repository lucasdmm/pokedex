import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/pokedex/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/home/blocs/filter/filter_bloc.dart';
import 'package:pokedex/features/pokedex/home/container/poke_container.dart';
import 'package:pokedex/features/pokedex/home/pages/widgets/home_app_bar_widget.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/repo/pokemon_repository.dart';
import 'package:pokedex/shared/widgets/pokeball_rotate_widget.dart';

import '../blocs/generation/generation_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {Key? key,
      required this.onPokeTap,
      required this.bloc,
      required this.list})
      : super(key: key);
  final Function(String, DetailArguments) onPokeTap;
  final GenerationBloc bloc;
  final List<Pokemon> list;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final FilterBloc bloc;
  late List<Pokemon> list;
  @override
  void initState() {
    super.initState();
    list = widget.list;
    bloc = FilterBloc(list: list);
    bloc.add(FilterLoadEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Colors.white,
      ),
      Positioned(
        top: 30,
        left: 15,
        child: PokeballRotateWidget(
          child: Image.asset(
            'images/pkbc.png',
            scale: 2.5,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: HomeAppBarWidget(
          bloc: bloc,
          generation: widget.bloc,
        ),
        body: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 35),
            child: BlocBuilder<FilterBloc, FilterState>(
              bloc: bloc,
              builder: (context, state) {
                if (bloc.state is FilterInitialState) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (bloc.state is FilterSuccessState &&
                    bloc.state.pokemons.isNotEmpty) {
                  return GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: widget.list
                        .map((pk) => PokeContainer(
                            repo: PokemonRepository(dio: Dio()),
                            pokemon: pk,
                            onPokeTap: widget.onPokeTap))
                        .toList(),
                  );
                } else {
                  return const Center(
                    child: Text('Não foi possível encontrar sua busca.'),
                  );
                }
              },
            )),
      ),
    ]);
  }
}
