class ImportePedido {
  List<Importe> importes = new List();

  ImportePedido();

  ImportePedido.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((item) {
      final importe = Importe.fromJsonMap(item);
      importes.add(importe);
    });
  }
/* 
  ImportePedido.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final importe = new Importe.fromJsonMap(item);
      importes.add(importe);
    }
  } */
}

class Importe {
  String importe;

  Importe({
    this.importe,
  });

  Importe.fromJsonMap(Map<String, dynamic> json) {
    importe = json['importe'];
  }
}
