import 'package:negocioapp/src/models/productos_model.dart';

import 'package:flutter/material.dart';

class ListaArtPedido extends StatelessWidget {
  final List<Articulo> articulos;

  const ListaArtPedido({@required this.articulos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.articulos.length,
      itemBuilder: (BuildContext context, int index) {
        return _Articulo(articulos: this.articulos[index], index: index);
      },
    );
  }
}

class _Articulo extends StatelessWidget {
  final Articulo articulos;
  final int index;

  const _Articulo({@required this.articulos, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        _TarjetaArticulo(articulos, index),
        SizedBox(height: 10),
        // _TarjetaContenido(articulos, index),
        Divider(),
      ],
    );
  }
}

class _TarjetaArticulo extends StatelessWidget {
  final Articulo articulos;
  final int index;

  const _TarjetaArticulo(this.articulos, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 2),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('${index + 1}.  ',
                    style: TextStyle(color: Colors.lightGreen, fontSize: 15)),
                //Text('  Nombre: ', style: TextStyle(fontSize: 16)),
                Text(articulos.nombre,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Text('Detalles: ${articulos.detalle}  ',
                    style: TextStyle(fontSize: 15)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Text('Extras: ${articulos.extra}  ',
                    style: TextStyle(fontSize: 15)),
              ],
            ),
          ],
        ));
  }
}
