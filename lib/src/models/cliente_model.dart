// To parse this JSON data, do
//
//     final clienteModel = clienteModelFromJson(jsonString);

import 'dart:convert';

ClienteModel clienteModelFromJson(String str) =>
    ClienteModel.fromJson(json.decode(str));

String clienteModelToJson(ClienteModel data) => json.encode(data.toJson());

class ClienteModel {
  ClienteModel({
    this.idcliente,
    this.nombre = 'Pendiente',
    this.apePat = 'Pendiente',
    this.apeMat,
    this.correo = 'micorreo@gmail.com',
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
    this.metodopago = true,
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
  bool metodopago;

  factory ClienteModel.fromJson(Map<String, dynamic> json) => ClienteModel(
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
        metodopago: json["metodopago"],
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
        "metodopago": metodopago,
      };
}
