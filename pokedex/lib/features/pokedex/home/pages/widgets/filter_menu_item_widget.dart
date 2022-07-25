import 'package:flutter/material.dart';

import '../../../../../shared/data/filter_menu_items.dart';
import '../../../../../shared/models/filter_item.dart';
import '../../../../../shared/util/util_method.dart';
import '../../blocs/generation/generation_bloc.dart';

class FilterMenuItemWidget extends StatefulWidget {
  const FilterMenuItemWidget({Key? key, required this.generation})
      : super(key: key);
  final GenerationBloc generation;

  @override
  State<FilterMenuItemWidget> createState() => _FilterMenuItemWidgetState();
}

class _FilterMenuItemWidgetState extends State<FilterMenuItemWidget> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<FilterItem>(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Image.asset('images/pokedex_icon.png', scale: 1),
        itemBuilder: (context) {
          List<Widget> list = FilterMenuItems.filterItems
              .map((e) => PopupMenuItem<FilterItem>(
                  onTap: () => setState(() => widget.generation
                      .add(GenerationLoadEvent(generation: e.value))),
                  value: e,
                  child: SizedBox(
                    width: 160,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(e.image, scale: 15),
                        Text(
                          UtilMethod.upCaseFirstLetter(text: e.text),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  )))
              .toList();
          list.add(PopupMenuItem<FilterItem>(
              onTap: () => setState(
                  () => widget.generation.add(const AllGenerationEvent())),
              value: FilterMenuItems.allGenerations,
              child: SizedBox(
                height: 69,
                width: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(children: [
                      Image.asset(FilterMenuItems.allGenerations.image,
                          scale: 15),
                      Positioned(
                        right: 5,
                        bottom: 5,
                        child: Image.asset(FilterMenuItems.allGenerations.image,
                            scale: 15),
                      ),
                    ]),
                    Text(
                      UtilMethod.upCaseFirstLetter(
                          text: FilterMenuItems.allGenerations.text),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )));
          return list as List<PopupMenuItem<FilterItem>>;
        });
  }
}
