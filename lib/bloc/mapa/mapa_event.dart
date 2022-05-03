part of 'mapa_bloc.dart';

@immutable
abstract class MapaEvent {}

class OnMapaListo extends MapaEvent {}

class OnMarcarRecorido extends MapaEvent {}

class OnCrearRutainicioDestino extends MapaEvent {
  final List<LatLng> rutaCoordenadas;
  final double distancia;
  final double duracion;
  final String nombreDestino;

  OnCrearRutainicioDestino(
      this.rutaCoordenadas, this.distancia, this.duracion, this.nombreDestino);
}

class OnMovioMapa extends MapaEvent {
  final LatLng centroMapa;

  OnMovioMapa(this.centroMapa);
}

class OnSeguirUbicacion extends MapaEvent {}

class OnNuevaUbicacion extends MapaEvent {
  final LatLng ubicacion;

  OnNuevaUbicacion(this.ubicacion);
}
