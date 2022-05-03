import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

class _MenuAyudaProvider {
  List<dynamic> opciones = [];

  _MenuAyudaProvider() {
    //cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_ayuda.json');

    Map dataMap = json.decode(resp);
    opciones = dataMap['rutas'];

    return opciones;
  }
}

final menuAyudaProvider = new _MenuAyudaProvider();
