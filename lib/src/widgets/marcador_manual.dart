part of 'widgets.dart';

class MarcadorManual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusquedaBloc, BusquedaState>(
      builder: (context, state) {
        if (state.seleccionManual) {
          return _BuildMarcadorManual();
        } else {
          return Container();
        }
      },
    );
  }
}

class _BuildMarcadorManual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        // Boton regresar
        Positioned(
            top: 70,
            left: 20,
            child: FadeInLeft(
              duration: Duration(milliseconds: 150),
              child: CircleAvatar(
                maxRadius: 25,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black87,
                  ),
                  onPressed: () {
                    context
                        // ignore: deprecated_member_use
                        .bloc<BusquedaBloc>()
                        .add(OnDesactivarMarcadorManual());
                  },
                ),
              ),
            )),

        Center(
          child: Transform.translate(
            offset: Offset(0, -12),
            child: BounceInDown(
              child: Icon(
                Icons.location_on,
                size: 70,
                color: Colors.lightGreen,
              ),
            ),
          ),
        ),

        // Boton de confirmar destino

        Positioned(
            bottom: 25,
            left: 40,
            child: FadeIn(
              child: MaterialButton(
                minWidth: width - 120,
                child: Text(
                  'Confirmar punto de entrega',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.black,
                shape: StadiumBorder(),
                elevation: 0,
                splashColor: Colors.transparent,
                onPressed: () {
                  this.calcularDestino(context);
                },
              ),
            ))
      ],
    );
  }

  void calcularDestino(BuildContext context) async {
    calculandoAlerta(context);

    final trafficService = new TrafficService();

    // ignore: deprecated_member_use
    final mapaBloc = context.bloc<MapaBloc>();
    // ignore: deprecated_member_use
    final inicio = context.bloc<MiUbicacionBloc>().state.ubicacion;
    // ignore: deprecated_member_use
    final destino = mapaBloc.state.ubicacionCentral;
    // Obtener informacion del destino

    final reverseQueryResponse =
        await trafficService.getCoorenadasInfo(destino);

    final traficResponse =
        await trafficService.getCoordsInicioYFin(inicio, destino);
    // Decodificar los puntos del geometry

    final geometry = traficResponse.routes[0].geometry;
    final duracion = traficResponse.routes[0].duration;
    final distancia = traficResponse.routes[0].distance;
    final nombreDestino = reverseQueryResponse.features[0].placeName;

    final points = Poly.Polyline.Decode(encodedString: geometry, precision: 6)
        .decodedCoords;
    final List<LatLng> rutaCoordenadas =
        points.map((point) => LatLng(point[0], point[1])).toList();

    mapaBloc.add(OnCrearRutainicioDestino(
        rutaCoordenadas, distancia, duracion, nombreDestino));

    Navigator.of(context).pop();

    context
        // ignore: deprecated_member_use
        .bloc<BusquedaBloc>()
        .add(OnDesactivarMarcadorManual());
  }
}
