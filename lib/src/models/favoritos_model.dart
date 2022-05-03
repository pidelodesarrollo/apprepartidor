class Favoritos {
  List<Favorito> favoritos = new List();

  Favoritos();

  Favoritos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final favorito = new Favorito.fromJsonMap(item);
      favoritos.add(favorito);
    }
  }
}

class Favorito {
  String idfavoritos;
  String idcliente;
  DateTime fechaguardado;
  String agregado;
  String idnegocios;
  String razonSocial;
  String giroNegocio;

  Favorito({
    this.idfavoritos,
    this.idcliente,
    this.fechaguardado,
    this.agregado,
    this.idnegocios,
    this.razonSocial,
    this.giroNegocio,
  });

  Favorito.fromJsonMap(Map<String, dynamic> json) {
    idfavoritos = json['idfavoritos'];
    idcliente = json['idcliente'];
    fechaguardado = DateTime.parse(json["fechaguardado"]);
    agregado = json['agregado'];
    idnegocios = json['idnegocios'];
    razonSocial = json['razon_social'];
    giroNegocio = json['giro_negocio'];
  }
}
