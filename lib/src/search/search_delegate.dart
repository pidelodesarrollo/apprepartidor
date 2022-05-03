import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Mi busques es..';

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de  nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la Izquierda del appbar

    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a buscar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // son las sugerencias que aparecen cuando la persona escribe
    return Container();
  }
}
