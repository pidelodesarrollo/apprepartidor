class ArticulosPedido {
  List<Articulo> articulos = new List();

  ArticulosPedido();

  ArticulosPedido.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final articulo = new Articulo.fromJsonMap(item);
      articulos.add(articulo);
    }
  }
}

class Articulo {
  String idproductos;
  String idproveedor;
  String pedido;
  String usuario;
  String nombre;
  String precio;
  String cantidad;
  String detalle;
  String extra;

  Articulo({
    this.idproductos,
    this.idproveedor,
    this.pedido,
    this.usuario,
    this.nombre,
    this.precio,
    this.cantidad,
    this.detalle,
    this.extra,
  });

  Articulo.fromJsonMap(Map<String, dynamic> json) {
    idproductos = json['idproductos'];
    idproveedor = json['idproveedor'];
    pedido = json['pedido'];
    nombre = json['nombre'];
    precio = json['precio'];
    cantidad = json['cantidad'];
    detalle = json['detalle'];
    extra = json['extra'];
  }
}
