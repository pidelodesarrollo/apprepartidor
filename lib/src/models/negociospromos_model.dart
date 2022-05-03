class Negocios {
  List<Negocio> items = new List();

  Negocios();

  Negocios.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final negocio = new Negocio.fromJsonMap(item);
      items.add(negocio);
    }
  }
}

class Negocio {
  String idnegocios;
  String razonSocial;
  String correoprov;
  String giroNegocio;
  String descripcion;
  String iconoNegocio;
  String valoracion;
  String vigente;
  String categoriaprincipal;
  String latitud;
  String longitud;
  String horario;
  String idarticulos;
  String idproveedor;
  String tipo;
  String nombre;
  String descripcionart;
  String iconoarticulo;
  String imagenarticulo;
  String precio;
  String cantidad;
  String vigenteart;

  Negocio({
    this.idnegocios,
    this.razonSocial,
    this.correoprov,
    this.giroNegocio,
    this.descripcion,
    this.iconoNegocio,
    this.valoracion,
    this.vigente,
    this.categoriaprincipal,
    this.latitud,
    this.longitud,
    this.horario,
    this.idarticulos,
    this.idproveedor,
    this.nombre,
    this.tipo,
    this.descripcionart,
    this.iconoarticulo,
    this.imagenarticulo,
    this.precio,
    this.cantidad,
    this.vigenteart,
  });

  Negocio.fromJsonMap(Map<String, dynamic> json) {
    idnegocios = json['idnegocios'];
    razonSocial = json['razon_social'];
    correoprov = json['correoprov'];
    giroNegocio = json['giro_negocio'];
    descripcion = json['descripcion'];
    iconoNegocio = json['icono_negocio'];
    valoracion = json['valoracion'];
    vigente = json['vigente'];
    categoriaprincipal = json[categoriaprincipal];
    latitud = json['latitud'];
    longitud = json['longitud'];
    horario = json['horario'];
    idarticulos = json['idarticulos'];
    idproveedor = json['idproveedor'];
    nombre = json['nombre'];
    tipo = json['tipo'];
    descripcionart = json['descripcionart'];
    iconoarticulo = json['iconoarticulo'];
    imagenarticulo = json['imagenarticulo'];
    precio = json['precio'];
    cantidad = json['cantidad'];
    vigenteart = json['vigenteart'];
  }

  getIconoNegocio() {
    if (iconoNegocio == null) {
      return 'https://icon-library.com/images/no-image-available-icon/no-image-available-icon-7.jpg';
    } else {
      return 'http://recursos.pideloyaa.com/img/negocios/$iconoNegocio';
    }
  }

  getIconoArticulo() {
    if (iconoarticulo == null) {
      return 'https://icon-library.com/images/no-image-available-icon/no-image-available-icon-7.jpg';
    } else {
      return 'http://recursos.pideloyaa.com/img/articulos/$iconoarticulo';
    }
  }
}
