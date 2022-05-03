import 'package:negocioapp/src/blocs/login_bloc.dart';
import 'package:negocioapp/src/blocs/provider.dart';
import 'package:negocioapp/src/providers/usuario_provider.dart';
import 'package:negocioapp/src/widgets/lista_pedidos.dart';
import 'package:flutter/material.dart';

class PedidosActivosPage extends StatelessWidget {
  static final String routeName = 'pedidosactivos';

  @override
  Widget build(BuildContext context) {
    // final pedidos = Provider.of<ConsultaPedidos>(context).pedidos;
    final bloc = ProviderBloc.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos en curso'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 30),
          onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
        ),
      ),
      body: _listaPedidos(bloc),
      /*  floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          backgroundColor: Colors.lightGreen,
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'home');
          }), */
    );
  }

  Widget _listaPedidos(LoginBloc bloc) {
    /*   return Container(
      child: Text('Pedidos ejemplo'),
    ); */

    final usuarioProvider = new UsuarioProvider();

    //return Container();

    return FutureBuilder(
      future: usuarioProvider.pedidosEntregados(bloc.email.toString()),
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
