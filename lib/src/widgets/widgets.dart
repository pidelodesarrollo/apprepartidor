import 'package:negocioapp/src/blocs/provider.dart';
import 'package:negocioapp/src/models/ubicacion_model.dart';
import 'package:negocioapp/src/providers/categorias_provider.dart';
import 'package:negocioapp/src/providers/usuario_provider.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:negocioapp/src/models/search_result.dart';

import 'package:negocioapp/src/search/search_destination.dart';

import 'package:negocioapp/bloc/mapa/mapa_bloc.dart';
import 'package:negocioapp/bloc/busqueda/busqueda_bloc.dart';
import 'package:negocioapp/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:polyline/polyline.dart' as Poly;

import 'package:negocioapp/helpers/helpers.dart';

import 'package:negocioapp/services/traffic_service.dart';
import 'package:provider/provider.dart';

part 'btn_ubicacion.dart';
part 'btn_mi_ruta.dart';
part 'btn_seguir_ubicacion.dart';
part 'searchbar.dart';
part 'marcador_manual.dart';
part 'btn_home.dart';
part 'direccion_cliente.dart';
