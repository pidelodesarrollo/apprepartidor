import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart' as Geolocator;

import 'package:meta/meta.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

part 'mi_ubicacion_event.dart';
part 'mi_ubicacion_state.dart';

class MiUbicacionBloc extends Bloc<MiUbicacionEvent, MiUbicacionState> {
  MiUbicacionBloc() : super(MiUbicacionState());

  StreamSubscription<Geolocator.Position> _positionSubsCription;

  void iniciarSeguimiento() {
    // ignore: deprecated_member_use

    // ignore: deprecated_member_use
    _positionSubsCription = Geolocator.getPositionStream(
            desiredAccuracy: Geolocator.LocationAccuracy.high,
            distanceFilter: 10)
        .listen((Geolocator.Position position) {
      final nuevaUbicacion = new LatLng(position.latitude, position.longitude);
      add(OnUbicacionCambio(nuevaUbicacion));
    });
  }

  void cancelarSeguimieto() {
    _positionSubsCription?.cancel();
  }

  @override
  Stream<MiUbicacionState> mapEventToState(
    MiUbicacionEvent event,
  ) async* {
    if (event is OnUbicacionCambio) {
      yield state.copyWith(existeUbicacion: true, ubicacion: event.ubicacion);
    }
  }
}
