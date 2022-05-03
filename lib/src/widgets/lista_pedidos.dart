//import 'package:audioplayers/audio_cache.dart';
//import 'package:audioplayers/audioplayers.dart';
import 'package:negocioapp/src/models/historial_model.dart';
import 'package:flutter/material.dart';
import 'package:negocioapp/src/providers/usuario_provider.dart';

class ListaPedidos extends StatefulWidget {
  final List<Historial> historiales;

  const ListaPedidos({this.historiales});

  @override
  _ListaPedidosState createState() => _ListaPedidosState();
}

class _ListaPedidosState extends State<ListaPedidos> {
  //AudioPlayer advancedPlayer;

/*   @override
  initState() {
    super.initState();
    loadMusic();
    //dispose();
  }

  Future loadMusic() async {
    advancedPlayer = await AudioCache().play("audio/campana.mp3");
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    /*  if (this.widget.historiales.length >= 1) {
      Future loadMusic() async {
        advancedPlayer = await AudioCache().play("audio/campana.mp3");
      }

      loadMusic();
    } */

    return ListView.builder(
        itemCount: this.widget.historiales.length,
        itemBuilder: (BuildContext context, int index) {
          return _Pedido(
              historial: this.widget.historiales[index], index: index);
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
          //Divider(),
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
              style: TextStyle(fontSize: 16))
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
          Text('Pedido de: ${historial.girodenegocio} ',
              style: TextStyle(fontSize: 16)),
          Text('  Status:  '),
          Text(historial.estado,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
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
              style: TextStyle(fontSize: 16)),
          // Text('  Status:  '),
          // Text(historial.estado,
          //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
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
                'A Preparar',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightGreen,
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              onPressed: () {
                final usuario = new UsuarioProvider();

                usuario.pedidoPreparacion(historial.idpedidos);
                Navigator.pushNamed(context, 'home');
              }),
        ],
      ),
    );
  }
}

/* 
import 'package:negocioapp/src/models/historial_model.dart';
import 'package:flutter/material.dart';
import 'package:negocioapp/src/providers/usuario_provider.dart';

class ListaPedidos extends StatelessWidget {
  final List<Historial> historiales;

  const ListaPedidos({this.historiales});

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
          //Divider(),
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
              style: TextStyle(fontSize: 16))
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
          Text('Pedido de: ${historial.girodenegocio} ',
              style: TextStyle(fontSize: 16)),
          Text('  Status:  '),
          Text(historial.estado,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
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
              style: TextStyle(fontSize: 16)),
          // Text('  Status:  '),
          // Text(historial.estado,
          //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
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
                'A Preparar',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightGreen,
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              onPressed: () {
                final usuario = new UsuarioProvider();

                usuario.pedidoPreparacion(historial.idpedidos);
                Navigator.pushNamed(context, 'home');
              }),
        ],
      ),
    );
  }
} */
