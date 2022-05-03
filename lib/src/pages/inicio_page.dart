import 'package:flutter/material.dart';
import 'package:negocioapp/src/blocs/provider.dart';
import 'package:negocioapp/src/preferencias_usuario/preferencias_usuario.dart';
//import 'package:negocioapp/src/providers/usuario_provider.dart';
//import 'package:negocioapp/src/widgets/importe_pedido.dart';

import 'dart:math';
import 'dart:ui';

import 'package:negocioapp/src/providers/usuario_provider.dart';
import 'package:negocioapp/src/widgets/datos_usuario_inicio.dart';

class InicioPage extends StatelessWidget {
  static final String routeName = 'inicio';
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = InicioPage.routeName;
    final bloc = ProviderBloc.of(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoInicio(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _principal(bloc),
                _descripcion(context),
                _usuarioId(bloc),
                //      _importe(bloc),
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
            Container(
              height: 60,
              child: Image.asset(
                "assets/icon/icononegro.png",
                width: 120.0,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Bienvenido Socio ',
                  style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Text('Esta es nuestra aplicación de ventas',
                style: TextStyle(color: Colors.black, fontSize: 16.0)),
          ],
        ),
      ),
    );
  }

  Widget _descripcion(BuildContext context) {
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
              'No olvides configurar tu ubicación en Menú (Botón, arriba a la izquierda) -> Mi ubicación.',
              style: TextStyle(color: Colors.black, fontSize: 15.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              'En el barra de navegación inferior encontraras tus pedidos nuevos, lo que envies  a preparación y los que esten listos para envío',
              style: TextStyle(color: Colors.black, fontSize: 15.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _usuarioId(LoginBloc bloc) {
    final usuarioProvider = new UsuarioProvider();

    //return Container();

    return SizedBox(
      height: 100.0,
      child: Container(
        margin: EdgeInsets.only(left: 1, right: 15, top: 1, bottom: 1),
        child: FutureBuilder(
          future: usuarioProvider.datosNegocio(bloc.email.toString()),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return DatosUsuarioInicio(infocliente: snapshot.data);
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

/* 
  Widget _importe(LoginBloc bloc) {
    final usuarioProvider = new UsuarioProvider();

    return SizedBox(
      height: 95.0,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 15, top: 1, bottom: 1),
        child: FutureBuilder(
          future: usuarioProvider.getImportPed(bloc.email),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return ImportePedido(importe: snapshot.data);
            } else {
              return Container(
                  height: 10.0,
                  child: Center(child: CircularProgressIndicator()));
            }
          },
        ),
      ),
    );
  } */

}
