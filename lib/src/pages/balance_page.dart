import 'package:flutter/material.dart';
import 'package:negocioapp/src/blocs/provider.dart';
import 'package:negocioapp/src/providers/usuario_provider.dart';
import 'package:negocioapp/src/widgets/venta_7_dias_atras.dart';

import 'dart:math';
import 'dart:ui';

import 'package:negocioapp/src/widgets/venta_del_dia.dart';

class BalancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = ProviderBloc.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Mi balance'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamed(context, 'home');
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          _fondoInicio(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _principal(bloc),
                SizedBox(height: 20),
                _venta_del_dia(bloc),
                SizedBox(height: 20),
                _venta_ultimos_7_dias(bloc),

                //  _descripcion(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _fondoInicio() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            Color.fromRGBO(255, 255, 255, 1.0),
            Color.fromRGBO(255, 255, 255, 1.0)
          ])),
    );

    final cajaVerde = Transform.rotate(
        angle: -pi / 0.5,
        child: Container(
          height: 60.0,
          width: 220.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(255, 255, 255, 1.0),
                Color.fromRGBO(255, 255, 255, 1.0)
              ])),
        ));

    return Stack(
      children: <Widget>[gradiente, Positioned(top: 40.0, child: cajaVerde)],
    );
  }

  Widget _principal(LoginBloc bloc) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 0, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /* Container(
              height: 60,
              child: Image.asset(
                "assets/icon/icononegro.png",
                width: 120.0,
              ),
            ), */
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Estimado Socio ',
                  style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Text('Esta es un sencillo balance de ventas',
                style: TextStyle(color: Colors.black, fontSize: 16.0)),
          ],
        ),
      ),
    );
  }

  /* Widget _descripcion() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              'Importante',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15.0),
            Text(
              'No olvides configurar tu ubicacion en Menú (Botón, arriba a la iquierda) -> Mi ubicación.',
              style: TextStyle(color: Colors.black, fontSize: 15.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              'En el barra de navegacion inferior encontraras tus pedidos nuevos, lo que envies  a preparacion y los que este para envio',
              style: TextStyle(color: Colors.black, fontSize: 15.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
 */

  Widget _venta_del_dia(LoginBloc bloc) {
    final usuarioProvider = new UsuarioProvider();

    return SizedBox(
      height: 30.0,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 15, top: 1, bottom: 1),
        child: FutureBuilder(
          future: usuarioProvider.getVentDelDia(bloc.email),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return VentaDelDia(importe: snapshot.data);
            } else {
              return Container(
                  height: 10.0,
                  child: Center(child: CircularProgressIndicator()));
            }
          },
        ),
      ),
    );
  }

  Widget _venta_ultimos_7_dias(LoginBloc bloc) {
    final usuarioProvider = new UsuarioProvider();

    return SizedBox(
      height: 30.0,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 15, top: 1, bottom: 1),
        child: FutureBuilder(
          future: usuarioProvider.getVentUltimos7Dias(bloc.email),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return Ventas7DiasAtras(importe: snapshot.data);
            } else {
              return Container(
                  height: 10.0,
                  child: Center(child: CircularProgressIndicator()));
            }
          },
        ),
      ),
    );
  }
}
