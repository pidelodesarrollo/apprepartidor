// To parse this JSON data, do
//
//     final pedidos = pedidosFromJson(jsonString);

import 'dart:convert';

Pedidos pedidosFromJson(String str) => Pedidos.fromJson(json.decode(str));

String pedidosToJson(Pedidos data) => json.encode(data.toJson());

class Pedidos {
  Pedidos({
    this.err,
    this.mensaje,
    this.infoCliente,
    this.pedidosnuevosNo,
    this.pedidosnuevosSi,
    this.pedidosentregados,
    this.pedidoscancelados,
  });

  bool err;
  String mensaje;
  InfoCliente infoCliente;
  List<PedidoscanceladoElement> pedidosnuevosNo;
  List<PedidoscanceladoElement> pedidosnuevosSi;
  List<PedidoscanceladoElement> pedidosentregados;
  List<PedidoscanceladoElement> pedidoscancelados;

  factory Pedidos.fromJson(Map<String, dynamic> json) => Pedidos(
        err: json["err"],
        mensaje: json["mensaje"],
        infoCliente: InfoCliente.fromJson(json["info_cliente"]),
        pedidosnuevosNo: List<PedidoscanceladoElement>.from(
            json["pedidosnuevos_no"]
                .map((x) => PedidoscanceladoElement.fromJson(x))),
        pedidosnuevosSi: List<PedidoscanceladoElement>.from(
            json["pedidosnuevos_si"]
                .map((x) => PedidoscanceladoElement.fromJson(x))),
        pedidosentregados: List<PedidoscanceladoElement>.from(
            json["pedidosentregados"]
                .map((x) => PedidoscanceladoElement.fromJson(x))),
        pedidoscancelados: List<PedidoscanceladoElement>.from(
            json["pedidoscancelados"]
                .map((x) => PedidoscanceladoElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "err": err,
        "mensaje": mensaje,
        "info_cliente": infoCliente.toJson(),
        "pedidosnuevos_no":
            List<dynamic>.from(pedidosnuevosNo.map((x) => x.toJson())),
        "pedidosnuevos_si":
            List<dynamic>.from(pedidosnuevosSi.map((x) => x.toJson())),
        "pedidosentregados":
            List<dynamic>.from(pedidosentregados.map((x) => x.toJson())),
        "pedidoscancelados":
            List<dynamic>.from(pedidoscancelados.map((x) => x.toJson())),
      };
}

class InfoCliente {
  InfoCliente({
    this.idcliente,
    this.nombre,
    this.apePat,
    this.apeMat,
    this.correo,
    this.password,
    this.telefono,
    this.fechaCreacion,
    this.calle,
    this.numero,
    this.colonia,
    this.cp,
    this.alcaldiamunicipio,
    this.entidad,
    this.ciudad,
    this.status,
  });

  String idcliente;
  String nombre;
  String apePat;
  String apeMat;
  String correo;
  String password;
  String telefono;
  DateTime fechaCreacion;
  String calle;
  String numero;
  String colonia;
  String cp;
  String alcaldiamunicipio;
  String entidad;
  String ciudad;
  String status;

  factory InfoCliente.fromJson(Map<String, dynamic> json) => InfoCliente(
        idcliente: json["idcliente"],
        nombre: json["nombre"],
        apePat: json["ape_pat"],
        apeMat: json["ape_mat"],
        correo: json["correo"],
        password: json["password"],
        telefono: json["telefono"],
        fechaCreacion: DateTime.parse(json["fecha_creacion"]),
        calle: json["calle"],
        numero: json["numero"],
        colonia: json["colonia"],
        cp: json["cp"],
        alcaldiamunicipio: json["alcaldiamunicipio"],
        entidad: json["entidad"],
        ciudad: json["ciudad"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "idcliente": idcliente,
        "nombre": nombre,
        "ape_pat": apePat,
        "ape_mat": apeMat,
        "correo": correo,
        "password": password,
        "telefono": telefono,
        "fecha_creacion": fechaCreacion.toIso8601String(),
        "calle": calle,
        "numero": numero,
        "colonia": colonia,
        "cp": cp,
        "alcaldiamunicipio": alcaldiamunicipio,
        "entidad": entidad,
        "ciudad": ciudad,
        "status": status,
      };
}

class PedidoscanceladoElement {
  PedidoscanceladoElement({
    this.idpedidos,
    this.fechaped,
    this.idcliente,
    this.idproveedor,
    this.importe,
    this.idarticulos,
    this.estado,
    this.vigente,
    this.girodenegocio,
  });

  String idpedidos;
  DateTime fechaped;
  String idcliente;
  String idproveedor;
  String importe;
  String idarticulos;
  String estado;
  String vigente;
  String girodenegocio;

  factory PedidoscanceladoElement.fromJson(Map<String, dynamic> json) =>
      PedidoscanceladoElement(
        idpedidos: json["idpedidos"],
        fechaped: DateTime.parse(json["fechaped"]),
        idcliente: json["idcliente"],
        idproveedor: json["idproveedor"],
        importe: json["importe"],
        idarticulos: json["idarticulos"],
        estado: json["estado"],
        vigente: json["vigente"],
        girodenegocio: json["girodenegocio"],
      );

  Map<String, dynamic> toJson() => {
        "idpedidos": idpedidos,
        "fechaped": fechaped.toIso8601String(),
        "idcliente": idcliente,
        "idproveedor": idproveedor,
        "importe": importe,
        "idarticulos": idarticulos,
        "estado": estado,
        "vigente": vigente,
        "girodenegocio": girodenegocio,
      };
}
