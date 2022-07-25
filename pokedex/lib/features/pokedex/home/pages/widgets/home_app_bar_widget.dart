import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/home/blocs/filter/filter_bloc.dart';
import 'package:pokedex/features/pokedex/home/pages/widgets/filter_menu_item_widget.dart';
import 'package:pokedex/features/pokedex/home/pages/widgets/title_search_bar_widget.dart';

import '../../blocs/generation/generation_bloc.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSize {
  const HomeAppBarWidget(
      {Key? key, required this.bloc, required this.generation})
      : super(key: key);
  final FilterBloc bloc;
  final GenerationBloc generation;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: TitleSearchBarWidget(
        bloc: bloc,
      ),
      actions: [FilterMenuItemWidget(generation: generation)],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
