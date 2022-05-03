import 'package:flutter/material.dart';
import 'package:negocioapp/src/blocs/provider.dart';
import 'package:negocioapp/src/providers/usuario_provider.dart';
import 'package:negocioapp/src/widgets/lista_pedidos.dart';

class PedidosNuevosPage extends StatelessWidget {
  static final String routeName = 'pedidos_en_ruta';

  @override
  Widget build(BuildContext context) {
    final bloc = ProviderBloc.of(context);
    // final width = ;

    return Scaffold(
      body: Column(
        children: <Widget>[
          _encabezado(context),
          SizedBox(height: 5),
          Expanded(child: _listaPedidos(bloc))
        ],
      ),
    );
  }

  Widget _listaPedidos(LoginBloc bloc) {
    final usuarioProvider = new UsuarioProvider();

    //return Container();

    return FutureBuilder(
      future: usuarioProvider.pedidosNuevos(bloc.email),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return ListaPedidos(historiales: snapshot.data);
        } else {
          return Container(
              height: 10.0, child: Center(child: CircularProgressIndicator()));
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
              'Estos son tus pedidos nuevos',
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
