import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:negocioapp/src/models/pedidos_models.dart';

import 'package:http/http.dart' as http;

class ConsultaPedidos with ChangeNotifier {
  // ignore: non_constant_identifier_names
  final _URL = 'https://apirestful.pideloyaa.com/';
  //final _APIKEY = "12345678";

  List<PedidoscanceladoElement> pedidos = [];

  ConsultaPedidos() {
    this.getPedidosNuevosSi('1');
  }

  getPedidosNuevosSi(String idcliente) async {
    final url = '$_URL/pidalocliente/pedidosxcliente/$idcliente';
    final resp = await http.get(url, headers: {"X-API-KEY": "12345678"});

    final consultaPedido = pedidosFromJson(resp.body);

    this.pedidos.addAll(consultaPedido.pedidosentregados);
    notifyListeners();
  }

  getPedidosEntregados(String email) async {
    final authData = {'correo': email};
    print(authData);

    final url = '$_URL/pidalocliente/pedidosxclientes';
    final resp = await http.post(url,
        body: json.encode(authData),
        headers: {"X-API-KEY": "12345678", "Content-type": "application/json"});

    final consultaPedido = pedidosFromJson(resp.body);

    this.pedidos.addAll(consultaPedido.pedidosentregados);
    notifyListeners();
  }
}
