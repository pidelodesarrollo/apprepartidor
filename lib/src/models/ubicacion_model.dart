// To parse this JSON data, do
//
//     final ubicacionModel = ubicacionModelFromJson(jsonString);

import 'dart:convert';

UbicacionModel ubicacionModelFromJson(String str) =>
    UbicacionModel.fromJson(json.decode(str));

String ubicacionModelToJson(UbicacionModel data) => json.encode(data.toJson());

class UbicacionModel {
  UbicacionModel({
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
    this.metodopago,
    this.ubicacion,
    this.latitud,
    this.longitud,
    this.entrecalles,
  });

  String idcliente;
  String nombre;
  String apePat;
  String apeMat;
  String correo;
  String password;
  String telefono;
  String fechaCreacion;
  String calle;
  String numero;
  String colonia;
  String cp;
  String alcaldiamunicipio;
  String entidad;
  String ciudad;
  String status;
  String metodopago;
  String ubicacion;
  String latitud;
  String longitud;
  String entrecalles;

  factory UbicacionModel.fromJson(Map<String, dynamic> json) => UbicacionModel(
        idcliente: json["idcliente"],
        nombre: json["nombre"],
        apePat: json["ape_pat"],
        apeMat: json["ape_mat"],
        correo: json["correo"],
        password: json["password"],
        telefono: json["telefono"],
        fechaCreacion: json["fecha_creacion"],
        calle: json["calle"],
        numero: json["numero"],
        colonia: json["colonia"],
        cp: json["cp"],
        alcaldiamunicipio: json["alcaldiamunicipio"],
        entidad: json["entidad"],
        ciudad: json["ciudad"],
        status: json["status"],
        metodopago: json["metodopago"],
        ubicacion: json["ubicacion"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        entrecalles: json["entrecalles"],
      );

  Map<String, dynamic> toJson() => {
        "idcliente": idcliente,
        "nombre": nombre,
        "ape_pat": apePat,
        "ape_mat": apeMat,
        "correo": correo,
        "password": password,
        "telefono": telefono,
        "fecha_creacion": fechaCreacion,
        "calle": calle,
        "numero": numero,
        "colonia": colonia,
        "cp": cp,
        "alcaldiamunicipio": alcaldiamunicipio,
        "entidad": entidad,
        "ciudad": ciudad,
        "status": status,
        "metodopago": metodopago,
        "ubicacion": ubicacion,
        "latitud": latitud,
        "longitud": longitud,
        "entrecalles": entrecalles,
      };
}
