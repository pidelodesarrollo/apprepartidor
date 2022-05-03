import 'package:flutter/material.dart';

import 'package:negocioapp/bloc/mapa/mapa_bloc.dart';
import 'package:negocioapp/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:negocioapp/src/widgets/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  @override
  void initState() {
    // ignore: deprecated_member_use
    context.bloc<MiUbicacionBloc>().iniciarSeguimiento();
    super.initState();
  }

  @override
  void dispose() {
    // ignore: deprecated_member_use
    context.bloc<MiUbicacionBloc>().cancelarSeguimieto();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<MiUbicacionBloc, MiUbicacionState>(
              builder: (_, state) => crearMapa(state)),
          Positioned(top: 15, left: 10, child: SearchBar()),
          Positioned(top: 35, left: 2, child: BtnHome()),
          MarcadorManual(),
          Positioned(
            top: 120,
            right: 10,
            child: BtnUbicacion(),
          ),
          Positioned(bottom: 15, child: DireccionCliente()),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //BtnUbicacion(),
          // BtnSeguirUbicacion(),
          //BtnMiRuta(),
        ],
      ),
    );
  }

  Widget crearMapa(MiUbicacionState state) {
    if (!state.existeUbicacion) return Center(child: Text('Ubicando...'));

    // ignore: close_sinks
    final mapaBloc = BlocProvider.of<MapaBloc>(context);

    mapaBloc.add(OnNuevaUbicacion(state.ubicacion));

    final cameraPosition = CameraPosition(target: state.ubicacion, zoom: 15);

    return BlocBuilder<MapaBloc, MapaState>(
      builder: (context, state) {
        return GoogleMap(
          initialCameraPosition: cameraPosition,
          myLocationButtonEnabled: false,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          onMapCreated: mapaBloc.initMapa,
          polylines: mapaBloc.state.polylines.values.toSet(),
          markers: mapaBloc.state.markers.values.toSet(),
          onCameraMove: (cameraPosition) {
            mapaBloc.add(OnMovioMapa(cameraPosition.target));
          },
        );
      },
    );

    //Text('${state.ubicacion.latitude},${state.ubicacion.longitude}');
  }
}
