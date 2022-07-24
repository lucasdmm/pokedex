import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/home/pages/widgets/title_search_bar_widget.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSize {
  const HomeAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const TitleSearchBarWidget(),
      actions: [
        InkWell(
          onTap: () {},
          child: Image.asset('images/pokedex_icon.png', scale: 1),
        )
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
