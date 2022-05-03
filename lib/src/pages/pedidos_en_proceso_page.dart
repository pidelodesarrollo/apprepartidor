import 'package:flutter/material.dart';
import 'package:negocioapp/src/blocs/provider.dart';
import 'package:negocioapp/src/providers/usuario_provider.dart';
import 'package:negocioapp/src/widgets/lista_pedidos_preparacion.dart';

class PedidosEnProcesoPage extends StatelessWidget {
  static final String routeName = 'pedidos_en_proceso';
  @override
  Widget build(BuildContext context) {
    final bloc = ProviderBloc.of(context);

    return Scaffold(
      body: Column(
        children: <Widget>[
          _encabezado(context),
          SizedBox(height: 10),
          Expanded(child: _listaPedidos(bloc))
        ],
      ),
    );
  }

  Widget _listaPedidos(LoginBloc bloc) {
    /*   return Container(
      child: Text('Pedidos ejemplo'),
    ); */

    final usuarioProvider = new UsuarioProvider();

    //return Container();

    return FutureBuilder(
      future: usuarioProvider.pedidosEnProceso(bloc.email),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return ListaPedidosEnPreparacion(historiales: snapshot.data);
        } else {
          return Center(
            child: Container(
                height: 10.0,
                child: Center(child: CircularProgressIndicator())),
          );
        }
      },
    );
  }

  Widget _encabezado(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        width: _width,
        color: Colors.white,
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10.0),
            Text(
              'Estos son tus pedidos en preparacion',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
