import 'package:negocioapp/src/blocs/login_bloc.dart';
import 'package:negocioapp/src/blocs/provider.dart';
import 'package:negocioapp/src/providers/usuario_provider.dart';
import 'package:negocioapp/src/widgets/lista_pedidos.dart';
import 'package:flutter/material.dart';

class PedidosPage extends StatelessWidget {
  static final String routeName = 'pedidos';

  @override
  Widget build(BuildContext context) {
    // final pedidos = Provider.of<ConsultaPedidos>(context).pedidos;
    final bloc = ProviderBloc.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
      ),
      body: _listaPedidos(bloc),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          backgroundColor: Colors.lightGreen,
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'home');
          }),
    );
  }

  Widget _listaPedidos(LoginBloc bloc) {
    /*   return Container(
      child: Text('Pedidos ejemplo'),
    ); */

    final usuarioProvider = new UsuarioProvider();

    //return Container();

    return FutureBuilder(
      future: usuarioProvider.datosHistorialCliente(bloc.email.toString()),
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
}
