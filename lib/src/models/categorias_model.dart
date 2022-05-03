class Categorias {
  List<Categoria> categorias = new List();

  Categorias();

  Categorias.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final categoria = new Categoria.fromJsonMap(item);
      categorias.add(categoria);
    }
  }
}

class Categoria {
  String idmenu;
  String descripcion;
  String idnegocio;
  String img;
  String icono;
  String vigente;

  Categoria({
    this.idmenu,
    this.descripcion,
    this.idnegocio,
    this.img,
    this.icono,
    this.vigente,
  });

  Categoria.fromJsonMap(Map<String, dynamic> json) {
    idmenu = json['idmenu'];
    descripcion = json['descripcion'];
    idnegocio = json['idnegocio'];
    descripcion = json['descripcion'];
    img = json['img'];
    icono = json['icono'];
    vigente = json['vigente'];
  }

  getIconoCategoria() {
    if (icono == null) {
      return 'https://icon-library.com/images/no-image-available-icon/no-image-available-icon-7.jpg';
    } else {
      return 'http://recursos.pideloyaa.com/img/articulos/$icono';
    }
  }
}
