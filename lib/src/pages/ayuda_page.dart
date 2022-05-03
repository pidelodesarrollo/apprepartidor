import 'package:negocioapp/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

import 'package:negocioapp/src/providers/menuayuda_provider.dart';

class AyudaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _lista(),
    );
  }

  Widget _lista() {
    return Card(
      child: FutureBuilder(
        future: menuAyudaProvider.cargarData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            children: _listaItems(snapshot.data, context),
          );
        },
      ),
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        subtitle: Text(opt['subtexto']),
        leading: geticon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.lightGreen),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
