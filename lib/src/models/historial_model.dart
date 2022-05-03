class Historiales {
  List<Historial> historiales = new List();

  Historiales();

  Historiales.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final historial = new Historial.fromJsonMap(item);
      historiales.add(historial);
    }
  }
}

class Historial {
  String idproveedores;
  String razonsocial;
  String gironegocio;
  String nombre;
  String apepat;
  String apemat;
  String telefono;
  String correo;
  String passwordo;
  DateTime profechacre;
  String calle;
  String numero;
  String colonia;
  String cp;
  String alcaldiamunicipio;
  String entidad;
  String ciudad;
  String icononegocio;
  String activo;
  String descripcion;
  String idpedidos;
  DateTime fechaped;
  String idcliente;
  String correcliente;
  String idproveedor;
  String correoprov;
  String cantidad;
  String entrega;
  String importe;
  String idarticulos;
  String estado;
  String vigente;
  String girodenegocio;
  String piderepartidor;

  Historial({
    this.idproveedores,
    this.gironegocio,
    this.nombre,
    this.apepat,
    this.apemat,
    this.telefono,
    this.correo,
    this.passwordo,
    this.profechacre,
    this.calle,
    this.numero,
    this.colonia,
    this.cp,
    this.alcaldiamunicipio,
    this.entidad,
    this.ciudad,
    this.icononegocio,
    this.activo,
    this.descripcion,
    this.idpedidos,
    this.fechaped,
    this.idcliente,
    this.correcliente,
    this.idproveedor,
    this.correoprov,
    this.cantidad,
    this.entrega,
    this.importe,
    this.idarticulos,
    this.estado,
    this.vigente,
    this.girodenegocio,
    this.piderepartidor,
  });

  Historial.fromJsonMap(Map<String, dynamic> json) {
    idproveedores = json["idproveedores"];
    razonsocial = json["razonsocial"];
    gironegocio = json["gironegocio"];
    nombre = json["nombre"];
    apepat = json["apepat"];
    apemat = json["apemat"];
    telefono = json["telefono"];
    correo = json["correo"];
    passwordo = json["passwordo"];
    profechacre = DateTime.parse(json["profechacre"]);
    calle = json["calle"];
    numero = json["numero"];
    colonia = json["colonia"];
    cp = json["cp"];
    alcaldiamunicipio = json["alcaldiamunicipio"];
    entidad = json["entidad"];
    ciudad = json["ciudad"];
    icononegocio = json["icononegocio"];
    activo = json["activo"];
    descripcion = json["descripcion"];
    idpedidos = json["idpedidos"];
    fechaped = DateTime.parse(json["fechaped"]);
    idcliente = json["idcliente"];
    correcliente = json["correcliente"];
    idproveedor = json["idproveedor"];
    correoprov = json["correoprov"];
    cantidad = json["cantidad"];
    entrega = json["entrega"];
    importe = json["importe"];
    idarticulos = json["idarticulos"];
    estado = json["estado"];
    vigente = json["vigente"];
    girodenegocio = json["girodenegocio"];
    piderepartidor = json["piderepartidor"];
  }
}
