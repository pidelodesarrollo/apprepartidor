import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negocioapp/bloc/busqueda/busqueda_bloc.dart';
import 'package:negocioapp/bloc/mapa/mapa_bloc.dart';
import 'package:negocioapp/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:negocioapp/src/blocs/provider.dart';
import 'package:negocioapp/src/blocs2/provider2.dart';

import 'package:negocioapp/src/pages/ayuda_page.dart';
import 'package:negocioapp/src/pages/balance_page.dart';
import 'package:negocioapp/src/pages/catalogo_page.dart';
import 'package:negocioapp/src/pages/home_page.dart';
import 'package:negocioapp/src/pages/infocliente_page.dart';
import 'package:negocioapp/src/pages/inicio_page.dart';
import 'package:negocioapp/src/pages/login/login_page.dart';
import 'package:negocioapp/src/pages/page_ayuda/articulos_ped_page.dart';
import 'package:negocioapp/src/pages/page_ayuda/cuenta_page.dart';
import 'package:negocioapp/src/pages/page_ayuda/dudas_pages.dart';
import 'package:negocioapp/src/pages/page_ayuda/ofrece_page.dart';
import 'package:negocioapp/src/pages/page_ayuda/pedidos_page.dart';
import 'package:negocioapp/src/pages/page_ayuda/pedidosactivos_page.dart';
import 'package:negocioapp/src/pages/page_ayuda/reporte_page.dart';
import 'package:negocioapp/src/pages/pedidos_en_proceso_page.dart';
import 'package:negocioapp/src/pages/pedidos_nuevos_page.dart';
import 'package:negocioapp/src/pages/ubicacion/acceso_gps_page.dart';
import 'package:negocioapp/src/pages/ubicacion/loading_page.dart';
import 'package:negocioapp/src/pages/ubicacion/mapa_page.dart';
import 'package:negocioapp/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:negocioapp/src/providers/categorias_provider.dart';
import 'package:negocioapp/src/providers/pedidos_provider.dart';
import 'package:negocioapp/src/providers/push_notifications_provider.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;

  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    final pushProvider = new PushNotificationsProvider();
    pushProvider.initNotifications();
    pushProvider.mensajesStream.listen((data) {
      //print('argumento desde main $argumento');
      //Navigator.pushNamed(context, 'pedidos_nuevos');
      navigatorKey.currentState.pushNamed('pedidos_nuevos', arguments: data);
    });
  }

  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();

    print(prefs.token);

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.lightGreen));
    return MultiProvider(
      providers: [
        Provider<ConsultaPedidos>(create: (_) => ConsultaPedidos()),
        ChangeNotifierProvider(create: (_) => new CategoryService()),
        BlocProvider(create: (_) => MiUbicacionBloc()),
        BlocProvider(create: (_) => MapaBloc()),
        BlocProvider(create: (_) => BusquedaBloc()),
      ],
      child: ProviderBloc2(
        child: ProviderBloc(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            title: 'Negocio App',
            initialRoute: 'login',
            routes: <String, WidgetBuilder>{
              'login': (BuildContext context) => LoginPage(),
              'home': (BuildContext context) => HomePage(),
              'inicio': (BuildContext context) => InicioPage(),
              'ayuda': (BuildContext context) => AyudaPage(),
              'pedidos_nuevos': (BuildContext context) => PedidosNuevosPage(),
              'pedidos_en_proceso': (BuildContext context) =>
                  PedidosEnProcesoPage(),
              'cuenta': (BuildContext context) => CuentaPage(),
              'dudas': (BuildContext context) => DudasPage(),
              'ofrece': (BuildContext context) => OfrecePage(),
              'reporte': (BuildContext context) => ReportePage(),
              'pedidos': (BuildContext context) => PedidosPage(),
              'pedidosactivos': (BuildContext context) => PedidosActivosPage(),
              'articulosactivos': (BuildContext context) => ArticulosPedidos(),
              'infocliente': (BuildContext context) => InfoClientePage(),
              'mapa': (BuildContext context) => MapaPage(),
              'loading': (BuildContext context) => LoadingPage(),
              'acceso_gps': (BuildContext contex) => AccesoGpsPage(),
              'balance': (BuildContext context) => BalancePage(),
              'catalogo': (BuildContext context) => CatalogPage(),
            },
            theme: ThemeData(primaryColor: Colors.lightGreen[300]),
          ),
        ),
      ),
    );
  }
}
