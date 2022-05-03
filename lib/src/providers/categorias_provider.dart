import 'package:negocioapp/src/models/articulos_model.dart';
import 'package:flutter/material.dart';
import 'package:negocioapp/src/models/categorias_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

//final _URL_CAT = 'apirestful.pideloyaa.com';

class CategoryService with ChangeNotifier {
  String _url = 'apirestful.pideloyaa.com';

  List<Categoria> categorias = [];

  String _selectedCategory = '';

  String _lugarSeleccionado = '';

  String _importePrecio = '0';

  CategoryService() {
    this.getCategoriasSeleccionada();
  }

  get selectedCategory => this._selectedCategory;

  set selectedCategory(String valor) {
    this._selectedCategory = valor;

    notifyListeners();
  }

  get lugarSeleccionado => this._lugarSeleccionado;

  set lugarSeleccionado(String valor) {
    this._lugarSeleccionado = valor;

    notifyListeners();
  }

  get importePrecio => this._importePrecio;

  set importePrecio(String valor) {
    this._importePrecio = valor;

    notifyListeners();
  }

  getCategoriasSeleccionada() {}

  Future<List<Categoria>> getCategorias(String idproveedor) async {
    final url = Uri.https(_url, 'detalleproveedor/menunegocio/$idproveedor');

    final resp = await http.get(url, headers: {"X-API-KEY": "12345678"});

    final decodedData = json.decode(resp.body);

    final categoria = new Categorias.fromJsonList(decodedData['menus']);

    return categoria.categorias;
  }

  Future<List<Articulo>> getArtxCategoria(String idproveedor) async {
    final authData = {'categoria': this.selectedCategory};

    final url = Uri.https(_url, 'detalleproveedor/articulosmenu/$idproveedor');

    final resp = await http.post(url,
        body: json.encode(authData),
        headers: {"X-API-KEY": "12345678", "Content-type": "application/json"});

    final decodedData = json.decode(resp.body);

    final menu = new Menu.fromJsonList(decodedData['articulos']);

    return menu.articulos;
  }
}
