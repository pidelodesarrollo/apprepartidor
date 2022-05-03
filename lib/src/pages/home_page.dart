import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:negocioapp/src/pages/ayuda_page.dart';
import 'package:negocioapp/src/pages/inicio_page.dart';
import 'package:negocioapp/src/pages/pedidos_en_proceso_page.dart';
import 'package:negocioapp/src/pages/pedidos_en_ruta_page.dart';
import 'package:negocioapp/src/pages/pedidos_nuevos_page.dart';
import 'package:negocioapp/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:negocioapp/src/widgets/menu_widget.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static final String routeName = 'home';

  @override
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: _appBar(context),
        drawer: MenuWidget(),
        body: _callPage(currentIndex),
        bottomNavigationBar: _bottomNavigationBar(context),
      ),
    );
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return InicioPage();
      case 1:
        return PedidosNuevosPage();
      case 2:
        return PedidosEnProcesoPage();
      case 3:
        return PedidosEnRutaPage();
      case 4:
        return AyudaPage();

      default:
        return PedidosNuevosPage();
    }
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {
          _scaffoldKey.currentState.openDrawer();
        },
      ),
      title: RichText(
        text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.bold),
          children: [
            /* TextSpan(
              text: "Pídelo ",
              style: TextStyle(color: Colors.lightGreen),
            ),
            TextSpan(
              text: "Yaa!",
              style: TextStyle(color: Colors.black), 
            ),*/
          ],
        ),
      ),
      flexibleSpace: Column(
        children: [
          /* SizedBox(
            height: 29,
          ),
          Container(
            height: 47,
            child: Image.asset(
              "assets/icon/icononegro.png",
              width: 73.0,
            ),
          ), */
        ],
      ),

      /* Image(
        image: AssetImage("assets/icon/icononegro.png"),
        fit: BoxFit.contain,
      ), */
      actions: <Widget>[
        /* RaisedButton.icon(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            color: Colors.white,
            textColor: Colors.lightGreen,
            icon: Icon(FontAwesomeIcons.locationArrow),
            label: Text('Ubicame'),
            onPressed: () {}), */
        /* IconButton(
          icon: SvgPicture.asset("assets/icons/bag.svg"),
          onPressed: () {},
        ), */
        /*  IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(
              context: context,
              delegate: DataSearch(),
              query: '',
            );
          },
        ), */
      ],
      centerTitle: true,
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    // ignore: unused_local_variable
    //final consultaPedidos = Provider.of<ConsultaPedidos>(context);

    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(96, 178, 44, 1.0),
          primaryColor: Colors.black,
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Colors.black))),
      child: BottomNavigationBar(
        backgroundColor: Colors.lightGreen,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 40.0,
              ),
              // ignore: deprecated_member_use
              title: Text('Inicio')),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.receipt,
              size: 30.0,
            ),
            // ignore: deprecated_member_use
            title: Text('Nuevos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.solidHandPaper,
              size: 30.0,
            ),
            // ignore: deprecated_member_use
            title: Text('Preparando'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.motorcycle,
              size: 40.0,
            ),
            // ignore: deprecated_member_use
            title: Text('Para enviar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.help,
              size: 35.0,
            ),
            // ignore: deprecated_member_use
            title: Text('Ayuda'),
          ),
        ],
      ),
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    notifyListeners();
  }
}
