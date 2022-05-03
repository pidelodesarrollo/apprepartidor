class Menu {
  List<Catalogo> catalogos = new List();

  Menu.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((item) {
      final catalogo = Catalogo.fromJsonMap(item);
      catalogos.add(catalogo);
    });
  }
}

class Catalogo {
  String idarticulos;
  String idproveedor;
  String tipo;
  String nombre;
  String descripcion;
  String modificador;
  String iconoarticulo;
  String imagenarticulo;
  String precio;
  String cantidad;
  String vigente;

  Catalogo({
    this.idarticulos,
    this.idproveedor,
    this.nombre,
    this.tipo,
    this.descripcion,
    this.modificador,
    this.iconoarticulo,
    this.imagenarticulo,
    this.precio,
    this.cantidad,
    this.vigente,
  });

  Catalogo.fromJsonMap(Map<String, dynamic> json) {
    idarticulos = json['idarticulos'];
    idproveedor = json['idproveedor'];
    nombre = json['nombre'];
    tipo = json['tipo'];
    descripcion = json['descripcion'];
    modificador = json['modificador'];
    iconoarticulo = json['iconoarticulo'];
    imagenarticulo = json['imagenarticulo'];
    precio = json['precio'];
    cantidad = json['cantidad'];
    vigente = json['vigente'];
  }
  getIconoArticulo() {
    if (iconoarticulo == null) {
      return 'https://icon-library.com/images/no-image-available-icon/no-image-available-icon-7.jpg';
    } else {
      return 'http://recursos.pideloyaa.com/img/articulos/$iconoarticulo';
    }
  }
}
