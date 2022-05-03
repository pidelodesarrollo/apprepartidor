part of 'widgets.dart';

class DireccionCliente extends StatefulWidget {
  @override
  _DireccionClienteState createState() => _DireccionClienteState();
}

class _DireccionClienteState extends State<DireccionCliente> {
  @override
  Widget build(BuildContext context) {
    return _direccionCliente(context);
  }
}

Widget _direccionCliente(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  UbicacionModel ubica = new UbicacionModel();
  final width = MediaQuery.of(context).size.width;

  final categoryService = Provider.of<CategoryService>(context);

  final bloc = ProviderBloc.of(context);

  return SafeArea(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      width: width,
      child: GestureDetector(
        onTap: () async {
          _submit(ubica, formKey, bloc);
          showInfoFlushbar(context);
          Future.delayed(Duration(seconds: 5))
              .then((_) => Navigator.pushNamed(context, 'home'));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
          width: double.infinity,
          height: 210,
          child: Column(
            children: [
              Text('¿Esta es tu direccion?',
                  style: TextStyle(color: Colors.black87, fontSize: 13)),
              SizedBox(
                height: 2,
              ),
              Text(categoryService.lugarSeleccionado,
                  style: TextStyle(fontSize: 13)),
              Container(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      _numInterior(ubica),
                      _entreCalles(ubica),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text('Presiona aqui para guardar, OK',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(0, 5))
              ]),
        ),
      ),
    ),
  );
}

Widget _numInterior(UbicacionModel ubica) {
  return TextFormField(
    initialValue: ubica.numero,
    decoration: InputDecoration(labelText: 'Número Interior'),
    style: TextStyle(fontSize: 12),
    onSaved: (value) => ubica.numero = value,
  );
}

Widget _entreCalles(UbicacionModel ubica) {
  return TextFormField(
    initialValue: ubica.entrecalles,
    decoration: InputDecoration(labelText: ' Entre las calles'),
    style: TextStyle(fontSize: 12),
    onSaved: (value) => ubica.entrecalles = value,
  );
}

void _submit(UbicacionModel ubica, formKey, LoginBloc bloc) {
  formKey.currentState.save();
  final usuarioProvider = new UsuarioProvider();

  usuarioProvider.detalleUbicacionNegocio(
      bloc.email, ubica.numero, ubica.entrecalles);
  // _showInfoFlushbar(context);
}

void showInfoFlushbar(BuildContext context) {
  Flushbar(
    title: 'Ubicacion guardada',
    message: 'Ahora ya podemos enviarte tu pedido, gracias',
    icon: Icon(
      Icons.save,
      size: 28,
      color: Colors.blue.shade300,
    ),
    leftBarIndicatorColor: Colors.blue.shade300,
    duration: Duration(seconds: 3),
  )..show(context);
}

/* class DireccionCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _direccionCliente(context);
  }
}

Widget _direccionCliente(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  final width = MediaQuery.of(context).size.width;

  final categoryService = Provider.of<CategoryService>(context);

  return SafeArea(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      width: width,
      child: GestureDetector(
        onTap: () async {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
          width: double.infinity,
          height: 200,
          child: Column(
            children: [
              Text('¿Esta es tu direccion?',
                  style: TextStyle(color: Colors.black87, fontSize: 13)),
              SizedBox(
                height: 2,
              ),
              Text(categoryService.lugarSeleccionado,
                  style: TextStyle(fontSize: 13)),
              Container(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      _numInterior(),
                      _entreCalles(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text('Presiona aqui para guardar, OK',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(0, 5))
              ]),
        ),
      ),
    ),
  );
}

Widget _numInterior() {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Número Interior'),
    style: TextStyle(fontSize: 12),
  );
}

Widget _entreCalles() {
  return TextFormField(
    decoration: InputDecoration(labelText: ' Entre las calles'),
    style: TextStyle(fontSize: 12),
  );
}
 */
