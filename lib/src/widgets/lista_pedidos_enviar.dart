import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:negocioapp/src/models/historial_model.dart';
import 'package:flutter/material.dart';
import 'package:negocioapp/src/providers/usuario_provider.dart';

class ListaPedidosParaEnviar extends StatelessWidget {
  final List<Historial> historiales;

  const ListaPedidosParaEnviar({this.historiales});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.historiales.length,
        itemBuilder: (BuildContext context, int index) {
          return _Pedido(historial: this.historiales[index], index: index);
        });
  }
}

class _Pedido extends StatelessWidget {
  final Historial historial;
  final int index;

  const _Pedido({@required this.historial, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          _TarjetaTopBar(historial, index),
          _TarjetaTitulo(historial),
          SizedBox(
            height: 10,
          ),
          _TarjetaImporte(historial),
          SizedBox(height: 10.0),
          _TarjetaBotones(historial),
          SizedBox(height: 10.0),
          _TarjetaBotonOk(historial),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Historial historial;
  final int index;

  const _TarjetaTopBar(this.historial, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text('${index + 1}.',
              style: TextStyle(color: Colors.lightGreen, fontSize: 18)),
          Text(
            'Fecha : ${historial.fechaped.day}/${historial.fechaped.month}/${historial.fechaped.year}',
            style: TextStyle(fontSize: 15),
          ),
          Text(
              '  Generado a las  ${historial.fechaped.hour}:${historial.fechaped.minute} hrs',
              style: TextStyle(fontSize: 15))
        ],
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Historial historial;

  const _TarjetaTitulo(this.historial);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text('Pedido # : ${historial.idpedidos} ',
              style: TextStyle(fontSize: 15)),
          Text('  Status:  '),
          Text(historial.estado,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _TarjetaImporte extends StatelessWidget {
  final Historial historial;

  const _TarjetaImporte(this.historial);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text('Importe: \$${historial.importe}   ',
              style: TextStyle(fontSize: 15)),
          // Text('  Status:  '),
          Text(' Id repartidor : ${historial.piderepartidor}',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  final Historial historial;

  const _TarjetaBotones(this.historial);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton.icon(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              label: Text('Ver articulos'),
              color: Colors.lightGreen,
              icon: Icon(Icons.remove_red_eye),
              onPressed: () {
                Navigator.pushNamed(context, 'articulosactivos',
                    arguments: historial);
              }),
          SizedBox(width: 30),
          RaisedButton.icon(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              label: Text('Datos Cliente'),
              color: Colors.lightBlue,
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.pushNamed(context, 'infocliente',
                    arguments: historial);
              })
        ],
      ),
    );
  }
}

class _TarjetaBotonOk extends StatelessWidget {
  final Historial historial;

  const _TarjetaBotonOk(this.historial);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton.icon(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              label: Text(
                '    Recoleccion   ',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightGreen,
              icon: Icon(
                FontAwesomeIcons.motorcycle,
                color: Colors.white,
              ),
              onPressed: () {
                final usuario = new UsuarioProvider();

                usuario.pedidoRecoleccion(
                    historial.idpedidos, historial.piderepartidor);
                Navigator.pushNamed(context, 'home');
              }),
        ],
      ),
    );
  }
}
