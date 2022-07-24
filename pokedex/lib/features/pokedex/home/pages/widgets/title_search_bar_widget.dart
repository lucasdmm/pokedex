import 'package:flutter/material.dart';

class TitleSearchBarWidget extends StatefulWidget {
  const TitleSearchBarWidget({Key? key}) : super(key: key);

  @override
  State<TitleSearchBarWidget> createState() => _TitleSearchBarWidgetState();
}

class _TitleSearchBarWidgetState extends State<TitleSearchBarWidget> {
  bool _shouldSwitch = false;
  Widget shwitch() {
    if (_shouldSwitch) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 40,
            width: 170,
            child: TextField(
              maxLines: 1,
              onChanged: (value) {},
              decoration: InputDecoration(
                  hintTextDirection: TextDirection.ltr,
                  suffixIcon: IconButton(
                      splashRadius: 15,
                      onPressed: () => setState(() {
                            _shouldSwitch = false;
                            //_isVisible = true;
                          }),
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                      )),
                  hintText: 'Filter',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
        ],
      );
    } else {
      return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        const Text(
          'Pokedex',
          style: TextStyle(color: Colors.black, fontSize: 26),
        ),
        IconButton(
            onPressed: () => setState(() => _shouldSwitch = true),
            iconSize: 40,
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            )),
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: shwitch(),
    );
  }
}
