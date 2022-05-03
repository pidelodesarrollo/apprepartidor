import 'package:negocioapp/src/blocs/provider.dart';
import 'package:negocioapp/src/providers/categorias_provider.dart';
import 'package:negocioapp/src/providers/usuario_provider.dart';
//import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'package:negocioapp/src/models/search_result.dart';

import 'package:negocioapp/services/traffic_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:negocioapp/src/models/search_response.dart';
import 'package:provider/provider.dart';

class SearchDestination extends SearchDelegate<SearchResult> {
  @override
  final String searchFieldLabel;
  final TrafficService _trafficService;
  final LatLng proximidad;
  final List<SearchResult> historial;

  SearchDestination(this.proximidad, this.historial)
      : this.searchFieldLabel = 'Buscar',
        this._trafficService = new TrafficService();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () => this.query = '')
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () => this.close(context, SearchResult(cancelo: true)),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return this._construirResultadosSugerencias();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (this.query.length == 0) {
      return ListView(
        children: [
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.transparent),
            title: Text(
              'Escribe tu calle y num. exterior para encontrar tu ubicación',
              //'Colocar ubicacion manualmente si no encuentras tu dirección',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              //this.close(context, SearchResult(cancelo: false, manual: true));
            },
          ),
          ...this.historial.map((result) => ListTile(
                leading: Icon(Icons.history),
                title: Text(result.nombreDestino),
                subtitle: Text(result.descripcion),
                onTap: () {
                  final categoryService =
                      Provider.of<CategoryService>(context, listen: false);
                  categoryService.lugarSeleccionado = result.descripcion;
                  print(result.position.latitude);
                  this.close(context, result);
                },
              ))
        ],
      );
    }
    return _construirResultadosSugerencias();
  }

  Widget _construirResultadosSugerencias() {
    // ignore: unrelated_type_equality_checks
    if (this.query == 0) {
      return Container();
    }
    this
        ._trafficService
        .getSugerenciasPorQuery(this.query.trim(), this.proximidad);
    return StreamBuilder(
      stream: this._trafficService.sugerenciasStream,
      builder: (BuildContext context, AsyncSnapshot<SearchResponse> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final lugares = snapshot.data.features;

        if (lugares.length == 0) {
          return ListTile(
            title: Text('No hay Resultados con $query'),
          );
        }

        return ListView.separated(
          itemCount: lugares.length,
          separatorBuilder: (_, i) => Divider(),
          itemBuilder: (_, i) {
            final lugar = lugares[i];
            return ListTile(
              leading: Icon(Icons.place),
              title: Text(lugar.textEs),
              subtitle: Text(lugar.placeNameEs),
              onTap: () {
                this.close(
                    context,
                    SearchResult(
                        cancelo: false,
                        manual: false,
                        position: LatLng(lugar.center[1], lugar.center[0]),
                        nombreDestino: lugar.textEs,
                        descripcion: lugar.placeNameEs));
                final categoryService =
                    Provider.of<CategoryService>(context, listen: false);
                categoryService.lugarSeleccionado = lugar.placeNameEs;
                print(lugar.center[1]);
                print(lugar.center[0]);

                final usuarioProvider = new UsuarioProvider();
                final bloc = ProviderBloc.of(context);

                usuarioProvider.ubicacionNegocio(bloc.email, lugar.placeNameEs,
                    lugar.center[1].toString(), lugar.center[0].toString());
                // _showInfoFlushbar(context);

                /*  Future.delayed(Duration(seconds: 5))
                    .then((_) => Navigator.pushNamed(context, 'home')); */

                //Navigator.pushNamed(context, 'home');
              },
            );
          },
        );
      },
    );
  }

/*   void _showInfoFlushbar(BuildContext context) {
    Flushbar(
      title: 'Ubicación guardada',
      message: 'Asi ya podemos llevarte tus pedidos, gracias',
      icon: Icon(
        Icons.check,
        size: 28,
        color: Colors.blue.shade300,
      ),
      leftBarIndicatorColor: Colors.blue.shade300,
      duration: Duration(seconds: 3),
    )..show(context);
  } */
}
